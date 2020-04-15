library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flash_digit_tb is

end flash_digit_tb;


architecture test of flash_digit_tb is
  
  component flash_digit
    
    port ( EN, clk, clr : in std_logic;
         Q : buffer unsigned (3 downto 0) ;
         Q_temp : buffer unsigned (25 downto 0)
         
       );
  end component;
  
  signal EN, clk, clr : std_logic;
  signal Q_dut : unsigned (3 downto 0);
  signal Q_temp : unsigned (25 downto 0);
  
begin
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ns;
    
    wait for 10 ns;
    
  end process CLK_GEN;
  
  
   
  
  
  
  EN <= '1', '0' after 300 ns, '1' after 311 ns;
  clr <= '0', '1' after 1 ns,'0' after 400 ns;
  
  COUNT: flash_digit port map (EN,clk,clr,Q_dut,Q_temp);  
     
  
  
  
  
  
end architecture;

