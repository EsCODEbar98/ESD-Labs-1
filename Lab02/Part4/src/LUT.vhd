library ieee;
use ieee.std_logic_1164.all;

entity LUT is
  port (x3, x2, x1, x0 : in std_logic;
      u: out std_logic_vector (3 downto 0)
  );
end LUT;

architecture behavior of LUT is
begin
-- adder/shifter Lookup table based
u(3) <= x3 or (x2  and  x0) or (x2  and  x1);
u(2) <= (x3 and x0) or (x3 and x1) or (x2 and not(x1) and not(x0));
u(1) <=( x1 and x0) or ( not x3  and not x2  and x1) or (x3 and not x1 and not x0);
u(0) <= ( x3 and not x0) or ((not x3) and (not x2) and x0) or (x2 and x1 and (not x0));

end behavior;
