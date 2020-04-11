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

  component tff
  port (
        t, clk, rst : in std_logic;
          q : out std_logic
          );
  end component;

  signal t, cnt : std_logic_vector(n-1 downto 0);

  begin
--Inizializzazione del primo FF

t(0)<=en;


    TFF0: tff port map (t(0), clk, rst, cnt(0));
--Assegnazione iterativa agli n TFF
    gen: for i in 1 to n-1 generate
      TFFs: tff port map (t(i), clk, rst, cnt(i));
              t(i) <= t(i-1) and cnt(i-1);


            

    end generate;

q <= cnt;


end behavior;
