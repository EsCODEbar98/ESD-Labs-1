library ieee;
use ieee.std_logic_1164.all;

entity bin6bcd_tb is
end bin6bcd_tb;

architecture test of bin6bcd_tb is
  
  signal input_bin : std_logic_vector (5 downto 0);
  signal out1, out0 : std_logic_vector(3 downto 0);
  signal d1_dut, d0_dut : std_logic_vector(0 to 6);
   
  component bin6bcd
     port (b : in std_logic_vector (5 downto 0);
         d1 : out std_logic_vector(0 to 6);
         d0 : out std_logic_vector(0 to 6));
  end component;
 
  begin
    --assign values to input 
    input_bin <= "111111", "100100" after 10 ns, "000110" after 20 ns;
    
    DUT: bin6bcd port map (input_bin, d1_dut, d0_dut);
    
    --expected value
    with input_bin select
    out1 <=
      "0110" when "111111",
      "0011" when "100100", 
      "0000" when "000110",
      "0000" when others;
      
      with input_bin select
      out0 <=
       "0011" when "111111",
       "0110" when "100100", 
       "0110" when "000110",
       "0000" when others;
    
    
    
end test;
