library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity circuit_B is
  port (  
       z : in std_logic;
       HEX1 : out std_logic_vector(0 to 6)
  );
end circuit_B;


architecture k_map of circuit_B is  
begin
  -- displays 0 if in > 9
  -- 0 otherwise
  HEX1(0) <= z;
  HEX1(1) <= '0';
  HEX1(2) <= '0';
  HEX1(3) <= z;
  HEX1(4) <= z;
  HEX1(5) <= z;
  HEX1(6) <= '1';
                  	 	 	          
end architecture;
