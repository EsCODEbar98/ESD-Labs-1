Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_A is
  PORT (  v : IN UNSIGNED(2 DOWNTO 0);
          u : OUT UNSIGNED(2 DOWNTO 0)
        );
end circuit_A;

Architecture k_map of circuit_A is

begin
  u(0) <= v(0);
  u(1) <= NOT (v(1));
  u(2) <= v(2) AND v(1);
  
end architecture;


