library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux3to1 is
generic (n: integer);
port
(
  a, b, c: in signed(n-1 downto 0);
  sel    : in unsigned(1 downto 0);
  mux_out: out signed(n-1 downto 0)
);
end mux3to1;

architecture behavior of mux3to1 is

begin
mux_out<= a when sel = "00" else
          b when sel = "01" else 
          c;
          
end architecture;
