library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity multiple_AND  IS
    generic (N: positive ); --array size
    port (
        bit_vect: in signed(N-1 downto 0);
        res : out std_logic
        );
end entity;

architecture behavior of multiple_AND is

  function vectorial_and (vec : in signed) return std_logic is
  variable res : std_logic := '1'; -- 1 and X = X
  begin
    for i in vec'range loop
      res := res and vec(i);
    end loop;
    return res;
  end function;

begin
  res <= vectorial_and(bit_vect);
end architecture;
