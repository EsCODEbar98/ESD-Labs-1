library ieee;
use ieee.std_logic_1164.all;


entity part3_tb is
  
end part3_tb;



architecture struct of part3_tb is
  
  component part3
    port ( Rst,clk,w : in std_logic;
         CS : out std_logic_vector ( 8 downto 0);
         z : out std_logic
       );
  end component;
  
  signal Rst,clk,w,z_dut : std_logic;
  -- signal CS_dut,NS_dut : std_logic_vector ( 8 downto 0);
  -- signal CS_state,NS_state : character;
  
  
begin
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ns;
    
    wait for 10 ns;
    
  end process CLK_GEN;
  
  Rst <= '1', '0' after 1 ns, '1' after 201 ns,'0' after 202 ns;
  
  w <= '0','1' after 26 ns,'0' after 36 ns,'1' after 76 ns,'0' after 126 ns;
  
  INSP: part3 port map (Rst=>Rst,clk=>clk,w=>w,z=>z_dut);
  
  
  
end architecture;

