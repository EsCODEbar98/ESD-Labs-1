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
signal m0, m1, m2, m3, m4 : std_logic_vector (2 downto 0);

begin

MX0: entity work.mux5to1_gen generic map (3)
     port map(SW(17 downto 15), SW(14 downto 12), SW(11 downto 9),  SW(8 downto 6),   SW(5 downto 3),   SW(2 downto 0),   m0);
MX1: entity work.mux5to1_gen generic map (3)
    port map(SW(17 downto 15), SW(11 downto 9),  SW(8 downto 6),   SW(5 downto 3),   SW(2 downto 0),   SW(14 downto 12), m1);
MX2: entity work.mux5to1_gen generic map (3)
    port map(SW(17 downto 15), SW(8 downto 6),   SW(5 downto 3),   SW(2 downto 0),   SW(14 downto 12), SW(11 downto 9),  m2);
MX3: entity work.mux5to1_gen generic map (3)
    port map(SW(17 downto 15), SW(5 downto 3),   SW(2 downto 0),   SW(14 downto 12), SW(11 downto 9),  SW(8 downto 6),   m3);
MX4: entity work.mux5to1_gen generic map (3)
    port map(SW(17 downto 15), SW(2 downto 0),   SW(14 downto 12), SW(11 downto 9),  SW(8 downto 6),   SW(5 downto 3),   m4);
	
H0: entity work.char_7seg port map(m0, HEX4);
H1: entity work.char_7seg port map(m1, HEX3);
H2: entity work.char_7seg port map(m2, HEX2);
H3: entity work.char_7seg port map(m3, HEX1);
H4: entity work.char_7seg port map(m4, HEX0);
   
end Behavior;
