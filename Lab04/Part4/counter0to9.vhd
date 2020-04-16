library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter0to9 is
  port(
    CLOCK_50 : in std_logic;
    HEX0     : out std_logic_vector(0 to 6)
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
  signal fast_count : integer range 0 to 9;
  signal slow_count : integer range 0 to FREQ - 1;

begin

-- counting time process
 COUNTER_CLOCK : process (CLOCK_50)
 begin
    if CLOCK_50'event and CLOCK_50 = '1' then
         fast_count <= fast_count + 1;  -- counting time
    end if;
 end process;


-- switching number on display process
 SW_RPOCESS : process (CLOCK_50)
 begin
   if CLOCK_50'event and CLOCK_50 = '1' then
     if fast_count = FREQ - 1 then     -- enabling slow counter
         slow_count <= slow_count + 1; -- after 9 starts over from 0 on its own
     end if;
   end if;
 end process;

-- displaying on 7-seg

SEV_SEG : display port map (slow_count ,HEX0);
end architecture;
