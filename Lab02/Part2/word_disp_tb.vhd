library ieee;
use ieee.std_logic_1164.all;


entity word_disp_tb is
end word_disp_tb;

architecture test of word_disp_tb is

component word_disp 
port(
    SW : in std_logic_vector( 17 downto 0);
    HEX0 : out std_logic_vector(6 downto 0);
    HEX1 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX3 : out std_logic_vector(6 downto 0);
    HEX4 : out std_logic_vector(6 downto 0)
);
end component;

-- port interface
signal SW :  std_logic_vector( 17 downto 0);
signal H0, H1, H2, H3, H4 : std_logic_vector(6 downto 0);

-- tmp signals
signal HELLO : std_logic_vector (14 downto 0);

begin

-- simulating HELLO rotation example
--        -H--E--L--L--O-  
HELLO <= "000001010010011";

      
SW <= "000" & HELLO,            
      "001" & HELLO after 5 ns,  
      "010" & HELLO after 10 ns, 
      "011" & HELLO after 15 ns, 
      "100" & HELLO after 20 ns; 
      
DUT : word_disp port map ( SW, H0, H1, H2, H3, H4);

end architecture;
