library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity exa_display_tb is
  

end exa_display_tb;


architecture behaviour of exa_display_tb is
  

  
  component exa_display
    port( SW : in signed (3 downto 0);
        HEXA : out std_logic_vector ( 0 to 6)
      );
  end component;
  
  signal n_in : signed (3 downto 0);
  signal out_dut : std_logic_vector (0 to 6);
  
begin
  
  n_in <= "0000", "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, 
      	           "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, 
      	           "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns,
      	           "1010" after 50 ns, "1011" after 55 ns, "1100" after 60 ns,
      	           "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns;
  
  DISPLAY: exa_display port map (n_in,out_dut);
      
      
end architecture;
      
