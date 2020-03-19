library ieee;
use ieee.std_logic_1164.all;

--simple multiplexer with 2 inputs
entity mux2to1 is
port ( 
       x,y : in STD_LOGIC;	
       s : in STD_LOGIC;	
       m : out STD_LOGIC
);
end mux2to1;


architecture logic of mux2to1 is
begin
	m <= (NOT (s) AND x) OR (s AND y);
end architecture;
