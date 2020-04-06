library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CSA is
  port( 
        A,B : in signed( 15 downto 0 );
        c_in : in std_logic;
        S : out signed( 15 downto 0 );
        c_out,ovf_det : out std_logic
      );
end CSA;



architecture behaviour of CSA is
  
 component CSA_block
   
    port( 
        a,b : in signed( 3 downto 0 );
        c_in : in std_logic;
        s : out signed( 3 downto 0 );
        c_out : out std_logic
      );
      
  end component;
  
  
  signal carries : std_logic_vector ( 4 downto 0 );
  
  
  
  
begin
  
  carries(0) <= c_in;
  
  GEN: for i in 0 to 3 generate
    
    BLK: CSA_block port map (A( (i*4+3) downto i*4), B( (i*4+3) downto i*4), carries(i), s( (i*4+3) downto i*4),carries(i+1));
     
    
  end generate;
  
  c_out <= carries(4);
  
  
  
end architecture;
