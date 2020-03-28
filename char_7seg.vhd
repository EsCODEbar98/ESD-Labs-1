library ieee;
use ieee.std_logic_1164.all;

entity char_7seg is
port(
     c : in std_logic_vector (2 downto 0);
     disp : out std_logic_vector(0 to 6)
);
end char_7seg;


architecture Behavior of char_7seg is
begin
  disp(0) <= c(2) or not c(0);
  disp(1) <= c(2) or (c(0) and not c(1)) or (c(1) and not c(0));
  disp(2) <= c(2) or (c(0) and not(c(1))) or (not(c(0)) and c(1)) ;
  disp(3) <= c(2) or not(c(0) or c(1));
  disp(4) <= c(2);
  disp(5) <= c(2);
  disp(6) <= c(1) or c(2);
end Behavior;
