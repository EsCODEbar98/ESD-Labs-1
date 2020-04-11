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
         q : out std_logic_vector(n-1 downto 0)
         );
  end component;

  signal clock, reset, en_dut : std_logic;
  signal cnt_dut : std_logic_vector(n-1 downto 0);
  signal cnt_ref : integer;
  begin

    reset <= '0';

    process
      begin
      clock <= '0', '1' after 5 ns;
      wait for 10 ns;
    end process;
     en_dut <= '1';
    DUT: counter generic map (n) port  map (en_dut, clock, reset, cnt_dut);
 --  cnt_ref <= to_integer(cnt_dut);

end test;
