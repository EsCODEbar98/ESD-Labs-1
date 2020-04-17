library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometer_tb is

end cronometer_tb;


architecture gate of cronometer_tb is
  

  
  component cronometer
      port ( clk,key0,key3 : in std_logic;
         SW : in std_logic_vector (7 downto 0);
         LEDR : buffer std_logic;
         count_fast_out : buffer unsigned (25 downto 0);
         count_elaps_out : buffer unsigned (7 downto 0);
         Q: buffer unsigned (15 downto 0)
         
       );
  end component;
  
  
  
  signal clk, key0, key3,LEDR : std_logic;
  signal count_fast_out : unsigned (25 downto 0);
  signal count_elaps_out : unsigned (7 downto 0);
  signal Q_un,Q_dec,Q_cent,Q_migl : unsigned (3 downto 0);
  signal Q_dut : unsigned (15 downto 0);

  
  
  
begin 
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ps;
    
    wait for 10 ps;
    
  end process CLK_GEN;
  
  
  
  key0 <= '1', '0' after 1 ps, '1' after 5621 ps,'0' after 5622 ps;
  key3 <= '0','1' after 5551 ps,'0' after 5552 ps;
  
  
 
  
  COUN: cronometer port map (clk,key0,key3,"00000111",ledr,count_fast_out,count_elaps_out,Q_dut);
  Q_un <= Q_dut (3 downto 0);
  Q_dec <= Q_dut (7 downto 4);
  Q_cent <= Q_dut (11 downto 8);
  Q_migl <= Q_dut (15 downto 12); 
      
end architecture;

