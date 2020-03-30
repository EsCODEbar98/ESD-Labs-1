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
signal H : std_logic_vector (2 downto 0);
signal E : std_logic_vector (2 downto 0);
signal L1 : std_logic_vector (2 downto 0);
signal L2 : std_logic_vector (2 downto 0);
signal O : std_logic_vector (2 downto 0);

begin

H <=  "000";
E <=  "001";
L1 <= "010";
L2 <= "010";
O <=  "011";

-- simulating HELLO rotation example      
SW <= "000" & H & E & L1 & L2 & O,            
      "001" & E &L1 & L2 & O & H after 5 ns,  
      "010" & L1 & L2 & O & H & E after 10 ns, 
      "011" & L2 & O & H & E & L1 after 15 ns, 
      "100" & O & H & E & L1 & L2 after 20 ns; 
      
DUT : word_disp port map ( SW, H0, H1, H2, H3, H4);

end architecture;
