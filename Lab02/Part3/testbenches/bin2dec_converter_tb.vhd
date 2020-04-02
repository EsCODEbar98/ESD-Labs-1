library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2dec_converter_tb is
end bin2dec_converter_tb;

architecture behaviour of bin2dec_converter_tb is
  signal n_in: unsigned (3 downto 0);
  signal HEXA0: std_logic_vector (0 to 6);
  signal HEXA1: std_logic_vector (0 to 6);
  signal HEXA0_dut: integer;
  signal HEXA1_dut: integer;
  signal out_ref: integer;

  component bin2dec_converter
    port (
          SW: in unsigned (3 downto 0);
          HEX0: out std_logic_vector (0 to 6);
          HEX1: out std_logic_vector (0 to 6));
  end component;

begin

    n_in <= "0000", "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns, 
      	           "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, 
      	           "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns,
      	           "1010" after 50 ns, "1011" after 55 ns, "1100" after 60 ns,
      	           "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns;
  
   
    CONV: bin2dec_converter port map (n_in,HEXA0,HEXA1);    
        
    -- conv out to dec
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
          
    out_ref <= to_integer(n_in);
end architecture;

