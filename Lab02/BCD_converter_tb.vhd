Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity BCD_converter_tb is
  

end BCD_converter_tb;

Architecture behaviour of BCD_converter_tb is
  
  signal input_number : UNSIGNED (5 downto 0);
  signal HEXA0_DUT : STD_LOGIC_VECTOR (0 to 6);
  signal HEXA1_DUT : STD_LOGIC_VECTOR (0 to 6);
  signal HEXA0_REF : INTEGER;
  signal HEXA1_REF : INTEGER;
  signal REF : INTEGER;

  component BCD_converter
    port ( SW : in UNSIGNED (5 downto 0);
         HEXA0 : out STD_LOGIC_VECTOR (0 to 6);
         HEXA1 : out STD_LOGIC_VECTOR (0 to 6));
  end component;
  
begin 
  
  process
  begin
    
       input_number <= "000000";
       WAIT FOR 20 ns;
       input_number <= "000001";
       WAIT FOR 20 ns;
       input_number <= "000010";
       WAIT FOR 20 ns;
       input_number <= "000011";
       WAIT FOR 20 ns;
       input_number <= "000100";
       WAIT FOR 20 ns;
       input_number <= "000101";
       WAIT FOR 20 ns;
       input_number <= "000110";
       WAIT FOR 20 ns;
       input_number <= "000111";
       WAIT FOR 20 ns;
       input_number <= "001000";
       WAIT FOR 20 ns;
       input_number <= "001001";
       WAIT FOR 20 ns;
       input_number <= "001010";
       WAIT FOR 20 ns;
       input_number <= "001011";
       WAIT FOR 20 ns;
       input_number <= "001100";
       WAIT FOR 20 ns;
       input_number <= "001101";
       WAIT FOR 20 ns;
       input_number <= "001110";
       WAIT FOR 20 ns;
       input_number <= "001111";
       WAIT FOR 20 ns;
       input_number <= "010000";
       WAIT FOR 20 ns;
       input_number <= "010001";
       WAIT FOR 20 ns;
       input_number <= "010010";
       WAIT FOR 20 ns;
       input_number <= "010011";
       WAIT FOR 20 ns;
       input_number <= "010100";
       WAIT FOR 20 ns;
       input_number <= "010101";
       WAIT FOR 20 ns;
       input_number <= "010110";
       WAIT FOR 20 ns;
       input_number <= "010111";
       WAIT FOR 20 ns;
       input_number <= "011000";
       WAIT FOR 20 ns;
       input_number <= "011001";
       WAIT FOR 20 ns;
       input_number <= "011010";
       WAIT FOR 20 ns;
       input_number <= "011011";
       WAIT FOR 20 ns;
       input_number <= "011100";
       WAIT FOR 20 ns;
       input_number <= "011101";
       WAIT FOR 20 ns;
       input_number <= "011110";
       WAIT FOR 20 ns;
       input_number <= "011111";
       WAIT FOR 20 ns;
       input_number <= "100000";
       WAIT FOR 20 ns;
       input_number <= "100001";
       WAIT FOR 20 ns;
       input_number <= "100010";
       WAIT FOR 20 ns;
       input_number <= "100011";
       WAIT FOR 20 ns;
       input_number <= "100100";
       WAIT FOR 20 ns;
       input_number <= "100101";
       WAIT FOR 20 ns;
       input_number <= "100110";
       WAIT FOR 20 ns;
       input_number <= "100111";
       WAIT FOR 20 ns;
       input_number <= "101000";
       WAIT FOR 20 ns;
       input_number <= "101001";
       WAIT FOR 20 ns;
       input_number <= "101010";
       WAIT FOR 20 ns;
       input_number <= "101011";
       WAIT FOR 20 ns;
       input_number <= "101100";
       WAIT FOR 20 ns;
       input_number <= "101101";
       WAIT FOR 20 ns;
       input_number <= "101110";
       WAIT FOR 20 ns;
       input_number <= "101111";
       WAIT FOR 20 ns;
       input_number <= "110000";
       WAIT FOR 20 ns;
       input_number <= "110001";
       WAIT FOR 20 ns;
       input_number <= "110010";
       WAIT FOR 20 ns;
       input_number <= "110011";
       WAIT FOR 20 ns;
       input_number <= "110100";
       WAIT FOR 20 ns;
       input_number <= "110101";
       WAIT FOR 20 ns;
       input_number <= "110110";
       WAIT FOR 20 ns;
       input_number <= "110111";
       WAIT FOR 20 ns;
       input_number <= "111000";
       WAIT FOR 20 ns;
       input_number <= "111001";
       WAIT FOR 20 ns;
       input_number <= "111010";
       WAIT FOR 20 ns;
       input_number <= "111011";
       WAIT FOR 20 ns;
       input_number <= "111100";
       WAIT FOR 20 ns;
       input_number <= "111101";
       WAIT FOR 20 ns;
       input_number <= "111110";
       WAIT FOR 20 ns;
       input_number <= "111111";
       WAIT FOR 20 ns;
       
  end process;  

    CONV: BCD_converter port map (input_number,HEXA0_dut,HEXA1_dut);
      
  with HEXA0_DUT select 
     HEXA0_REF <= 
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
      
    with HEXA1_DUT select 
     HEXA1_REF <= 
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
    
      
  REF <= to_integer(input_number);
  
end architecture;

