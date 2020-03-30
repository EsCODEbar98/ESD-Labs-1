library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end decoder_tb;

architecture test of decoder_tb is
  
  signal sel : std_logic_vector(2 downto 0);
  signal output : std_logic_vector(0 to 6);
  signal out_ref : string(2 downto 1);

  component decoder
    port( sW : in std_logic_vector(2 downto 0);
         HEX0 : out std_logic_vector(0 to 6));
   end component;
  
  begin
    --assigned values to c2,c1,c0
    sel <= "000", "001" after 10 ns, "010" after 20 ns, "011" after 30 ns, "100" after 40 ns;
    DUT: decoder port map (SW => sel, HEX0 => output);
    
    --expected output
    with sel select 
     out_ref <= 
      "h " when "000",
      "e " when "001",
      "l " when "010",
      "o " when "011",
      "x " when others;
      
  end test;
