library ieee;
use ieee.std_logic_1164.all;

entity FA is
  port(
      a,b : in std_logic;
      c_in : in std_logic;
      c_out, s : out std_logic
      );
end FA;

architecture struct of FA is
   signal p : std_logic;  -- tmp signal

   begin
    p <= a xor b;
    s <= c_in xor p;
    c_out <= b when (p = '0') else c_in;
end architecture;
