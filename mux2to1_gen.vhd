library ieee;
use ieee.std_logic_1164.all;

--Multiplexer con  2 ingressi e parallelismo p
entity mux2to1_gen is
generic ( p : POSITIVE := 1 );   --si imposta 1 come valore di defaoult per il parallelismo  
port ( 
       x,y : in STD_LOGIC_VECTOR( (p-1) downto 0 );	
       s : in STD_LOGIC;	
       m : out STD_LOGIC_VECTOR( (p-1) downto 0 )
);
end mux2to1_gen;


architecture logic of mux2to1_gen is
 
  signal s_vector : STD_LOGIC_VECTOR ((p-1) downto 0 );     --segnale vettoriale in cui ciascun bit è uguale a s
  
begin
  s_vector <= ( others => s ); 
	m <= (NOT (s_vector) AND x) OR (s_vector AND y);   -- affinchè non si abbia errore di tipo bisogna usare s_vector, non s
end architecture;
