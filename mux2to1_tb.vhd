library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2to1 is
end tb_mux2to1;

architecture Behavioral of tb_mux2to1 is
  
  --component employed in this circuit
  component mux2to1
  port (
        x, y : in std_logic_vector(7 downto 0);
        s : in std_logic;
        m : out std_logic_vector(7 downto 0)
  );
  end component;
    
  --Testbench signals
  
  signal x, y, m : std_logic_vector(7 downto 0);
  signal s : std_logic;

  begin 
    x <= "00000000";
    y <= "11111111";
    
    -- stimulus process
    process
        begin      
          s <= '0';
          wait for 20 ns;
          s <= '1';
          wait for 20 ns;
      end process;
end Behavioral;
  
       


        
  
       
