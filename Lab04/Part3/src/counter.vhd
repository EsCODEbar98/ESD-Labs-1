library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (N : integer := 16);
  port(
      en, clk, clear : in std_logic;
      Q : buffer unsigned (N-1 downto 0)
  );
end counter;

architecture behavior of counter is
  signal cnt : integer range 0 to N-1;

  begin
    process(clear, clk) begin

      if (clear='1') then
        cnt <= 0;
      elsif rising_edge(clk) then
        if (en='1') then
          cnt <= cnt + 1;
        end if;
      end if;

    end process;

    Q <= to_unsigned(cnt, N);
end architecture;
