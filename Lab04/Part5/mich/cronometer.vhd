library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometer is
  port ( clk,key0,key3 : in std_logic;
         SW : in std_logic_vector (7 downto 0);
         LEDR : out std_logic;
         cron : out integer range 0 to 100000;
         timer : buffer integer range 0 to 128;
         EN_cron,EN_timer : buffer std_logic
       );
end cronometer;


architecture gated of cronometer is
  
  
 
  
  component timer_sec
    generic (n1 : integer := 9; n2 : integer := 49999);
    port( EN,clk,clr : in std_logic;
        count : buffer integer range 0 to n2;
        count_sec : buffer integer range 0 to n1
      );
  end component;
         
   signal EN_cron_async,EN_timer_async,term_reach,clr : std_logic;
   -- signal count_timer
         
         
begin
  
  TIME_R: timer_sec   generic map(n1 => 128,n2 => 1)
                    port map( clk=>clk, clr=>clr,EN=>EN_timer, count_sec=>timer );
                      
  CRONOMETER: timer_sec   generic map(n1 => 10000,n2 => 1)
                    port map( clk=>clk, clr=>clr,EN=>EN_cron, count_sec=>cron );
                      
  EN_timer <= EN_timer_async and not term_reach;
  EN_cron <= EN_cron_async and term_reach;
  
  
  process (clk,key0,key3)
    begin
      clr <= '1';
      --EN_cron_async <= '1';
     -- EN_timer_async <= '0';
      --term_reach <= '0';
      
      
      if key0 = '1' then
        clr <= '0';
        EN_timer_async <= '1';
        EN_cron_async <= '1';
        term_reach <= '0';
      elsif key3 = '1' then
        EN_cron_async <= '0';
      elsif clk'event and clk = '1' then
        
        if timer = to_integer(unsigned(SW))then
          term_reach <= '1';
        else
          term_reach <= '0';
        end if;
        
      end if;
    
  end process;
  
  LEDR <= EN_cron;
  
end architecture;
      
      
