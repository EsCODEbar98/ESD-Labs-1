library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometer_tb is

end cronometer_tb;


architecture gate of cronometer_tb is
  

  
  component cronometer
      port ( clk,key0,key3 : in std_logic;
         SW : in std_logic_vector (7 downto 0);
         LEDR : out std_logic;
         cron : out integer range 0 to 100000;
         timer : buffer integer range 0 to 128;
         EN_cron,EN_timer : buffer std_logic
       );
  end component;
  
  
  
  signal clk, key0, key3,LEDR,EN_cron,EN_timer : std_logic;
  signal cron,timer : integer;
  

  
  
  
begin 
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ns;
    
    wait for 10 ns;
    
  end process CLK_GEN;
  
  
  
  key0 <= '1', '0' after 1 ns, '1' after 121 ns,'0' after 122 ns;
  key3 <= '0','1' after 51 ns,'0' after 52 ns;
  
  
 
  
  COUN: cronometer port map (clk,key0,key3,"00000011",ledr,cron,timer,EN_cron,EN_timer);    
end architecture;

