library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometer is
  port ( clk,key0,key3 : in std_logic;
         SW : in std_logic_vector (7 downto 0);
         LEDR : buffer std_logic;
         count_fast_out : buffer unsigned (25 downto 0);
         count_elaps_out : buffer unsigned (7 downto 0);
         Q: buffer unsigned (15 downto 0)
         
       );
end cronometer;


architecture gated of cronometer is
  
  
  component four_digit_counter
     port ( EN, clk, Rst : in std_logic;
         Q : buffer unsigned (15 downto 0) 
       );
  end component;
  
  
  
  component counter
    generic (n : integer := 4);
    port ( EN, clk, clr : in std_logic;
           Q : buffer unsigned (n-1 downto 0) 
         );
  end component;
         
   
   signal count_fast_TC,count_fast_EN,count_fast_Rst : std_logic;
   signal count_elaps_TC,count_elaps_EN : std_logic;  
       
         
begin
  
  
  count_elaps_EN <= count_fast_TC and not (count_elaps_TC);
  ELAPS_TIMER: counter  generic map(8)
                    	 	 port map (count_elaps_EN,clk,KEY0,count_elaps_out);
                    	 	   
	count_fast_Rst <= KEY0 or count_fast_TC;
  COUNT_FAST: counter  generic map(26)
                    	 	 port map (count_fast_EN,clk,count_fast_Rst,count_fast_out);
  
  
  
  DIGITS: four_digit_counter port map (LEDR,clk,KEY0,Q);
  
  
   
  process (clk,key0,key3)
    begin
      
     -- count_fast_EN <= '1';
     -- EN_timer_async <= '0';
      --term_reach <= '0';
      
      
      if key0 = '1' then
        count_fast_EN <= '1';
        
      elsif key3 = '1' then
        count_fast_EN <= '0';
        
      elsif clk'event and clk = '1' then
        
        if count_fast_out = to_unsigned(49,26) then
          count_fast_TC <= '1';
        else
          count_fast_TC <= '0';
        end if;
        
        
        if count_elaps_out = unsigned(SW)then
          count_elaps_TC <= '1';
        else
          count_elaps_TC <= '0';
        end if;
        
      end if;
    
  end process;
  
  LEDR <= count_fast_TC and count_elaps_TC;
  
end architecture;
      
      
