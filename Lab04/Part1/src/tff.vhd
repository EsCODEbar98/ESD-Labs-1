library ieee;
use ieee.std_logic_1164.all;

entity tff is
  port (
   t, clk, rst : in std_logic;
          q : out std_logic
      );
end tff;

architecture behavior of tff is

  signal q_tmp: std_logic;

  begin

    process(clk, rst)
      begin
  --  Reset asincrono
    if (rst ='0') then
     q_tmp<='0';
    end if;
--Comportamento TFF ad ogni fronte ascendente del CLK
     if (clk'event and clk = '1') then
         if (t='0') then
      q_tmp <= q_tmp;
    elsif (t='1') then
      q_tmp <= not(q_tmp);
      end if;
    end if;

end process;
  q <= q_tmp;
end behavior;
