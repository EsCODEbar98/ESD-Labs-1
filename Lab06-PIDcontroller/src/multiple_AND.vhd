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
    signal tmp: signed (N-1 downto 0);
begin
    tmp(0) <= bit_vect(0);
    gen: for i in 1 to N-1 generate
        tmp(i) <= tmp(i-1) and bit_vect(i);
    end generate;
    res <= std_logic(tmp(N-1));

end architecture;
