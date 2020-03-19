  
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_mux2to1 IS
END tb_mux2to1;

ARCHITECTURE Behavior OF tb_mux2to1 IS
  
  --component employed in this circuit
  COMPONENT mux2to1
  PORT (
        x, y : in std_logic_vector(7 downto 0);
        s : in std_logic;
        m : out std_logic_vector(7 downto 0));
  END COMPONENT;
    
  --Testbench signals
  
  SIGNAL x, y, m : std_logic_vector(7 downto 0);
  SIGNAL s : std_logic;

  BEGIN
    
    
    x <= "00000000";
    y <= "11111111";
    
    -- stimulus process
      PROCESS
      BEGIN     
        s <= '0';
        WAIT FOR 20 ns;
        s <= '1';
        WAIT FOR 20 ns;
      END PROCESS;
  END Behavior;
  
       


        
  
       
