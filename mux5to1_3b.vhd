LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux5to1_3b IS
	PORT ( u,v,w,x,y : IN STD_LOGIC_VECTOR( 2 downto 0 ); 				
			 s : IN STD_LOGIC_VECTOR (2 downto 0); 
			 m : OUT STD_LOGIC_VECTOR( 2 downto 0 ) );						
END mux5to1_3b;

ARCHITECTURE mux_structure OF mux5to1_3b IS

COMPONENT mux5to1									
	PORT ( u,v,w,x,y : IN STD_LOGIC; 				
			 s : IN STD_LOGIC_VECTOR (2 downto 0);
			 m : OUT STD_LOGIC );
END COMPONENT;
BEGIN

	Mux1 : mux5to1 PORT MAP ( u => u(0) , v => v(0) , w => w(0) , x => x(0) , y => y(0) , s => s , m => m(0) );
	Mux2 : mux5to1 PORT MAP ( u => u(1) , v => v(1) , w => w(1) , x => x(1) , y => y(1) , s => s , m => m(1) );
	Mux3 : mux5to1 PORT MAP ( u => u(2) , v => v(2) , w => w(2) , x => x(2) , y => y(2) , s => s , m => m(2) );
	
	
END mux_structure;