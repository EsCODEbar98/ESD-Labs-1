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
    port (  v : IN UNSIGNED(3 DOWNTO 0);
            m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC);
  end component;
  
begin
  
  process
  begin
    
       input_number <= "0000";
       WAIT FOR 20 ns;
       input_number <= "0001";
       WAIT FOR 20 ns;
       input_number <= "0010";
       WAIT FOR 20 ns;
       input_number <= "0011";
       WAIT FOR 20 ns;
       input_number <= "0100";
       WAIT FOR 20 ns;
       input_number <= "0101";
       WAIT FOR 20 ns;
       input_number <= "0110";
       WAIT FOR 20 ns;
       input_number <= "0111";
       WAIT FOR 20 ns;
       input_number <= "1000";
       WAIT FOR 20 ns;
       input_number <= "1001";
       WAIT FOR 20 ns;
       input_number <= "1010";
       WAIT FOR 20 ns;
       input_number <= "1011";
       WAIT FOR 20 ns;
       input_number <= "1100";
       WAIT FOR 20 ns;
       input_number <= "1101";
       WAIT FOR 20 ns;
       input_number <= "1110";
       WAIT FOR 20 ns;
       input_number <= "1111";
       WAIT FOR 20 ns;
       
  end process; 
  
  CONV: converter port map( input_number, m_dut, z_dut);
    
end architecture;
