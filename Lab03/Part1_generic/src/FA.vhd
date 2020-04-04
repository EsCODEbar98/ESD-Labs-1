library ieee;
use ieee.std_logic_1164.all;


entity FA is
  
  port( a,b : in std_logic;
        c_in : in std_logic;
        s,c_out: out std_logic
      );
      
 end FA;
 
 architecture struct of FA is
   
   signal p : std_logic;
   
  begin
    
    p <= a xor b;
    s <= c_in xor p;
    
    with p select
    
      c_out <=
        
        b when '0',
        c_in when others;
        
  end architecture;
        
