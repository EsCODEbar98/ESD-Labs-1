library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_display_tb is
     
end adder_display_tb;



architecture struct of adder_display_tb is
  
  component adder_display
    
    port ( SW : in signed ( 16 downto 0 );
         KEY1,KEY0 : in std_logic;
         LEDG8 : out std_logic;
         LEDR : buffer signed ( 7 downto 0 );
         HEX7,HEX6,HEX5,HEX4,HEX1,HEX0 : out std_logic_vector(0 to 6)
         
       );
       
  end component;
  
  signal A : signed ( 7 downto 0 );
  signal B : signed ( 7 downto 0 );
  signal A_B : signed (16 downto 0);
  signal add_sub,ovf_det_dut,clk,Rst : std_logic;
  signal S_dut : signed ( 7 downto 0 );
  signal HEX7_dut,HEX6_dut,HEX5_dut,HEX4_dut,HEX1_dut,HEX0_dut : std_logic_vector(0 to 6);

  
begin
  
  process
  begin
    for i in 1 to 10 loop
      clk <= '0';
      wait for 2 ns;
      clk <= '1';
      wait for 2 ns;
    end loop;
  end process;
  
  add_sub <= '0', '1' after 16 ns;
  Rst <= '1','0' after 27 ns;
  
  A <= "10111010", "01110110" after 5 ns, "01111101" after 9 ns, "10101000" after 15 ns,
       "11110111" after 21 ns, "01000111" after 25 ns;
       
  B <= "10111010", "01110110" after 5 ns, "01111101" after 9 ns, "10101000" after 15 ns,
       "11110111" after 21 ns, "01000111" after 25 ns;
  
 A_B <= add_sub & A & B;
       
  ADD: adder_display port map (A_B, clk, Rst, ovf_det_dut, S_dut,
                                HEX7_dut,HEX6_dut,HEX5_dut,HEX4_dut,HEX1_dut,HEX0_dut);
  
  
  
  
end architecture;
