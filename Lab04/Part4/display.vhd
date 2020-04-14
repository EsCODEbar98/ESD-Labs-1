library ieee;
use ieee.std_logic_1164.all;


entity display is
  port(
    S  : in integer;
    D : out std_logic_vector(0 to 6)
  );
end display;


architecture behavior of display is

begin
  with S select
  D <=
    "0000001" when 0, -- 0
    "1001111" when 1, -- 1
    "0010010" when 2, -- 2
    "0000110" when 3, -- 3
    "1001100" when 4, -- 4
    "0100100" when 5, -- 5
    "0100000" when 6, -- 6
    "0001111" when 7, -- 7
    "0000000" when 8, -- 8
    "0000100" when 9, -- 9
    "1111111" when others; --black for undefined values

end architecture;
