library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_digit_counter_tb is

end four_digit_counter_tb;


architecture gate of four_digit_counter_tb is
  
  component four_digit_counter
     port ( EN, clk, Rst : in std_logic;
         Q : buffer unsigned (15 downto 0) 
       );
  end component;
  
  signal EN, clk, Rst : std_logic;
  signal Q_un,Q_dec,Q_cent,Q_migl : unsigned (3 downto 0);
  signal Q_dut : unsigned (15 downto 0);
  
  
  
begin 
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ps;
    
    wait for 10 ps;
    
  end process CLK_GEN;
  
  
  
  
  
  
  EN <= '1', '0' after 100 ps, '1' after 111 s;
  Rst <= '1', '0' after 1 ps;
 --  Q_dut <= Q_migl & Q_cent & Q_dec & Q_un;
  
  
  COUNT: four_digit_counter port map (EN,clk,Rst,Q_dut); 
  Q_un <= Q_dut (3 downto 0);
  Q_dec <= Q_dut (7 downto 4);
  Q_cent <= Q_dut (11 downto 8);
  Q_migl <= Q_dut (15 downto 12);   
end architecture;

