Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity bin_to_dec_converter_tb is
  

end bin_to_dec_converter_tb;

Architecture behaviour of bin_to_dec_converter_tb is
  
  signal input_number : UNSIGNED (3 downto 0);
  signal HEXA0 : STD_LOGIC_VECTOR (0 to 6);  
  signal HEXA1 : STD_LOGIC_VECTOR (0 to 6);
  signal HEXA0_dut : INTEGER;        
  signal HEXA1_dut : INTEGER;
  signal out_ref : INTEGER;

  component bin_to_dec_converter
    port ( SW : in UNSIGNED (3 downto 0);
         HEX0 : out STD_LOGIC_VECTOR (0 to 6);
         HEX1 : out STD_LOGIC_VECTOR (0 to 6));
  end component;
  
begin 
  input_number <= "0000", "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, 
      	           "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, 
      	           "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns,
      	           "1010" after 50 ns, "1011" after 55 ns, "1100" after 60 ns,
      	           "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns;
  
   

    CONV: bin_to_dec_converter port map (input_number,HEXA0,HEXA1);
    
    
    
    --si traducono le uscite del convertitore nelle loro 
    --rappresentazion decimali
    with HEXA0 select 
     HEXA0_dut <= 
      0 when "0000001",
      1 when "1001111",
      2 when "0010010",
      3 when "0000110",
      4 when "1001100",
      5 when "0100100",
      6 when "0100000",
      7 when "0001111",
      8 when "0000000",
      9 when "0000100",
      10 when others;
      
    with HEXA1 select 
     HEXA1_dut <= 
      0 when "0000001",
      1 when "1001111",
      2 when "0010010",
      3 when "0000110",
      4 when "1001100",
      5 when "0100100",
      6 when "0100000",
      7 when "0001111",
      8 when "0000000",
      9 when "0000100",
      10 when others;
      
    
    out_ref <= to_integer(input_number);
  
end architecture;
