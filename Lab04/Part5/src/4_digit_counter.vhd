library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_digit_counter is
  port ( EN, clk, Rst : in std_logic;
         Q : buffer unsigned (15 downto 0) 
       );
end four_digit_counter;

architecture gated of four_digit_counter is
  
  component counter
    generic (n : integer := 4);
    port ( EN, clk, clr : in std_logic;
           Q : buffer unsigned (n-1 downto 0) 
         );
  end component;
  
  
  signal clr ,EN_temp: std_logic_vector (3 downto 0);
  
begin
  
  EN_temp(0) <= EN;
  clr(0) <= Rst or (Q(3) and Q(1));
  CNT0: counter port map ( EN_temp(0),clk,clr(0),Q(3 downto 0));
  
  EN_temp(1) <= Q(3) and Q(0) and EN_temp(0);
  clr(1) <= Rst or (Q(7) and Q(5));
  CNT1: counter port map ( EN_temp(1),clk,clr(1),Q(7 downto 4));
    
  EN_temp(2) <= Q(7) and Q(4)and EN_temp(1);
  clr(2) <= Rst or (Q(11) and Q(9));
  CNT2: counter port map ( EN_temp(2),clk,clr(2),Q(11 downto 8));
    
  EN_temp(3) <= Q(11) and Q(8) and EN_temp(2);
  clr(3) <= Rst or (Q(15) and Q(13));
  CNT3: counter port map ( EN_temp(3),clk,clr(3),Q(15 downto 12));
    
end  architecture;
  
