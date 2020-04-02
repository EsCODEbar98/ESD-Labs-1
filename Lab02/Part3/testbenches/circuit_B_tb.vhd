library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity circuit_B_tb is
end circuit_B_tb;

architecture behaviuor of circuit_B_tb is
  
  signal sel : std_logic;
  signal out_ref : std_logic_vector(0 to 6);

  component circuit_B
    port (
          z : in std_logic;
          HEX1 : out std_logic_vector(0 to 6)
    );
  end component;

begin
  sel <= '0', '1' after 5 ns;
  CIRC_B: circuit_B port map(sel, out_ref);             	 	 	   end architecture;
