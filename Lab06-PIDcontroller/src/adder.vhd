library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
  generic (n : integer);
  port(
    A, B :     in signed(n-1 downto 0);
    sub_addn : in std_logic;
    sum :      out signed (n-1 downto 0)
  );
end entity;

architecture behavioral of adder is
  begin
    sum <= A + (B xor (B'range => sub_addn)) + ('0'& sub_addn);
end behavioral;
