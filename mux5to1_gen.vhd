library ieee;
use ieee.std_logic_1164.all;

--Multiplexer with 5 inputs and 3 selection signals

entity mux5to1_gen is
  
--Si utilizza un generic nonostanto il mux5to1 
--non necessiti di essere riutilizzato nell'ottica del riutilizzo
generic ( p : POSITIVE := 3);
port (
       u,v,w,x,y : in STD_LOGIC_VECTOR ( (p-1) downto 0);
       s : in STD_LOGIC_VECTOR (2 downto 0);
       m : out STD_LOGIC_VECTOR ( (p-1) downto 0)
      );
end mux5to1_gen;

--mux5to1 using 4 mux 2to1
architecture mux_structure of mux5to1_gen is
  
signal m_uv,m_wx,m_uv_wx : STD_LOGIC_VECTOR ( (p-1) downto 0 ) ;


component mux2to1_gen
generic ( p : POSITIVE := p);
port ( 
       x,y : in STD_LOGIC_VECTOR( (p-1) downto 0 );	
       s : in STD_LOGIC;	
       m : out STD_LOGIC_VECTOR( (p-1) downto 0 )
);
end component;

begin
	MUX1 : mux2to1_gen port map ( x => u , y => v , s => s(0) , m => m_uv );
	MUX2 : mux2to1_gen port map ( x => w , y => x , s => s(0) , m => m_wx );
	MUX3 : mux2to1_gen port map ( x => m_uv , y => m_wx , s => s(1) , m => m_uv_wx );
	MUX4 : mux2to1_gen port map ( x => m_uv_wx , y=> y , s => s(2) , m => m );

end mux_structure;

