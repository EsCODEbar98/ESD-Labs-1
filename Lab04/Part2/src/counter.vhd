library ieee;
use ieee.std_logic_1164.all;

entity counter is
  generic (n: integer);--parallelismo
  port (
         en, clk, rst : in std_logic;
        q : out std_logic_vector(n-1 downto 0)
  );
end counter;

architecture behavior of counter is

  component ToggleFF
    port (
       T, clk, clear : in std_logic;
       Q           : out std_logic
    );
  end component;

  signal T, cnt : std_logic_vector(n-1 downto 0);
 
  begin
    --init
    T(0)<=en;
    TFF0: ToggleFF port map (t(0), clk, rst, cnt(0));

    -- following FF
    gen: for i in 1 to n-1 generate
      TFFs: ToggleFF port map (T(i), clk, rst, cnt(i));
      T(i) <= T(i-1) and cnt(i-1);
    end generate;

   Q <= cnt;
end behavior;
