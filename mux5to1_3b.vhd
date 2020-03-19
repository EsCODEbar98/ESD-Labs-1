library ieee;
use ieee.std_logic_1164.all;

entity mux5to1_3b is
port ( 
     u,v,w,x,y : in STD_LOGIC_VECTOR( 2 downto 0 ); 				
     s : in STD_LOGIC_VECTOR (2 downto 0); 
     m : out STD_LOGIC_VECTOR( 2 downto 0)
);						
end mux5to1_3b;

architecture mux_structure of mux5to1_3b is

component mux5to1							
port (
      u,v,w,x,y : in STD_LOGIC; 				
      s : in STD_LOGIC_VECTOR (2 downto 0);
      m : out STD_LOGIC );
end component;

begin
MUX1 : mux5to1 port map ( u => u(0) , v => v(0) , w => w(0) , x => x(0) ,
                          y => y(0) , s => s , m => m(0) );

MUX2 : mux5to1 port map ( u => u(1) , v => v(1) , w => w(1) , x => x(1) , 
                          y => y(1) , s => s , m => m(1) );

MUX3 : mux5to1 port map ( u => u(2) , v => v(2) , w => w(2) , x => x(2) , 
                          y => y(2) , s => s , m => m(2) );
		
end mux_structure;
