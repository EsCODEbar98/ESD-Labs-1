library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is 
end adder_tb;

architecture test of adder_tb is
  
  component adder
    port (
      a, b : in std_logic_vector(7 downto 0);
      c_in : in std_logic; 
      cout : out std_logic;
      s : out std_logic_vector(7 downto 0)
   );
  end component;
  
  signal x, y, sum: std_logic_vector (7 downto 0);
  signal ovf, ovf_ref: std_logic; --1 if ovf, 0 if not
  
  
  begin
    --input values assigned
    x <= "10001100", "00000110" after 5 ns, "00000001" after 10 ns;
    y <= "10000000", "10000010" after 5 ns, "00000110" after 10 ns;
    
    DUT: adder port map (x, y, '0', ovf, sum);
      
    ovf_ref <= '1', '0' after 5 ns, '0' after 10 ns;
    
  end test; 
