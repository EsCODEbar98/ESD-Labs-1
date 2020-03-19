LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2to1_8b is
PORT (
     X : in STD_LOGIC_VECTOR ( 7 downto 0 );
     Y : in STD_LOGIC_VECTOR ( 7 downto 0 );
     S : in STD_LOGIC;
     M : out STD_LOGIC_VECTOR ( 7 downto 0 );
     );
END mux2to1_8b;

ARCHITECTURE Behavioral of mux2to1_8b is
BEGIN
     -- 8 statements explicitly required 
     M(7) <= (NOT(S) AND X(7)) OR (S AND Y(7));  
     M(6) <= (NOT(S) AND X(6)) OR (S AND Y(6));
     M(5) <= (NOT(S) AND X(5)) OR (S AND Y(5));
     M(4) <= (NOT(S) AND X(4)) OR (S AND Y(4));	
     M(3) <= (NOT(S) AND X(3)) OR (S AND Y(3));
     M(2) <= (NOT(S) AND X(2)) OR (S AND Y(2));
     M(1) <= (NOT(S) AND X(1)) OR (S AND Y(1));
     M(0) <= (NOT(S) AND X(0)) OR (S AND Y(0));
END Behavioral


