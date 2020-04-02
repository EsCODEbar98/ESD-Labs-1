library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity circuit_A_tb is
end circuit_A_tb;

architecture struct of circuit_A_tb is
  
  signal n_in : unsigned (2 downto 0);
  signal u_dut : unsigned (2 downto 0); 
  
  component circuit_A
     port (
           v : in unsigned(2 downto 0);
           u : out unsigned(2 downto 0)
     );
   end component;

begin
  
  n_in <= "010", "011" after 5 ns,"100" after 10 ns, "101" after 15 ns, "110" after 20 ns,"111" after 25 ns;
   
  
  CIRC_A: circuit_A port map( n_in, u_dut );
  
end architecture;
