library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (N : integer := 16; UP_TO : integer := 2**16 - 1);
  port(
      en, clk, clear : in std_logic;
      Q : out unsigned (N-1 downto 0)
  );
end counter;

architecture behavior of counter is
  signal cnt : integer range 0 to 2**N - 1;

  begin
    process(clear, clk) begin

      if (clear='0') then
        cnt <= 0;
      elsif clk'event and clk = '1' then
        if (en='1') then
          if cnt = UP_TO then
            cnt <= 0;
          else
            cnt <= cnt + 1;
          end if;
        end if;
      end if;

    end process;

    Q <= to_unsigned(cnt, N);
end architecture;
