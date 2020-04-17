library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometer_tb is

end cronometer_tb;


architecture gate of cronometer_tb is
  

  
  component cronometer
       port ( clk,key0,key3 : in std_logic;
         SW : in std_logic_vector (7 downto 0);
         LEDR : buffer std_logic;
         HEX0,HEX1,HEX2,HEX3 : out std_logic_vector ( 0 to 6)   
       );
  end component;
  
  
  
  signal clk, key0, key3,LEDR : std_logic;
  signal HEX0_dut,HEX1_dut,HEX2_dut,HEX3_dut : std_logic_vector (0 to 6);
  signal HEX0_dut_dec,HEX1_dut_dec,HEX2_dut_dec,HEX3_dut_dec : integer;
  
  
  
begin 
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ps;
    
    wait for 10 ps;
    
  end process CLK_GEN;
  
  
  
  key0 <= '1', '0' after 1 ps, '1' after 5621 ps,'0' after 5622 ps;
  key3 <= '0','1' after 5551 ps,'0' after 5552 ps;
  
  
 
  
  COUN: cronometer port map (clk,key0,key3,"00000011",ledr,
                              HEX0_dut,HEX1_dut,HEX2_dut,HEX3_dut);
                              
  
  with HEX0_dut select
    HEX0_dut_dec <=
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
    
  with HEX1_dut select
    HEX1_dut_dec <=
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
    
  with HEX2_dut select
    HEX2_dut_dec <=
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
    
  with HEX3_dut select
    HEX3_dut_dec <=
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
                              
  
      
end architecture;

