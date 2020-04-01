Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity comparator is
  PORT (  v : IN UNSIGNED(3 DOWNTO 0);
          z : OUT STD_LOGIC
        );
end comparator;

Architecture struct of comparator is
  
begin
  
  --z si accende nel caso v sia un numero maggiore di 9
  z <= v(3) AND (v(2) OR v(1));
  
end struct;
