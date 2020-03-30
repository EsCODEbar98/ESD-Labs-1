library ieee;
use ieee.std_logic_1164.all;

entity char_displayer is 
port(
   sel, CH0, CH1, CH2, CH3, CH4 : in std_logic_vector ( 2 downto 0);
   HEX: out std_logic_vector ( 6 downto 0)    
);
end char_displayer ;


architecture Behavior of char_displayer is

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

signal m : std_logic_vector ( 2 downto 0);

begin
MX : mux5to1_gen generic map(3) 
     port map ( sel, CH0, CH1, CH2, CH3, CH4, m);

H:  char_7seg port map (m, HEX);  


end architecture;


