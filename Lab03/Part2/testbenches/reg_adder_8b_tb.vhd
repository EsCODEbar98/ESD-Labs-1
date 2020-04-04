library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_adder_8b_tb is
     
end reg_adder_8b_tb;



architecture struct of reg_adder_8b_tb is
  
  component reg_adder_8b
    
    generic (n : integer := 8);
     
    port ( R1,R2 : in signed ( n-1 downto 0 );
         add_sub : in std_logic;
         clk,Rst : in std_logic;
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 ) 
       );
       
  end component;
  
  signal A,B : signed ( 7 downto 0 );
  signal A_int,B_int : integer;
  signal add_sub,c_out_dut,ovf_det_dut,clk,Rst : std_logic;
  signal S_dut : signed ( 7 downto 0 );
  signal S_int_dut,S_ref : integer;
  

  
begin
  
  
  
  process
  begin
    for i in 1 to 10 loop
      clk <= '0';
      wait for 2 ns;
      clk <= '1';
      wait for 2 ns;
    end loop;
  end process;
  
  Rst <= '1','0' after 27 ns;
  
  add_sub <= '0', '1' after 16 ns;
  
  A <= "10111010", "01110110" after 5 ns, "01111101" after 9 ns, "10101000" after 15 ns,
       "11110111" after 21 ns, "01000111" after 25 ns;
       
  B <= "00011010", "01100110" after 5 ns, "00011101" after 9 ns, "11111000" after 15 ns,
       "11110001" after 21 ns, "11010101" after 25 ns;   
       
  A_int <= to_integer(A);
  B_int <= to_integer(B);
   
       
  ADD: reg_adder_8b port map (A, B, add_sub, clk, Rst, c_out_dut, ovf_det_dut, S_dut);
  
  S_int_dut <= to_integer(S_dut);
  
  with add_sub select
    S_ref <=  
      to_integer(A + B) when '0',
      to_integer(A - B) when others;
  
  
  
end architecture;
