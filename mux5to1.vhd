library ieee;
use ieee.std_logic_1164.all;

--Multiplexer with 5 inputs and 3 selection signals

entity mux5to1 is
port (
       u,v,w,x,y : in STD_LOGIC;
       s : in STD_LOGIC_VECTOR (2 downto 0);
       m : out STD_LOGIC
      );
end mux5to1;

--mux5to1 using 4 mux 2to1
architecture mux_structure of mux5to1 is
signal m_uv,m_wx,m_uv_wx : STD_LOGIC ;

component mux2to1
port (
     x,y : in STD_LOGIC;
     s : in STD_LOGIC;
     m : out STD_LOGIC
     );
end component;

begin
	MUX1 : mux2to1 port map ( x => u , y => v , s => s(0) , m => m_uv );
	MUX2 : mux2to1 port map ( x => w , y => x , s => s(0) , m => m_wx );
	MUX3 : mux2to1 port map ( x => m_uv , y => m_wx , s => s(1) , m => m_uv_wx );
	MUX4 : mux2to1 port map ( x => m_uv_wx , y=> y , s => s(2) , m => m );

end mux_structure;
