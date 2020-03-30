library ieee;
use ieee.std_logic_1164.all;

entity decoder is
  port ( SW : in std_logic_vector(2 downto 0); --SW is connected to the input c
        HEX0 : out std_logic_vector(0 to 6));
end decoder;

architecture behavior of decoder is
  begin
    
  -- boolean functions
  --the light switches on when the driven value is '0'
  HEX0(0) <= not(SW(0)) or SW(2);
  HEX0(1) <= SW(2) or (SW(0) and not(SW(1))) or (not(SW(0)) and SW(1));
  HEX0(2) <= SW(2) or (SW(0) and not(SW(1))) or (not(SW(0)) and SW(1)) ;
  HEX0(3) <= SW(2) or (not(SW(0) or SW(1)));
  HEX0(4) <= SW(2);
  HEX0(5) <= SW(2);
  HEX0(6) <= (SW(1) or SW(2));
  

end behavior;
