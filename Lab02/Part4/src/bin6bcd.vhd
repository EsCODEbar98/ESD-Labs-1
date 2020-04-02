--Binary to BCD converter

library ieee;
use ieee.std_logic_1164.all;

entity bin6bcd is
  port ( b : in std_logic_vector (5 downto 0);
         d1 : out std_logic_vector(0 to 6);
         d0 : out std_logic_vector(0 to 6)
   );
end bin6bcd;

architecture behavior of bin6bcd is
  
  component LUT
   port (x3, x2, x1, x0 : in std_logic;
         u: out std_logic_vector (3 downto 0)
   );
  end component;
  
  component bin2dec_decoder is
    port (m : in std_logic_vector (3 downto 0);
          HEX0 : out std_logic_vector (0 to 6)
    );
  end component;
  
  signal m1 : std_logic_vector(3 downto 0);
  signal m2 : std_logic_vector(3 downto 0);
  signal m3 : std_logic_vector(3 downto 0);
  signal p :  std_logic_vector (7 downto 0);
  
  begin
    
    p(7) <= '0';
    p(0) <= b(0);
    
    L1: LUT port map ('0', b(5), b(4), b(3), m1);
    p(6) <= m1(3);
    L2: LUT port map (m1(2), m1(1), m1(0), b(2), m2);
    p(5) <= m2(3);
    L3: LUT port map (m2(2), m2(1), m2(0), b(1), m3);
    p(4 downto 1) <= m3(3 downto 0); 
        
    DISPLAY1: bin2dec_decoder port map (p(7 downto 4), d1);
    DISPLAY0: bin2dec_decoder port map (p(3 downto 0), d0);
        
end behavior;
