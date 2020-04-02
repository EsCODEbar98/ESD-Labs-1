library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter_tb is
end converter_tb;

architecture struct of converter_tb is
 
  signal input_number : unsigned (3 downto 0);
  signal z_dut : std_logic;
  signal m_dut : std_logic_vector (3 downto 0);

  component converter 
    port (  v : in unsigned(3 downto 0);
            m : out std_logic_vector(3 downto 0);
            z : buffer std_logic
    );
  end component;
  
begin
  input_number <= "0000", "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, 
      	           "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, 
      	           "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns,
      	           "1010" after 50 ns, "1011" after 55 ns, "1100" after 60 ns,
      	           "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns;
  
  CONV: converter port map( input_number, m_dut, z_dut);
    
end architecture;
