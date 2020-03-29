Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_A_tb is
end circuit_A_tb;

Architecture struct of circuit_A_tb is
  
  signal input_number : UNSIGNED (2 downto 0);
  signal u_dut : UNSIGNED (2 downto 0); 
  

begin
  process
  begin
       input_number <= "010";
       WAIT FOR 20 ns;
       input_number <= "011";
       WAIT FOR 20 ns;
       input_number <= "100";
       WAIT FOR 20 ns;
       input_number <= "101";
       WAIT FOR 20 ns;
       input_number <= "110";
       WAIT FOR 20 ns;
       input_number <= "111";
       WAIT FOR 20 ns;
  end process; 
  
  CIRCUIT_A: entity work.circuit_A port map( input_number, u_dut );
  
end architecture;
