library ieee;
use ieee.std_logic_1164.all;


entity FA_tb is  
end FA_tb;
 
architecture struct of FA_tb is
   
 component FA
     
  port( a,b : in std_logic;
        c_in : in std_logic;
        s,c_out: out std_logic
      );
  end component;
      
  signal input_string : std_logic_vector(0 to 2);
  signal s_dut,c_out_dut : std_logic;
   
begin
  
  input_string <= "000","001" after 5 ns,"010" after 10 ns,
                  "011" after 15 ns,"100" after 20 ns,
                  "101" after 25 ns,"110" after 30 ns, "111" after 35 ns;
                  
  FULL_ADDER: FA port map(a => input_string(1),b => input_string(0),
                  c_in => input_string(2),s => s_dut,c_out => c_out_dut);
    
    
end architecture;
