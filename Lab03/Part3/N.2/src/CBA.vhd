library ieee;
use ieee.std_logic_1164.all;

entity CBA is
  port(
  a,b: in std_logic_vector(0 to 3);
  c_in: in std_logic;
  s : out std_logic_vector(0 to 3);
  cout : out std_logic
  );
end CBA;

architecture behaviour of CBA is

  component FA is
    port(
        a,b : in std_logic;
        c_in : in std_logic;
        s,c_out: out std_logic
        );
  end component;

signal c : std_logic_vector (4 downto 0); -- carries
signal pr: std_logic_vector(0 to 3);
signal gen: std_logic_vector(0 to 3);

begin

 gen<= a and b;
  pr<= a xor b;
  c(0) <= c_in; -- first carry-in
 FAs:  for i in 0 to 3 generate
    FAi : FA port map ( gen(i), pr(i), c(i),s(i), c(i + 1));
  end generate;
  cout<=c_in  when pr="1111" else
             c(4) ;

end architecture;
