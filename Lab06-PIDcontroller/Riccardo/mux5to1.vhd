library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux5to1 is
  generic (n : integer);
  port (
    a, b, c, d, e : in signed(n-1 downto 0);
    sel           : in unsigned(2 downto 0);
    mux_out       : out signed(n-1 downto 0)
  );
end mux5to1;

architecture behavior of mux5to1 is

begin
  mux_out <= a when sel = "000" else
             b when sel = "001" else
             c when sel = "010" else
             d when sel = "011" else
             e;
end behavior;
