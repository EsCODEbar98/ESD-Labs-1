library ieee;
use ieee.std_logic_1164.all;


entity char_displayer_tb is
end char_displayer_tb;


architecture test of char_displayer_tb is

component char_displayer is 
port(
   sel, CH0, CH1, CH2, CH3, CH4 : in std_logic_vector ( 2 downto 0);
   HEX: out std_logic_vector ( 6 downto 0)    
);
end component;

signal sel, CH0, CH1, CH2, CH3, CH4: std_logic_vector(2 downto 0);
signal l_out : std_logic_vector(0 to 6);

begin
--example input
CH0 <= "000"; -- H
CH1 <= "011"; -- O
CH2 <= "010"; -- L
CH3 <= "001"; -- E
CH4 <= "111"; -- void
 
-- test cases
sel <= "000", "001" after 10 ns, "010" after 20 ns, "011" after 30 ns, "100" after 40 ns;

-- design under test
DUT : char_displayer port map (sel, CH0, CH1, CH2, CH3, CH4, l_out);
end architecture;
