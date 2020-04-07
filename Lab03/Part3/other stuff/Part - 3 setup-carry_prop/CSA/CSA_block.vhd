library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CSA_block is
  port( 
        a,b : in signed( 3 downto 0 );
        c_in : in std_logic;
        s : out signed( 3 downto 0 );
        c_out : out std_logic
      );
end CSA_block;

architecture behaviour of CSA_block is
  
  component setup
   
    port( a,b : in std_logic;
        p,g : out std_logic
      );
      
  end component;
  
  
  component carry_prop
    
    port( p,g,c_in : in std_logic;
        s,c_out : out std_logic
      );
      
  end component;
  
  signal p,g : std_logic_vector ( 3 downto 0 );
  signal carries_0,carries_1 : std_logic_vector ( 4 downto 0 );
  signal sum_0,sum_1 : signed ( 3 downto 0 );
  
  
  
begin
  
  carries_0(0) <= '0';
  carries_1(0) <= '1';
  
  GEN: for i in 0 to 3 generate
    
    SET: setup port map ( a(i), b(i), p(i), g(i) );
    CAR0: carry_prop port map ( p(i), g(i), carries_0(i), sum_0(i), carries_0(i+1));
    CAR1: carry_prop port map ( p(i), g(i), carries_1(i), sum_1(i), carries_1(i+1));
  
  end generate;
  
  c_out <= carries_0(4) when (c_in = '0') else carries_1(4);
  s <= sum_0 when (c_in = '0') else sum_1;
  
end architecture;