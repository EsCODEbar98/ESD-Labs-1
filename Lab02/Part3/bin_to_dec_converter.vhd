Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity bin_to_dec_converter is
  
  port ( v : in UNSIGNED (3 downto 0);
         HEX0 : out STD_LOGIC_VECTOR (0 to 6);
         HEX1 : out STD_LOGIC_VECTOR (0 to 6)
      );

end bin_to_dec_converter;

Architecture behaviour of bin_to_dec_converter is
  
  --segnali necessari al collegamento dei vari blocchi
  signal z_temp : STD_LOGIC;
  signal m_temp : STD_LOGIC_VECTOR (3 downto 0);

component converter 
    port (  v : IN UNSIGNED(3 DOWNTO 0);
            m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC);
  end component;
  
  component circuit_B
    port (z : in STD_LOGIC;
          HEX1 : out STD_LOGIC_VECTOR(0 TO 6));
  end component;
  
  component bin_to_dec_decoder
    port (m : in std_logic_vector (3 downto 0);
          HEX0 : out std_logic_vector (0 to 6));
  end component;
  
begin 
  
  
  CONV: converter port map(v,m_temp,z_temp);
    
  CIRC_B: circuit_B port map(z_temp,HEX1);
    
  DEC: bin_to_dec_decoder port map(m_temp,HEX0);
    
  
end architecture;
