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
    port ( v : in UNSIGNED (3 downto 0);
         HEX0 : out STD_LOGIC_VECTOR (0 to 6);
         HEX1 : out STD_LOGIC_VECTOR (0 to 6));
  end component;
  
begin 
  
  process
  begin
    
       input_number <= "0000";
       WAIT FOR 20 ns;
       input_number <= "0001";
       WAIT FOR 20 ns;
       input_number <= "0010";
       WAIT FOR 20 ns;
       input_number <= "0011";
       WAIT FOR 20 ns;
       input_number <= "0100";
       WAIT FOR 20 ns;
       input_number <= "0101";
       WAIT FOR 20 ns;
       input_number <= "0110";
       WAIT FOR 20 ns;
       input_number <= "0111";
       WAIT FOR 20 ns;
       input_number <= "1000";
       WAIT FOR 20 ns;
       input_number <= "1001";
       WAIT FOR 20 ns;
       input_number <= "1010";
       WAIT FOR 20 ns;
       input_number <= "1011";
       WAIT FOR 20 ns;
       input_number <= "1100";
       WAIT FOR 20 ns;
       input_number <= "1101";
       WAIT FOR 20 ns;
       input_number <= "1110";
       WAIT FOR 20 ns;
       input_number <= "1111";
       WAIT FOR 20 ns;
       
  end process;  

    CONV: bin_to_dec_converter port map (input_number,HEXA0,HEXA1);
      
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
