library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult4bit_synth is
  port(
     SW : in std_logic_vector (11 downto 0);
     LEDR : buffer std_logic_vector (7 downto 0);
     HEX6 : out std_logic_vector(6 downto 0);
     HEX4 : out std_logic_vector(6 downto 0);
     HEX1 : out std_logic_vector(6 downto 0);
     HEX0 : out std_logic_vector(6 downto 0)
  );
end mult4bit_synth;

architecture behaviour of mult4bit_synth is

  component mult4bit is
    port(
       a, b : in std_logic_vector(3 downto 0);
       p : out std_logic_vector (7 downto 0)
    );
  end component;

  component hexa_display is
    port(
        SW : in std_logic_vector (3 downto 0);
        HEXA : out std_logic_vector ( 0 to 6)
        );
  end component;

  begin
    MUL : mult4bit port map(SW(11 downto 8), SW(3 downto 0), LEDR(7 downto 0));

    H6 : hexa_display port map(SW(11 downto 8), HEX6);
    H4 : hexa_display port map(SW(3 downto 0), HEX4);
    H1 : hexa_display port map(LEDR (7 downto 4), HEX1); -- last 4 bits on HEX1
    H0 : hexa_display port map(LEDR(3 downto 0), HEX0);  -- first 4 bits on HEX0
end architecture;
