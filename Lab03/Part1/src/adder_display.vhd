library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_display is

  --KEY -> clk, KEY0 -> RST, SW(15->8) -> A,
  --SW(7->0) ->B,LEDR ->S,LEDG8 -> ovf_det,
  --HEX7_6 -> A display, HEX5_4 -> B dspaly, HEX1_0 S_display
  port (
      SW : in signed ( 15 downto 0 );
      KEY1,KEY0 : in std_logic;
      LEDG8 : out std_logic;
      LEDR : inout signed ( 7 downto 0 );
      HEX7,HEX6,HEX5,HEX4,HEX1,HEX0 : out std_logic_vector(0 to 6)
       );
end adder_display;

architecture struct of adder_display is

  component reg_adder_8b is

    generic (n : integer := 8);

    port ( R1,R2 : in signed ( n-1 downto 0 );
           c_in : in std_logic;
           clk,Rst : in std_logic;
           c_out : out std_logic;
           ovf_det : out std_logic;
           S : out signed ( n-1 downto 0 )
         );

  end component;

  component RCA
    generic (n : integer := 8);

    port (
      R1,R2 : in signed ( n-1 downto 0 );
      c_in : in std_logic;
      clk,Rst : in std_logic;
      c_out : out std_logic;
      ovf_det : out std_logic;
      S : out signed ( n-1 downto 0 )
       );
  end component;

  component hex_display
    port(
      SW : in signed (3 downto 0);
      HEXA : out std_logic_vector ( 0 to 6)
      );
  end component;

  signal c_out : std_logic;


begin

  ADD: reg_adder_8b port map(SW(15 downto 8), SW(7 downto 0), '0', KEY1, KEY0, c_out, LEDG8, LEDR);

  --A display
  HEXA7: hex_display port map(SW(15 downto 12),HEX7);
  HEXA6: hex_display port map(SW(11 downto 8),HEX6);

  --B display
  HEXA5: hex_display port map(SW(7 downto 4),HEX5);
  HEXA4: hex_display port map(SW(3 downto 0),HEX4);

  --S display
  HEXA1: hex_display port map(LEDR(7 downto 4),HEX1);
  HEXA0: hex_display port map(LEDR(3 downto 0),HEX0);


end architecture;
