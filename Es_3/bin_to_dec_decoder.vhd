Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity bin_to_dec_decoder is
  
  port ( m : in STD_LOGIC_VECTOR (3 downto 0);
         HEXA0 : out STD_LOGIC_VECTOR (0 to 6 )
      );


end bin_to_dec_decoder;

Architecture k_map of bin_to_dec_decoder is
  
begin 
  
  HEXA0(0) <= (NOT(m(1)) AND m(0) AND NOT(m(3)) AND NOT(m(2))) OR (NOT(m(0)) AND NOT(m(1)) AND NOT(m(3)) AND m(2));
  HEXA0(1) <= (m(1) AND NOT(m(0)) AND m(2)) OR (NOT(m(1)) AND m(0) AND NOT(m(3)));
  HEXA0(2) <= (NOT(m(1)) AND m(0) AND NOT(m(2)) AND NOT(m(3))) OR (NOT(m(0)) AND NOT(m(3)) AND NOT(m(2)) AND m(1));
  HEXA0(3) <= (NOT(m(1)) AND NOT(m(3)) AND NOT(m(2)) AND m(0)) OR (NOT(m(0)) AND m(2) AND NOT(m(1))) OR (m(0) AND m(1) AND m(2));
  HEXA0(4) <= (m(0) AND m(1)) OR (m(2) AND NOT(m(1))) OR (m(3) AND m(0));
  HEXA0(5) <= (m(0) AND m(1)) OR (NOT(m(2)) AND NOT (m(3)) AND m(1));
  HEXA0(6) <= (NOT(m(2)) AND NOT (m(3)) AND NOT(m(1))) OR (m(0) AND m(1) AND m(2));
  
end architecture;
