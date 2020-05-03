library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg is
  generic (n : integer);    --parallelismo
  port(
    clk, rst,en : in std_logic;
    R           : in signed(n-1 downto 0);
    Q           : out signed(n-1 downto 0)
  );
end reg;



architecture behavioral of reg is
 begin
   process (rst, clk) begin
     if rst = '1' then
       Q <= (others => '0');
     elsif clk'event and clk = '1' then
       if en = '1' then
         Q <= R;
       end if;
     end if;
   end process;

end architecture;
