library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity bin_to_dec_converter_tb is
end bin_to_dec_converter_tb;

architecture behaviour of bin_to_dec_converter_tb is
  
  signal input_number : UNSIGNED (3 downto 0);
  signal HEXA0_DUT : STD_LOGIC_VECTOR (0 to 6);
  signal HEXA1_DUT : STD_LOGIC_VECTOR (0 to 6);

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

    CONV: bin_to_dec_converter port map (input_number,HEXA0_dut,HEXA1_dut);
  
end architecture;
