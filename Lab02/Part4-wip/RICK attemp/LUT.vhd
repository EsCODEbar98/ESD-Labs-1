library ieee;
use ieee.std_logic_1164.all;

entity LUT is
port (x :in std_logic_vector(3 downto 0);
      u: out std_logic_vector (3 downto 0));
      end LUT;

architecture behavior of LUT is
--In pratica ho sintetizzato una LUT che mi fa il lavoro
--di adder e shifter
begin
u(0)<= x(0) or (x(1)  and  x(3)) or (x(1)  and  x(2));
u(1)<= (x(0) and x(3)) or (x(0) and x(2)) or (x(1) and not(x(2)) and not(x(3)));
u(2)<= (not(x(0))and not(x(1)) and x(2)) or (x(2) and x(3)) or (x(0) and x(1));
u(3)<= (not(x(0)) and not(x(1)) and x(3)) or (x(0) and not(x(3))) or (x(1) and x(2) and not(x(3)));
end behavior;