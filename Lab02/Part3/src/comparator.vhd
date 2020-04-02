library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity comparator is
  port (  
       v : in unsigned(3 downto 0);
       z : out std_logic
   );
end comparator;

architecture struct of comparator is 
begin
    z <= v(3) and (v(2) or v(1));
end struct;
