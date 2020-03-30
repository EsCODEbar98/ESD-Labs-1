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

signal sel, C0, C1, C2, C3, C4 : std_logic_vector(2 downto 0);

begin

sel <= SW(17 downto 15);
C0 <= SW(14 downto 12); -- first char
C1 <= SW(11 downto 9);  -- second char
C2 <= SW (8 downto 6);  -- thir chart
C3 <= SW(5 downto 3);   -- fourth char
C4 <= SW(2 downto 0);   -- fifth char

WD0 : char_displayer port map ( sel, C0, C1, C2, C3, C4, HEX4);
WD1 : char_displayer port map ( sel, C1, C2, C3, C4, C0, HEX3);
WD2 : char_displayer port map ( sel, C2, C3, C4, C0, C1, HEX2);
WD3 : char_displayer port map ( sel, C3, C4, C0, C1, C2, HEX1);
WD4 : char_displayer port map ( sel, C4, C0, C1, C2, C3, HEX0);
   
end Behavior;
