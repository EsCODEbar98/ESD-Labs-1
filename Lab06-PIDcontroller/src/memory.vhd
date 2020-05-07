library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port(
       Clk, CS, WR_RD : in std_logic;
	     ADDRESS_MEM : in unsigned(9 downto 0);
	     DATA_IN : in signed(7 downto 0);
	     DATA_OUT : out signed(7 downto 0)
  );
end entity;

architecture behaviour of memory is
  type MEM is array(0 to 1024) of signed(7 downto 0);
  signal memory : MEM;

  begin
    READ_WRITE : process(Clk)
    begin
      if Clk'event and Clk = '1' then
        if CS = '1' then

          if WR_RD = '0' then
            memory(to_integer(ADDRESS_MEM)) <= DATA_IN;
						DATA_OUT<=(others=>'Z');
          else
            DATA_OUT <= memory(to_integer(ADDRESS_MEM));
          end if;
				else
					DATA_OUT<=(others=>'Z');
      end if;
		end if;
  end process;

end architecture;
