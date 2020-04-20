library ieee;
use ieee.std_logic_1164.all;


entity flipflop is
  port (
  D, Clock, Reset,Set : in std_logic;
  Q : out std_logic
  );
end flipflop;


architecture Behavior of flipflop is
begin

  process (Clock, Reset,Set)
    begin
      if (Reset = '1') then -- asynchronous clear
        Q <= '0';
      elsif Set = '1' then -- asynchronous set
        Q <= '1';
      elsif (Clock'EVENT and Clock = '1') then
        Q <= D;
      end if;
    end process;

end Behavior;
