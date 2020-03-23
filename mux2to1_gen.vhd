library ieee;
use ieee.std_logic_1164.all;

--simple multiplexer with 2 inputs
entity mux2to1_gen is
generic ( p : POSITIVE := 1 );
port ( 
       x,y : in STD_LOGIC_VECTOR( (p-1) downto 0 );	
       s : in STD_LOGIC;	
       m : out STD_LOGIC_VECTOR( (p-1) downto 0 )
);
end mux2to1_gen;


architecture logic of mux2to1_gen is
  
  signal s_vector : STD_LOGIC_VECTOR ((p-1) downto 0 );
  
begin
  s_vector <= ( others => s ); 
	m <= (NOT (s_vector) AND x) OR (s_vector AND y);
end architecture;
