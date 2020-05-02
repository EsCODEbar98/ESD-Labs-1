library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (N : integer);
  port(
      en, clk, clear : in std_logic;
      Q : buffer unsigned (N-1 downto 0)
  );
end counter;

architecture behavior of counter is

  begin
    process(clear, clk) begin

      if (clear='1') then
        Q <= (others => '0');
      elsif rising_edge(clk) then
        if (en='1') then
          Q <= Q + 1;
        end if;
      end if;

    end process;
    
end architecture;
