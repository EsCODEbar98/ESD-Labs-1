library ieee;
use ieee.std_logic_1164.all;

--Il programma associa ingressi e uscite del mux5to1 a 
--periferiche di input e output identificabili della sheda DE2

entity mux5to1_3b_synth is
port ( 
     SW : in std_logic_vector( 17 downto 0 );     --SW(0to7)->X, SW(8to15) ->Y, SW(17)->S				
     LEDR : out std_logic_vector(2 downto 0);    --Permette di vedere il valore assunto dal segnale selettore
     LEDG : out std_logic_vector( 2 downto 0)     --LEDG->M
);						
end mux5to1_3b_synth;

architecture structure of mux5to1_3b_synth is
begin
MUX: entity work.mux5to1_gen
     generic map(3)
     port map( u => SW( 14 downto 12 ), 
	       v => SW( 11 downto 9 ),
	       w => SW( 8 downto 6 ),
    	       x => SW( 5 downto 3 ),
	       y => SW( 2 downto 0 ),
	       s => SW( 17 downto 15 ),  
	       M => LEDG 
       );									
													  
													  
    LEDR <= SW (17 downto 15);   -- led to selec
end structure;	
