library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_adder_8b is
  
  generic (n : integer := 8);
  
  port ( R1,R2 : in signed ( n-1 downto 0 );
         c_in : in std_logic;
         clk,Rst : in std_logic;
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 ) 
       );
       
end reg_adder_8b;

architecture struct of reg_adder_8b is

  component flipflop
    port (D, Clock, Resetn : in std_logic;
          Q : out std_logic
        );
  end component;
  
  component reg_n 
    
    generic ( N : integer:=n);
    
    port (R : in signed(N-1 downto 0);
        Clock, Resetn : in std_logic;
        Q : out signed(N-1 downto 0)
        );
  end component;
        
        
        
    component adder_8b
    
    generic (n : integer := n);
     
     port ( A,B : in signed ( n-1 downto 0 );
           c_in : in std_logic;
           c_out : out std_logic;
           ovf_det : out std_logic;
          S : out signed ( n-1 downto 0 ) 
          );
    end component;
    
    signal A,B,Q : signed ( n-1 downto 0 );
    signal ovf : std_logic;
    
begin
  
  REG_A: reg_n port map ( R1,clk,Rst,A);
  REG_B: reg_n port map ( R2,clk,Rst,B);
  
  ADD: adder_8b port map ( A,B,c_in,c_out,ovf,Q );
  
  FF: flipflop port map ( ovf,clk,Rst,ovf_det );
    
  REG_S: reg_n port map (Q,clk,Rst,S);
  
end architecture;
        
  

