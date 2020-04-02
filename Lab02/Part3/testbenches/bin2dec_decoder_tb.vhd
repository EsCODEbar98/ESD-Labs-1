library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity bin2dec_decoder_tb is
end bin2dec_decoder_tb;

Architecture struct of bin2dec_decoder_tb is
  
  signal n_in : std_logic_vector (3 downto 0);
  signal HEXA0_dut : std_logic_vector (0 to 6 );
  
  component bin2dec_decoder
    port (
          m : in std_logic_vector (3 downto 0);
          HEX0 : out std_logic_vector (0 to 6));
  end component;
    
begin 
  
  n_in <= "0000", "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, 
      	           "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, 
      	           "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns;
   
  
  DEC_DECODER: bin2dec_decoder port map (n_in,HEXA0_dut);
    
end architecture;
