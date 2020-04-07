library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CSA_block_tb is

end CSA_block_tb;


architecture behaviour of CSA_block_tb is
  
  component CSA_block
   
    port( 
        a,b : in signed( 3 downto 0 );
        c_in : in std_logic;
        s : out signed( 3 downto 0 );
        c_out : out std_logic
      );
      
  end component;
  
  
  signal A : signed ( 3 downto 0 );
  signal B : signed ( 3 downto 0 );
  signal A_int,B_int : integer;
  signal c_out_dut,c_in : std_logic;
  signal S_dut : signed ( 3 downto 0 );
  signal S_ref,S_int_dut : integer;
  
  
  
begin
  
  A <= "1010", "0110" after 5 ns, "1101" after 9 ns, "1000" after 15 ns,
       "1111" after 21 ns, "0111" after 25 ns;
       
  B <= "0010", "1110" after 5 ns, "1101" after 9 ns, "1000" after 15 ns,
       "0001" after 21 ns, "0101" after 25 ns;  
       
  A_int <= to_integer(A);
  B_int <= to_integer(B);
  
  c_in <= '0', '1' after 15 ns;
  
  ADD: CSA_block port map (A,B,c_in,S_dut,c_out_dut);
    
  S_int_dut <= to_integer(S_dut);
  
  
  S_ref <= A_int + B_int ;
  
  
end architecture;
