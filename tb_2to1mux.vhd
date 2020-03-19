library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2to1 is
end tb_mux2to1;

architecture behavior of tb_mux2to1 is
  
  --component employed in this circuit
  component mux2to1 is
  port (
        x, y : in std_logic_vector(7 downto 0);
        s : in std_logic;
        m : out std_logic_vector(7 downto 0)
      );
  end component;
    
  --declaration of singnals employed in this circuit
  signal x : std_logic_vector(7 downto 0);
  signal y : std_logic_vector(7 downto 0);
  signal s : std_logic;
  signal m : std_logic_vector(7 downto 0);
  
  begin
    -- association between signals and ports
    port map (
      x => x,
      y => y,
      s => s,
      m => m
    );
    
    -- stimulus process
    PROCESS
      begin
        
        wait for 20 ns;
        
        x <= "00001111";
        y <= "11110000";
        s <= '0';
        
        wait for 20 ns;
        
        x <= "00000000";
        y <= "11111111";
        s <= '1';
        
        wait;
      end PROCESS;
      
    end;
    
  end architecture;
        
  
       
