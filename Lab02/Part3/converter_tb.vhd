LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


Entity converter_tb is
end converter_tb;

Architecture struct of converter_tb is
  
  signal input_number : UNSIGNED (3 downto 0);
  signal z_dut : STD_LOGIC;
  signal m_dut : STD_LOGIC_VECTOR (3 downto 0);

  component converter 
    port (  v : in UNSIGNED(3 downto 0);
            m : out STD_LOGIC_VECTOR(3 downto 0);
            z : out STD_LOGIC);
  end component;
  
begin
  
  
  input_number <= "0000", "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, 
      	           "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, 
      	           "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns,
      	           "1010" after 50 ns, "1011" after 55 ns, "1100" after 60 ns,
      	           "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns;
  
  CONV: converter port map( input_number, m_dut, z_dut);
    
end architecture;
