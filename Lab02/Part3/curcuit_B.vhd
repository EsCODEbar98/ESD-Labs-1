Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_B is
  PORT (  z : in STD_LOGIC;
          HEX1 : out STD_LOGIC_VECTOR(0 TO 6)
        );
end circuit_B;


Architecture k_map of circuit_B is
  
  
begin
  
  --tale logica permette di stampare uno 0 per numero minori di 10
  --ed un 1 per numeri maggiori o uguali a 10
  HEX1(0) <= z;
  HEX1(1) <= '0';
  HEX1(2) <= '0';
  HEX1(3) <= z;
  HEX1(4) <= z;
  HEX1(5) <= z;
  HEX1(6) <= '1';
                  	 	 	          
end architecture;
