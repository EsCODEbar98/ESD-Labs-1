library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity multiple_OR  IS
    generic (N: positive); --array size
    port (
        bit_vect: in signed(N-1 downto 0);
        res : out std_logic
        );
end entity;

architecture behavior of multiple_OR is
  function vectorial_or (vec : in signed) return std_logic is
  variable res : std_logic := '0'; -- 0 or X = X
  begin
    for i in vec'range loop
      res := res or vec(i);
    end loop;
    return res;
  end function;

begin
  res <= vectorial_or(bit_vect);

end architecture;
