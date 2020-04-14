library ieee;
use ieee.std_logic_1164.all;

entity ToggleFF is
  port (
   T, clk, clear : in std_logic;
   Q           : out std_logic
  );
end ToggleFF;

architecture behavior of ToggleFF is

  signal Q_tmp: std_logic;

  begin

    process(clk, clear)
      begin
  --  async reset
    if (clear = '0') then
      Q_tmp<='0';
    elsif rising_edge(clk) then
      if (T='1') then
        Q_tmp <= not Q_tmp;
      end if;
    end if;

end process;

  Q <= Q_tmp;
end behavior;
