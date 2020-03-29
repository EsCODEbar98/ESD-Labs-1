library ieee;
use ieee.std_logic_1164.all;

entity decoder is
  port ( c : in std_logic_vector(2 downto 0);
        HEX0 : out std_logic_vector(0 to 6));
end decoder;

architecture behavior of decoder is
  begin
  -- boolean functions
  HEX0(0) <= not(c(0)) or c(2);
  HEX0(1) <= c(2) or (c(0) and not(c(1))) or (not(c(0)) and c(1));
  HEX0(2) <= c(2) or (c(0) and not(c(1))) or (not(c(0)) and c(1)) ;
  HEX0(3) <= c(2) or (not(c(0) or c(1)));
  HEX0(4) <= c(2);
  HEX0(5) <= c(2);
  HEX0(6) <= (c(1) or c(2));

  --the light switches on when the driven value is '0'

end behavior;
