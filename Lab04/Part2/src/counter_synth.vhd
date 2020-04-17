library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--KEY0=clock,SW1=Enable,SW0=Reset
entity counter_synth is
  port(
     SW : in std_logic_vector (1 downto 0);
     KEY0 : in std_logic;
     --HEX3 : out std_logic_vector(0 to 6);
     --HEX2 : out std_logic_vector(0 to 6);
    -- HEX1 : out std_logic_vector(0 to 6);
       HEX0 : out std_logic_vector(0 to 6)
  );
end counter_synth;

architecture behaviour of counter_synth is
constant n : integer := 4;

  component counter is
    generic (n: integer);--parallelismo
    port (
           en, clk, rst : in std_logic;
          q : buffer unsigned(n-1 downto 0)
    );
  end component;

   component hexa_display is
     port(
          SW : in unsigned (3 downto 0);
          HEXA : out std_logic_vector ( 0 to 6)
          );
  end component;
  signal count :  unsigned(n-1 downto 0);

  begin
    CNT: counter generic map (n) port  map (SW(1), KEY0, SW(0), count);
     H0 : hexa_display port map(count, HEX0);
end architecture;
