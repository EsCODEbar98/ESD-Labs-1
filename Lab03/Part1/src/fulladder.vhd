library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladder is
  port (
    a, b: in std_logic;
    c_in: in std_logic; 
    s, c_out : out std_logic
  );
end fulladder;

architecture behavior of fulladder is
   
 signal ex1 : std_logic;
 
 begin
 
  ex1 <= a xor b;   -- result first exor
  s <= c_in xor ex1;
  
  c_out <= b when ex1 = '0' else
           c_in when ex1 = '1';
  
end behavior;
