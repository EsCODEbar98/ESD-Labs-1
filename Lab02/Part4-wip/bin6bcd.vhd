--Binary to BCD converter

library ieee;
use ieee.std_logic_1164.all;

entity bin6bcd is
  port ( b : in std_logic_vector (6 downto 0);
         p : out std_logic_vector (7 downto 0));
end bin6bcd;

architecture behavior of bin6bcd is

  component circuit1
    port ( x1, x2, x3, x4 : in std_logic;
            y : out std_logic vector (3 downto 0);
  end component;

  signal m1 : std_logic_vector(3 downto 0);
  signal m2 : std_logic_vector(3 downto 0);
  signal m3 : std_logic_vector(3 downto 0);

  begin
    p(7) <= "0";
    p(0) <= b(0);
    b(6) <= "0";

    C1: circuit_1 port map (b(6), b(5), b(4), b(3), m1);
        p(6) <= m1(3);
    C2: circuit_1 port map (m1(2), m1(1), m1(0), b(2), m2);
        p(5) <= m2(3);
    c3: circuit_1 port map m2(2), m2(1), m2(0), b(1), m3);
        p(4 downto 1) <= m3(3 downto 0);

end behavior;
