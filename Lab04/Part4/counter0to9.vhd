library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter0to9 is
  port(
    KEY0, CLOCK_50 : in std_logic;
    HEX0 :           out std_logic_vector(0 to 6)
  );
end counter0to9;

architecture behavior of counter0to9 is

  component  display is
    port(
      S  : in integer;
      D : out std_logic_vector(0 TO 6)
    );
  end component;

  constant FREQ : integer := 50000000;
  signal count : integer range 0 to 9;
  signal count_sec : integer range 0 to FREQ - 1;

begin


-- counting time process
 COUNTER_CLOCK : process (CLOCK_50, KEY0)
 begin
    if KEY0 = '1' then  -- clearing
      count <= 0
    elsif CLOCK_50'event and CLOCK_50 = '1' then
      if count_sec = FREQ - 1 then  -- freq reached (starts over from 0 then)
          count <= count + 1;       -- after 9 starts over from 0 on its own
      else
         count_sec <= count_sec + 1;  -- counting time
      end if;
    end if;
end process;

-- displaying on 7-seg

SEV_SEG : display port map (count ,HEX0);
end architecture;
