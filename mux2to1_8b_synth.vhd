library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8b_synth is
port (
     SW : in STD_LOGIC_VECTOR ( 17 downto 0 );
	  LEDR : out STD_LOGIC;
     LEDG : out STD_LOGIC_VECTOR ( 7 downto 0 )
     );
end mux2to1_8b_synth;


architecture structure of mux2to1_8b_synth is

	  
begin

	MUX: entity work.mux2to1_8b port map( X => SW( 7 downto 0 ), Y => SW( 15 downto 8 ), S => SW(17), M => LEDG );
	
	LEDR <= SW(17);
	
end structure;


	
	