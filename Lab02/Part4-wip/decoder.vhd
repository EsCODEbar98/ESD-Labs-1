library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_dec_decoder is
port ( 
     m : in std_logic_vector (3 downto 0);
     HEX0 : out std_logic_vector (0 to 6 )
);
end bin_to_dec_decoder;

architecture k_map of bin_to_dec_decoder is
begin 
  
  HEX0(0) <= (not m(3) and not m(2) and not m(1) and m(0)) or (m(2) and not m(1) and not m(0)); 

  HEX0(1) <= m(2) and (m(1) xor m(0));

  HEX0(2) <= not m(0) and m(1) and not m(2);

  HEX0(3) <= (not m(3) and not m(2) and not m(1) and m(0)) or (m(2) and not m(1) and not m(0)) or (m(2) and m(1) and m(0));

  HEX0(4) <= m(0) or (m(2) and not m(1));

  HEX0(5) <= (not m(3) and not m(2) and m(0)) or (not m(2) and m(1)) or (m(1) and m(0));

  HEX0(6) <= (not m(2)  and not m(3) and not m(1)) or (m(0) and m(1) and m(2));
  
end architecture;
