library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_n is
  generic ( N : integer:=8);
  port (
    R : in signed(N-1 downto 0);
    Clock, Resetn : in std_logic;
    Q : out signed(N-1 downto 0));
end reg_n;


architecture Behavior of reg_n is
begin

  process (Clock, Resetn)
  begin
    if (Resetn = '0') then
      Q <= (others => '0');
    elsif (Clock'EVENT AND Clock = '1') then
      Q <= R;
    end if;
  end process;
  
end Behavior;
