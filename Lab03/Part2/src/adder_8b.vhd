library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_8b is
  
  generic (n : integer := 8);
  
  port ( A,B : in signed ( n-1 downto 0 );
         add_sub : in std_logic; --sub when add_sub == 1
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 ) 
       );
       
end adder_8b;

architecture struct of adder_8b is
  
  component FA
     
   port( a,b : in std_logic;
          c_in : in std_logic;
          s,c_out: out std_logic
        );
  end component;
  
  signal carries : signed ( n downto 0);
  signal b_pos_neg : signed ( n-1 downto 0);
  
  
begin
  
  carries(0) <= add_sub;
  
  GEN: for i in 0 to n-1 generate
    
    b_pos_neg(i) <= add_sub xor B(i);
    FULL_ADDERS: FA port map( A(i), b_pos_neg(i), carries(i), S(i), carries(i+1));
      
    end generate;
    
  c_out <= carries(n);
  ovf_det <= carries(n-1) xor carries(n);
  
end architecture;
