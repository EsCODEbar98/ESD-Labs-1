LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Multiplexer with 5 inputs and 3 selected signal

ENTITY mux5to1 IS
	PORT ( u,v,w,x,y : IN STD_LOGIC; 				--inputs
			 s : IN STD_LOGIC_VECTOR (2 downto 0); --selcted signals
			 m : OUT STD_LOGIC );						--output
END mux5to1;

--I build a mux5to1 using 4 mux 2to1
ARCHITECTURE mux_structure OF mux5to1 IS
SIGNAL m_uv,m_wx,m_uv_wx : STD_LOGIC ; 	--I need some intermediate signal to connect muxes
COMPONENT mux2to1									--Declaration of the component that will be used
	PORT ( in_1,in_2 : IN STD_LOGIC;	
		 s : IN STD_LOGIC;	
		 m : OUT STD_LOGIC);
END COMPONENT;
BEGIN
	--The scheme of the connections is more clear in the report
	Mux1 : mux2to1 PORT MAP ( in_1 => u , in_2 => v , s => s(0) , m => m_uv );
	Mux2 : mux2to1 PORT MAP ( in_1 => w , in_2 => x , s => s(0) , m => m_wx );
	Mux3 : mux2to1 PORT MAP ( in_1 => m_uv , in_2 => m_wx , s => s(1) , m => m_uv_wx );
	Mux4 : mux2to1 PORT MAP ( in_1 => m_uv_wx , in_2 => y , s => s(2) , m => m );
	
END mux_structure;

