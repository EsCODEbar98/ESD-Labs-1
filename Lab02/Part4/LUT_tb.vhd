library ieee;
use ieee.std_logic_1164.all;

entity LUT_tb is
      end LUT_tb;

architecture test of LUT_tb is

signal b_dut : std_logic_vector(3 downto 0);
signal out_dut: std_logic_vector(3 downto 0);


component LUT is
port (x :in std_logic_vector(3 downto 0);
      u: out std_logic_vector (3 downto 0));
      end component;
begin 
  
b_dut <= "0000", "0010" after 10 ns, "0100" after 20 ns, "0101" after 30 ns, "1000" after 40 ns, "1100" after 50 ns;
DUT: LUT port map (x=>b_dut,u=>out_dut);

end test;
