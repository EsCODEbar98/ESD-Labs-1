library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_sec is
  generic (n1 : integer := 9; n2 : integer := 49);
  port( EN,clk,clr : in std_logic;
        count : buffer integer range 0 to n2;
        count_sec : buffer integer range 0 to n1
      );
end entity;

architecture beh of timer_sec is
  
begin
  
  process (clr,clk)
    begin
    if clr = '0' then
      count <= 0;
      count_sec <= 0;
   elsif clk'event and clk = '1' then
     if EN = '1' then
     
     
     if count < n2 then
        count <= count + 1;
     else
       count <= 0;
       
       if count_sec < n1 then
         count_sec <= count_sec + 1;
       else
         count_sec <= 0;
       end if;
      end if;
     
     end if;
     
       
   end if;
 end process;
 
 
end architecture;




