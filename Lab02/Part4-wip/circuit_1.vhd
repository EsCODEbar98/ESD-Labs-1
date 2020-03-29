library ieee;
use ieee.std_logic_1164.all;

entity circuit_1 is
  port( x1,x2,x3,x4 : in std_logic;
        y : out std_logic_vector(3 downto 0));
end circuit_1;

architecture behavior of circuit_1 is

  component adder
    port (a: in std_logic_vector (3 downto 0);
          in2 : in std_logic_vector (3 downto 0);
          sum : out std_logic_vector(3 downto 0);

  end component;

  component mux2to1
    port (in1, in2 : in std_logic_vector(3 downto 0);
          s : in std_logic;
          output : out std_logic_vector (3 downto 0));
  end component;

  signal in_vect : std_logic_vector(3 downto 0);
  signal f : std_logic;
  signal sum : std_logic_vector(3 downto 0);

  in_vect(3) <= x1;
  in_vect(2) <= x2;
  in_vect(1) <= x3;
  in_vect(0) <= x4;

  begin
    f <= (x1 and (not x2)) or (x1 and x2) or (x2 and x4) or (x2 and x3);

    ADD: adder port map (in_vect, "0011", sum);
    MUX: mux2to1 port map (in_vect, sum, f, y);


end behavior;
