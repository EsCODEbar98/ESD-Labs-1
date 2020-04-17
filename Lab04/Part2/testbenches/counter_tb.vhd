library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- empty entity section
entity counter_tb is
end counter_tb;

architecture test of counter_tb is

constant n : integer := 16;
  component counter
generic (n:integer);--parallelismo
    port (
    en, clk, rst : in std_logic;
         q : buffer unsigned (n-1 downto 0)
         );
  end component;

  signal clock, reset, en_dut : std_logic;
  signal cnt_dut : unsigned(n-1 downto 0);


  begin

    reset <= '0','1' after 5 ns ;
     en_dut <= '1';

    DUT: counter generic map (n) port  map (en_dut, clock, reset, cnt_dut);


      CLK_PR : process begin
      clock <= '0';
      wait for 10 ns;
      clock <= '1';
      wait for 10 ns;
    end process;



end test;
