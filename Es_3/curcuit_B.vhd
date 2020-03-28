Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_B is
  PORT (  z : in STD_LOGIC;
          HEXA1 : out STD_LOGIC_VECTOR(0 TO 6)
        );
end circuit_B;


Architecture behaviuor of circuit_B is
  
begin
  
  MUX: entity work.mux2to1_gen generic map (7)
                  	 	 	        port map("0000001", "1111001", z, HEXA1);
                  	 	 	          
end architecture;