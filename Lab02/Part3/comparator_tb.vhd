Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity comparator_tb is
end comparator_tb;

Architecture struct of comparator_tb is
  
  signal input_number : UNSIGNED (3 downto 0);
  signal z_dut : STD_LOGIC;
  
begin
  
  input_number <= "0101", "0111" after 5 ns, "1111" after 10 ns, "1001" after 15 ns, "1010" after 20 ns;
  COMPARATOR: entity work.comparator port map (input_number, z_dut); 
  
end struct;
