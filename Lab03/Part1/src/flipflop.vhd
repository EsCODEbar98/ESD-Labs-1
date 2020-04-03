library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop is
  port (
    d, clock, resetn : in std_logic;
    q : out std_logic
  );
end flipflop;

architecture behavior of flipflop is 

begin
  
  process (clock, resetn)
  begin
    if (resetn = '0') then --asynchronous clear
      q <= '0';
    elsif (clock'event and clock = '1') then
      q <= d;
    end if;
  end process;
  
end behavior;
