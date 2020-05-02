library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity mux3to1 is
generic n: integer;
port
(
  a,b: in signed(n-1 downto 0);
  sel: in std_logic;
  mux_out: out signed(n-1 downto 0)
);
end mux3to1;

architecture behavior of mux3to1 is

begin
with sel select
mux_out<= a when "0";
          b when  "1";
          a when others;
end architecture
