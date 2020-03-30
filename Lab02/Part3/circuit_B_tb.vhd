Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity circuit_B_tb is
end circuit_B_tb;


Architecture behaviuor of circuit_B_tb is
  
  signal sel : STD_LOGIC;
  signal out_ref : STD_LOGIC_VECTOR(0 TO 6);

  component circuit_B
    port (z : in STD_LOGIC;
          HEX1 : out STD_LOGIC_VECTOR(0 TO 6));
  end component;

begin
  
  sel <= '0', '1' after 5 ns;
  CIRC_B: circuit_B port map(sel, out_ref);
                  	 	 	          
end architecture;
