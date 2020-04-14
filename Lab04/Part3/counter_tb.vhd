library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;


architecture test of counter_tb is

  component counter is
  generic (N : integer := 16);
  port(
      en, clk, clear : in std_logic;
      Q : out unsigned (N-1 downto 0)
  );
 end component;

 constant M : integer := 16; -- testing 16 bit counter
 signal en, clk, clr : std_logic;
 signal Q_dut : unsigned (M - 1 downto 0);

 begin
   DUT : counter generic map (M) port map (en,clk, clr, Q_dut);

   CLK_PR : process begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
   end process;

   RST_PR : process begin
     clr <= '1';
     wait for 20 ns;
     clr <= '0';
     wait;
   end process;



end architecture;
