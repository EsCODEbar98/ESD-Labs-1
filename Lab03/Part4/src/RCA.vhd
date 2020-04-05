library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCA is
  port(
    a,b : in unsigned(3 downto 0);
    s : out unsigned(3 downto 0);
    cout : out std_logic
  );
end RCA;

architecture behaviour of RCA is

  component FA is
    port(
        a,b : in std_logic;
        c_in : in std_logic;
        c_out, s: out std_logic
        );
  end component;

  signal c : std_logic_vector (4 downto 0); -- carries

  begin
    c(0) <= '0'; -- first carry-in

    FAs:  for i in 0 to 3 generate
      FAi : FA port map ( a(i), b(i), c(i),  c(i + 1), s(i));
    end generate;

    cout <= c(4);

end architecture;
