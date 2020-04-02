library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bin2dec_decoder is
  port (
        m: in std_logic_vector (3 downto 0);
        hex0: out std_logic_vector (0 to 6)
  );
end bin2dec_decoder;


architecture k_map of bin2dec_decoder is
begin
  -- bolean functions from Kmaps synth
  hex0 (0) <= (not m (3) and not m (2) and not m (1) and m (0)) or (m (2) and not m (1) and not m (0));
  hex0 (1) <= m (2) and (m (1) xor m (0));
  hex0 (2) <= not m (0) and m (1) and not m (2);
  hex0 (3) <= (not m (3) and not m (2) and not m (1) and m (0)) or (m (2) and not m (1) and not m (0)) or (m (2) and m (1) and m (0));
  hex0 (4) <= m (0) or (m (2) and not m (1));
  hex0 (5) <= (not m (3) and not m (2) and m (0)) or (not m (2) and m (1)) or (m (1) and m (0));
  hex0 (6) <= (not m (2) and not m (3) and not m (1)) or (m (0) and m (1) and m (2));
end architecture;
