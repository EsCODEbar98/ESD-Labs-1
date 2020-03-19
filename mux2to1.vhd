LIBRARY ieee;
USE ieee.std_logic_1164.all;

--simple multiplexer with 2 inputs
ENTITY mux2to1 IS
PORT ( x,y : IN STD_LOGIC;	--inputs
		 s : IN STD_LOGIC;	--select signal
		 m : OUT STD_LOGIC);
END mux2to1;

--logical structure of a multiplexer
ARCHITECTURE logic OF mux2to1 IS
BEGIN
	m <= (NOT (s) AND x) OR (s AND y);
END ARCHITECTURE;