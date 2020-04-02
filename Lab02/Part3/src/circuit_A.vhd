library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit_A is
  port (
        v: in unsigned (2 downto 0);
        u: out unsigned (2 downto 0)
  );
end circuit_A;


architecture k_map of circuit_A is
begin
  -- decreases input n by 9 working on
  -- first 3 bits
  u (0) <= v (0);
  u (1) <= not (v (1));
  u (2) <= v (2) and v (1);
end architecture;
