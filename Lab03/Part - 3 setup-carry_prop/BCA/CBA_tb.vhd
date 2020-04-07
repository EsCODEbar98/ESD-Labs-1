library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity BCA_tb is

end BCA_tb;


architecture behaviour of BCA_tb is
  
  component BCA
   
     port( 
        A,B : in signed( 15 downto 0 );
        c_in : in std_logic;
        S : out signed( 15 downto 0 );
        c_out,ovf_det : out std_logic
      );
      
  end component;
  
  
  signal A : signed ( 15 downto 0 );
  signal B : signed ( 15 downto 0 );
  signal A_int,B_int : integer;
  signal c_out_dut,ovf_det : std_logic;
  signal S_dut : signed ( 15 downto 0 );
  signal S_ref,S_int_dut : integer;
  
  
  
begin
  
  A <= "1111111111111010", "1000000001110110" after 5 ns, "0000000001111101" after 9 ns, "0000000010101000" after 15 ns,
       "0000000011110111" after 21 ns, "0000000001000111" after 25 ns;
       
  B <= "0000000000011010", "1000000001100110" after 5 ns, "0000000000011101" after 9 ns, "0000000011111000" after 15 ns,
       "0000000011110001" after 21 ns, "0000000011010101" after 25 ns;  
       
  A_int <= to_integer(A);
  B_int <= to_integer(B);
  
  ADD: BCA port map (A,B,'0',S_dut,c_out_dut,ovf_det);
    
  S_int_dut <= to_integer(S_dut);
  
  
  S_ref <= A_int + B_int ;
  
  
end architecture;
