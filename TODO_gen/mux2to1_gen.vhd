library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_gen is
generic ( dw : positive := 1 );  -- data width   
port ( 
       x,y : in std_logic_vector ( dw - 1 downto 0 );	
       s : in std_logic;	
       m : out std_logic_vector ( dw -1 downto 0 )
);
end mux2to1_gen;


architecture logic of mux2to1_gen is
  signal s_vector : std_logic_vector ( dw -1 downto 0 ); 
  
begin
     s_vector <= ( others => s ); 
     m <= (NOT (s_vector) AND x) OR (s_vector AND y);   
end architecture;



