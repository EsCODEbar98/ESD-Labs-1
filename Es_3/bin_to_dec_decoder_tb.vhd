Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity bin_to_dec_decoder_tb is
end bin_to_dec_decoder_tb;

Architecture struct of bin_to_dec_decoder_tb is
  
  signal input_number : STD_LOGIC_VECTOR (3 downto 0);
  signal HEXA0_dut : STD_LOGIC_VECTOR (0 to 6 );
  
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
       
  end process; 
  
  DEC_DECODER: entity work.bin_to_dec_decoder port map (input_number,HEXA0_dut);
    
end architecture;
