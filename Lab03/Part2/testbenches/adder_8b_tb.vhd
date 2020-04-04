library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_8b_tb is
     
end adder_8b_tb;



architecture struct of adder_8b_tb is
  
  component adder_8b
    
    generic (n : integer := 3);
     
     port ( A,B : in signed ( n-1 downto 0 );
         add_sub : in std_logic; --sub when add_sub == 1
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 ) 
       );
  end component;
  
  signal A : signed ( 2 downto 0 );
  signal B : signed ( 2 downto 0 );
  signal add_sub : std_logic;
  signal c_out_dut,ovf_det_dut : std_logic;
  signal S_dut : signed ( 2 downto 0 );
  signal S_ref : signed ( 3 downto 0 );
  

  
begin
  
  add_sub <= '0', '1' after 16 ns;
  
  A <= "010", "110" after 5 ns, "101" after 10 ns, "000" after 15 ns,
       "111" after 20 ns, "111" after 25 ns;
       
  B <= "001", "011" after 5 ns, "000" after 10 ns, "100" after 15 ns,
       "101" after 20 ns, "100" after 25 ns;  
  
  ADD: adder_8b port map (A,B,add_sub,c_out_dut,ovf_det_dut,S_dut);
  
  S_ref <= ('0'& A) + ('0'&B);
  
  
  
end architecture;
