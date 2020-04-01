library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin6bcd_tb is
end bin6bcd_tb;

architecture test of bin6bcd_tb is

  signal input_bin : std_logic_vector (5 downto 0);
  
  --expexted display values (decimals/units)
  signal out1, out0: INTEGER;   
  
  --bits that turn the display segments on (HEX1/HEX0)
  signal d1_dut, d0_dut : std_logic_vector(0 to 6); 

  component bin6bcd
     port (b : in std_logic_vector (5 downto 0);
           d1 : out std_logic_vector(0 to 6);
           d0 : out std_logic_vector(0 to 6));
  end component;


  begin
    --assign values to input
    input_bin <= "000000",
      "000110" after 5 ns,
      "000111" after 10 ns,
      "001010" after 15 ns,
      "001011" after 20 ns,
      "001111" after 25 ns,
      "010010" after 30 ns,
      "010100" after 35 ns,
      "011000" after 40 ns,
      "011011" after 45 ns,
      "100001" after 50 ns,
      "100101" after 55 ns,
      "101100" after 60 ns,
      "110000" after 65 ns,
      "110010" after 70 ns,
      "110011" after 75 ns,
      "111000" after 80 ns,
      "111111" after 85 ns;
    

    DUT: bin6bcd port map (input_bin, d1_dut, d0_dut);

    --expected decimal value on diplay d1
    with d1_dut select
    out1 <=
    0 when "0000001",
    1 when "1001111",
    2 when "0010010",
    3 when "0000110",
    4 when "1001100",
    5 when "0100100",
    6 when "0100000",
    10 when others;

    --expected decimal value on diplay d0
    with d0_dut select
    out0 <=
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
   


end test;
