library ieee;
use ieee.std_logic_1164.all;


entity reg is
  port(
    generic (n: integer);--parallelismo
    clk, rst,en : in std_logic;
    R           : in signed(n-1 downto 0);
    Q           : out signed(n-1 downto 0)
  );
end reg;



architecture behavioral of reg is
 begin
  process (clk) begin
      if clk'event and clk = '1' then
        if rst = '0' then       -- synch reset
          Q <= (others => '1'); -- init to display BLANKs
        elsif en = '1' then
          Q<= R;
        end if;
      end if;
    end process;

end architecture;
