library ieee;
use ieee.std_logic_1164.all;

entity light_tb is
end light_tb;

architecture Behavioral  of light_tb is

  --device under test

--signals
signal sw_dut,ledr_dut : std_logic_vector (17 downto 0);

begin
  -- implicit process testcase

  
  sw_dut <= "111111111111111111", "000000000000000000" after 5 ns;
 
 
 


-- testing instance
DUT: entity work.light port map (sw_dut , ledr_dut);

end Behavioral;
