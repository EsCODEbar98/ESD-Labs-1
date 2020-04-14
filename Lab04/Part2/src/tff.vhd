library ieee;
use ieee.std_logic_1164.all;

entity TFF is
  port (
   T, clk, rst : in std_logic;
   Q           : out std_logic
  );
end TFF;

architecture behavior of tff is

  signal Q_tmp: std_logic;

  begin

    process(clk, rst)
      begin
  --  async reset
    if (rst = '0') then
      Q_tmp<='0';
    elsif rising_edge(clk) then
      if (T='1') then
        Q_tmp <= not Q_tmp;
      end if;
    end if;

end process;

  Q <= Q_tmp;
end behavior;
