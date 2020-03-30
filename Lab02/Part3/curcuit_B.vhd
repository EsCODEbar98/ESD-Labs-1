Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_B is
  PORT (  z : in STD_LOGIC;
          HEX1 : out STD_LOGIC_VECTOR(0 TO 6)
        );
end circuit_B;


Architecture behaviuor of circuit_B is
  
  component mux2to1_gen
    generic ( dw : positive := 1 );     
    port (x,y : in std_logic_vector ( dw - 1 downto 0 );	
          s : in std_logic;	
          m : out std_logic_vector ( dw -1 downto 0 ));
  end component;
  
begin
  
  MUX: mux2to1_gen generic map (7)
                  	 	 	        port map("0000001", "1111001", z, HEX1);
                  	 	 	          
end architecture;
