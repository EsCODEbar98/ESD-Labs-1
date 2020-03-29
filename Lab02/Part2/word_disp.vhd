library ieee;
use ieee.std_logic_1164.all;


entity  word_disp is 
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

component mux5to1_gen 
generic ( dw : positive := 1);
port (
       s : in std_logic_vector (2 downto 0);
       u,v,w,x,y : in std_logic_vector (dw - 1 downto 0);
       m : out std_logic_vector (dw -1 downto 0)
);
end component;


component char_7seg 
port(
     c : in std_logic_vector (2 downto 0);
     disp : out std_logic_vector(0 to 6)
);
end component;

signal m0, m1, m2, m3, m4 : std_logic_vector (2 downto 0);
signal sel, H, E, L1, L2, O : std_logic_vector(2 downto 0);

begin

sel <= SW(17 downto 15);
H <= SW(14 downto 12);
E <= SW(11 downto 9);
L1 <= SW (8 downto 6);
L2 <= SW(5 downto 3);
O <= SW(2 downto 0);

MX0: mux5to1_gen generic map (3)
     port map(sel, H, E , L1, L2, O, m0);

MX1: mux5to1_gen generic map (3)
     port map(sel, E, L1, L2, O, H ,m1);

MX2: mux5to1_gen generic map (3)
    port map(sel, L1, L2, O, H, E, m2);

MX3: mux5to1_gen generic map (3)
    port map(sel, L2, O, H, E, L1,  m3);

MX4: mux5to1_gen generic map (3)
    port map(sel, O, H, E, L1, L2,  m4);
	
H0: char_7seg port map(m0, HEX4);
H1: char_7seg port map(m1, HEX3);
H2: char_7seg port map(m2, HEX2);
H3: char_7seg port map(m3, HEX1);
H4: char_7seg port map(m4, HEX0);
   
end Behavior;
