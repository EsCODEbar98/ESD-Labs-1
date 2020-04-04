library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_8b_tb is
     
end adder_8b_tb;



architecture struct of adder_8b_tb is
  
  component adder_8b
    
    generic (n : integer := 8);
     
     port ( A,B : in signed ( n-1 downto 0 );
         c_in : in std_logic; --sub when add_sub == 1
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 ) 
       );
  end component;
  
  signal A : signed ( 7 downto 0 );
  signal B : signed ( 7 downto 0 );
  signal A_int,B_int : integer;
  signal c_out_dut,ovf_det_dut : std_logic;
  signal S_dut : signed ( 7 downto 0 );
  signal S_ref,S_int_dut : integer;
  

  
begin
  
  
  A <= "10111010", "01110110" after 5 ns, "01111101" after 9 ns, "10101000" after 15 ns,
       "11110111" after 21 ns, "01000111" after 25 ns;
       
  B <= "00011010", "01100110" after 5 ns, "00011101" after 9 ns, "11111000" after 15 ns,
       "11110001" after 21 ns, "11010101" after 25 ns;  
       
  A_int <= to_integer(A);
  B_int <= to_integer(B);
  
  ADD: adder_8b port map (A,B,'0',c_out_dut,ovf_det_dut,S_dut);
    
  S_int_dut <= to_integer(S_dut);
  
  
  S_ref <= to_integer(A + B) ;
      
  
 
  
  
  
end architecture;
