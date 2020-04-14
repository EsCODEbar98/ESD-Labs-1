library ieee;
use ieee.std_logic_1164.all;
-- empty entity section
entity ToggleFF_tb is
end ToggleFF_tb;

architecture test of ToggleFF_tb is

component  ToggleFF is
    port (
     t, clk, clear : in std_logic;
            q : out std_logic
        );
  end component;

  signal clock, clear_dut, t_dut : std_logic;
  signal q_dut : std_logic;

begin

clear_dut<= '0', '1' after 5 ns;

DUT : ToggleFF port map(t_dut, clock, clear_dut, q_dut);

    CLK_PR : process begin
          clock <= '0';
          wait for 10 ns;
         clock <= '1';
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
