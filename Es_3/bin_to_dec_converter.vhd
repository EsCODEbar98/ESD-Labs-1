Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity bin_to_dec_converter is
  
  port ( v : in UNSIGNED (3 downto 0);
         HEXA0 : out STD_LOGIC_VECTOR (0 to 6);
         HEXA1 : out STD_LOGIC_VECTOR (0 to 6)
      );

end bin_to_dec_converter;

Architecture behaviour of bin_to_dec_converter is
  
  signal z_temp : STD_LOGIC;
  signal m_temp : STD_LOGIC_VECTOR (3 downto 0);
  
begin 
  
  
  CONVERTER: entity work.converter port map(v,m_temp,z_temp);
    
  CIRCUIT_B: entity work.circuit_B port map(z_temp,HEXA1);
    
  BIN_TO_DEC_DECODER: entity work.bin_to_dec_decoder port map(m_temp,HEXA0);
    
  
end architecture;