library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2dec_converter is
  port (
       SW: in unsigned (3 downto 0);
       HEX0: out std_logic_vector (0 to 6);
       HEX1: out std_logic_vector (0 to 6)
  );
end bin2dec_converter;


architecture behaviour of bin2dec_converter is
  signal z_temp: std_logic;
  signal m_temp: std_logic_vector (3 downto 0);
  
  component converter
    port (
          v: in unsigned (3 downto 0);
          m: out std_logic_vector (3 downto 0);
          z: out std_logic
     );
  end component;
  
  component circuit_B
    port (
          z: in std_logic;
          HEX1: out std_logic_vector (0 to 6)
    );
  end component;
  
  component bin2dec_decoder
    port (
          m: in std_logic_vector (3 downto 0);
          HEX0: out std_logic_vector (0 to 6)
    );
  end component;

begin
  CONV : converter port map (SW, m_temp, z_temp);
  CIRC_B : circuit_b port map (z_temp, HEX1);
  DEC: bin2dec_decoder port map (m_temp, HEX0);
end architecture;

