library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8b_synth is
port (
     SW   : in std_logic_vector ( 17 downto 0 );
     LEDR : out std_logic;
     LEDG : out std_logic_vector ( 7 downto 0 )
     );
end mux2to1_8b_synth;


architecture structure of mux2to1_8b_synth is
begin

MUX: entity work.mux2to1_gen 
    generic map (8)
    port map( X => SW( 7 downto 0 ), 
              Y => SW( 15 downto 8 ), 
              S => SW(17), 
              M => LEDG 
    );
LEDR <= SW(17);

end structure;


	
	
