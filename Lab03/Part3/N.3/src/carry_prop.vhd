library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity carry_prop is
  
  port( p,g, c_in : in std_logic;
        s,c_out : out std_logic
      );
      
end carry_prop;

architecture logic of carry_prop is
  
begin
  
  s <= c_in xor p;

  c_out <= g or ( p and c_in );

  
end architecture;