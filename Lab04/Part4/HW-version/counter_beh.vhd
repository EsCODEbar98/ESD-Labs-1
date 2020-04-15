library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (n : integer := 16);
  port ( EN, clk, clr : in std_logic;
         Q : buffer unsigned (n-1 downto 0) 
       );
end counter;


architecture beh of counter is
  
  
  
  
  
begin 
  
  COUNT_GEN: process (clk,clr)
    
    begin
      if clr='0' then
        Q <= (others => '0');
    elsif clk'event and clk='1' then
      if EN='1' then
        Q <= Q + 1;
      end if;
    end if;
    
  end process;
   
   
     
end architecture;
    
    
  
         

