library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_8b_tb is
     
end adder_8b_tb;



architecture struct of adder_8b_tb is
  
  component adder_8b
    
    generic (n : integer := 8);
     
     port ( A,B : in signed ( n-1 downto 0 );
           c_in : in std_logic;
           c_out : out std_logic;
           ovf_det : out std_logic;
          S : out signed ( n-1 downto 0 ) 
          );
  end component;
  
  signal A : signed ( 7 downto 0 );
  signal B : signed ( 7 downto 0 );
  signal c_out_dut,ovf_det_dut : std_logic;
  signal S_dut : signed ( 7 downto 0 );
  signal S_ref : signed ( 8 downto 0 );
  

  
begin
  
  A <= "10111010", "01110110" after 5 ns, "01111101" after 10 ns, "10101000" after 15 ns,
       "11110111" after 20 ns, "01000111" after 25 ns;
       
  B <= "10111010", "01110110" after 5 ns, "01111101" after 10 ns, "10101000" after 15 ns,
       "11110111" after 20 ns, "01000111" after 25 ns;
       
  ADD: adder_8b port map (A,B,'0',c_out_dut,ovf_det_dut,S_dut);
  
  S_ref <= ('0'& A) + ('0'&B);
  
  
  
end architecture;
