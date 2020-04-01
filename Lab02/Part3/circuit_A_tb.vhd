Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_A_tb is
end circuit_A_tb;

Architecture struct of circuit_A_tb is
  
  signal input_number : UNSIGNED (2 downto 0);
  signal u_dut : UNSIGNED (2 downto 0); 
  
  component circuit_A
     PORT (v : IN UNSIGNED(2 DOWNTO 0);
           u : OUT UNSIGNED(2 DOWNTO 0));
   end component;

begin
  
  input_number <= "010", "011" after 5 ns,"100" after 10 ns, "101" after 15 ns, "110" after 20 ns,"111" after 25 ns;
   
  
  CIRC_A: circuit_A port map( input_number, u_dut );
  
end architecture;
