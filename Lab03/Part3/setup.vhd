library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity setup is
  
  port( a,b : in std_logic;
        p,g : out std_logic
      );
      
end setup;

architecture logic of setup is
  
begin
  
  g <= a and b;
  p <= a xor b;
  
end architecture;
