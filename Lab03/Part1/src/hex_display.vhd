library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_display is

  port( SW : in signed (3 downto 0);
        HEXA : out std_logic_vector ( 0 to 6)
      );

end hex_display;


architecture behaviour of hex_display is

begin

  with SW select
    HEXA <=
      "0000001" when "0000",
      "1001111" when "0001",
      "0010010" when "0010",
      "0000110" when "0011",
      "1001100" when "0100",
      "0100100" when "0101",
      "0100000" when "0110",
      "0001111" when "0111",
      "0000000" when "1000",
      "0000100" when "1001",
      "0001000" when "1010", -- A
      "1100000" when "1011", -- b
      "0110001" when "1100", -- C
      "1000010" when "1101", -- d
      "0110000" when "1110", -- E
      "0111000" when "1111", -- F
      "1111111" when others; --black for undefined values

end architecture;
