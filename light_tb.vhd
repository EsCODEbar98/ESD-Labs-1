library ieee;
use ieee.std_logic_1164.all;

entity light_tb is
end light_tb;

architecture Behavioral  of light_tb is

  --device under test

--signals
signal sw_dut,ledr_dut : std_logic_vector (17 downto 0);
signal ledr_ref : std_logic_vector (17 downto 0);

begin
  -- implicit process testcase

  sw_dut(17) <= '0';
  sw_dut(16) <= '0' after  5 ns;
  sw_dut(15) <= '1' after 10 ns;
  sw_dut(14) <= '0' after  15 ns;
  sw_dut(13) <= '1' after 20 ns;
  sw_dut(12) <= '0' after  25 ns;
  sw_dut(11) <= '0' after 30 ns;
  sw_dut(10) <= '1' after 35 ns;
  sw_dut(9) <= '1' after 40 ns;
  sw_dut(8) <= '1' after 45 ns;
  sw_dut(7) <= '0' after 50 ns;
  sw_dut(6) <= '0' after 55 ns;
  sw_dut(5) <= '0' after 60 ns;
  sw_dut(4) <= '1' after 65 ns;
  sw_dut(3) <= '0' after 70 ns;
  sw_dut(2) <= '1' after 75 ns;
  sw_dut(1) <= '0' after 80 ns;
  sw_dut(0) <= '1' after 85 ns;



-- testing instance
DUT: entity work.light port map (sw_dut , ledr_dut);
ledr_ref <= sw_dut ;

end behavioral;
