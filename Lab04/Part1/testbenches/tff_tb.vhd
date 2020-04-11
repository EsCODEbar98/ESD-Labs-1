library ieee;
use ieee.std_logic_1164.all;
-- empty entity section
entity tff_tb is
end tff_tb;

architecture test of tff_tb is

component  tff is
    port (
     t, clk, rst : in std_logic;
            q : out std_logic
        );
  end component;

  signal clk_dut, rst_dut, t_dut : std_logic;
  signal q_dut : std_logic;

begin

rst_dut<= '1';

DUT : tff port map(t_dut, clk_dut, rst_dut, q_dut);

process
  begin

  clk_dut <= '0', '1' after 5 ns;
  wait for 10 ns;
end process;

process
  begin
    t_dut <= '0';
    wait for 10 ns;
    t_dut <= '1';
    wait for 10 ns;
end process;
end test;
