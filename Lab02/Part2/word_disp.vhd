library ieee;
use ieee.std_logic_1164.all;


entity word_disp is 
port(
    SW : in std_logic_vector( 17 downto 0);
    HEX0 : out std_logic_vector(6 downto 0);
    HEX1 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX3 : out std_logic_vector(6 downto 0);
    HEX4 : out std_logic_vector(6 downto 0)
);
end word_disp;


architecture Behavior of word_disp is

component char_displayer
port (
  sel, CH0, CH1, CH2, CH3, CH4 : in std_logic_vector ( 2 downto 0);
  HEX: out std_logic_vector ( 6 downto 0)   
);
end component;

signal sel, H, E, L1, L2, O : std_logic_vector(2 downto 0);

begin

sel <= SW(17 downto 15);
H <= SW(14 downto 12);
E <= SW(11 downto 9);
L1 <= SW (8 downto 6);
L2 <= SW(5 downto 3);
O <= SW(2 downto 0);

WD0 : char_displayer port map ( sel, H, E, L1, L2, O, HEX4);
WD1 : char_displayer port map ( sel, E, L1, L2, O, H, HEX3);
WD2 : char_displayer port map ( sel, L1, L2, O, H, E, HEX2);
WD3 : char_displayer port map ( sel, L2, O, H, E, L1, HEX1);
WD4 : char_displayer port map ( sel, O, H, E, L1, L2, HEX0);
   
end Behavior;
