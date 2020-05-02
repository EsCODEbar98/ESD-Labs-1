library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux5to1 is
  generic n : integer;
  port (
    a,b,c,d,e : in signed(n-1 downto 0);
    sel : in unsiged(2 downto 0);
    mux_out : out signed(n-1 downto 0)
  );
end mux5to1;

architecture behavior of mux5to1 is
  
begin
  with sel select
  mux_out <= a when "000";
             b when "001";
             c when "010";
             d when "011";
             e when "100";
             a when others; --default boh
  
end behavior;
