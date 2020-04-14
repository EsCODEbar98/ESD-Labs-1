library ieee;
use ieee.std_logic_1164.all;

entity counter0to9_tb is
end entity;

architecture test of counter0to9_tb is
  component counter0to9 is
    port(
      KEY0, CLOCK_50 : in std_logic;
      HEX0           : out std_logic_vector(0 to 6)
    );
  end component;

  signal clr, clk : std_logic := '0';
  signal bcd : std_logic_vector(6 downto 0);
  constant Ts : time := 20 ns ;

  begin
  UUT : counter0to9 port map (clr, clk, bcd);
  -- one raising edge for each 20 ns block
  -- after 5e7 edges ,i.e. after 1 sec
  -- the 7 seg display increases its value
  CLK_PR: process begin
      clk <= '1';
      wait for Ts/2;
      clk <= '0';
      wait for Ts/2;
  end process;

end architecture;
