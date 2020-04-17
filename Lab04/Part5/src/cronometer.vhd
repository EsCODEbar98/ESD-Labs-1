library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometer is
  port ( clk,key0,key3 : in std_logic;
         SW : in std_logic_vector (7 downto 0);
         LEDR : buffer std_logic;
         HEX0,HEX1,HEX2,HEX3 : out std_logic_vector ( 0 to 6)   
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
  
  
  component hexa_display
    port(
      SW : in unsigned (3 downto 0);
      HEXA : out std_logic_vector ( 0 to 6)
      );
  end component;
         
   
   signal count_fast_TC,count_fast_EN,count_fast_Rst : std_logic;
   signal count_fast_out : unsigned (15 downto 0);
   
   signal count_elaps_TC,count_elaps_EN : std_logic;  
   signal count_elaps_out : unsigned (7 downto 0);
   
   signal Q : unsigned (15 downto 0);
       
         
begin
  
  
  count_elaps_EN <= count_fast_TC and not (count_elaps_TC);
  --it counts time elapsed before start cronometer
  ELAPS_TIMER: counter  generic map(8)
                    	 	 port map (count_elaps_EN,clk,KEY0,count_elaps_out);
  
                   	 	   
	count_fast_Rst <= KEY0 or count_fast_TC;
	--it counts from 0 to 49999 at 50Mhz, so 1 ms per cycle
  COUNT_FAST: counter  generic map(16)
                    	 	 port map (count_fast_EN,clk,count_fast_Rst,count_fast_out);
  
  --it lights when elapsed timer has finished and 1 ms is elapsed
  LEDR <= count_fast_TC and count_elaps_TC;
  
  
  
  DIGITS: four_digit_counter port map (LEDR,clk,KEY0,Q);
    
    
    
  HEX_UNI: hexa_display port map( Q(3 downto 0), HEX0 );
  HEX_DEC: hexa_display port map( Q(7 downto 4), HEX1 );
  HEX_CENT: hexa_display port map( Q(11 downto 8), HEX2 );
  HEX_MIGL: hexa_display port map( Q(15 downto 12), HEX3 );
  
   
  Async_CONTR:process (clk,key0,key3)
    begin
       
      --async reset
      if key0 = '1' then
        count_fast_EN <= '1';
        
      --async freeze
      elsif key3 = '1' then
        count_fast_EN <= '0';
       
      --sync evaluation of TCs 
      elsif clk'event and clk = '1' then
        
        if count_fast_out = to_unsigned(49999,16) then
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
  
  
  
end architecture;
      
      
