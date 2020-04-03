library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regn is
  generic ( n : integer := 8);
  port (
    r : in signed (n-1 downto 0);
    clock, resetn : in std_logic;
    q : out signed (n-1 downto 0)
  );
end regn;

architecture behavior of regn is
  
begin
  process (clock, resetn)
    begin
      if (resetn = '0') then
        q <= (others => '0');
        elsif (clock'event and clock = '1') then
          q <= r;
      end if;
    end process;
  

end behavior; 
