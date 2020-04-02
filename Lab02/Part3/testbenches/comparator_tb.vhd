library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity comparator_tb is
end comparator_tb;

architecture struct of comparator_tb is
  
  signal input_number : unsigned (3 downto 0);
  signal z_dut : std_logic;
  
  component comparator
    port( 
         v : in unsigned(3 downto 0);
         z : out std_logic
   );
  end component;
  
begin
  
  input_number <= "0101", "0111" after 5 ns, "1111" after 10 ns, "1001" after 15 ns, "1010" after 20 ns;
  COMP: comparator port map (input_number, z_dut); 
  
end struct;
