LIBRARY ieee;
USE ieee.std_logic_1164.all;

--simple multiplexer with 2 inputs
ENTITY mux2to1 IS
PORT ( x,y : IN STD_LOGIC;	
		 s : IN STD_LOGIC;	
		 m : OUT STD_LOGIC);
END mux2to1;


ARCHITECTURE logic OF mux2to1 IS
BEGIN
	m <= (NOT (s) AND x) OR (s AND y);
END ARCHITECTURE;
