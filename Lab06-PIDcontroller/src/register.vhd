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
   process (rst, clk) begin
     if rst = '0' then
       Q <= (others => '0');
     elsif clk'event and clk = '1' then
       if en = '1' then
         Q <= R;
       end if;
     end if;
   end process;

end architecture;