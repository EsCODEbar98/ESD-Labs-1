library ieee;
use ieee.std_logic_1164.all;

-- empty entity section
entity mux2to1_tb is
end mux2to1_tb;

architecture test of mux2to1_tb is
  constant dw : positive := 8;
  signal in1 :  std_logic_vector ( dw - 1  downto 0);
  signal in2 :  std_logic_vector ( dw - 1 downto 0);
  signal sel :  std_logic;
  signal m_dut, m_ref : std_logic_vector ( dw - 1 downto 0);
  
begin
  -- example input
  in1 <= "00000000";
  in2 <= "11111111";
  
  sel <= '0', '1' after 5 ns;
  DUT: entity work.mux2to1_gen port map( x => in1, y => in2, s => sel, m => m_dut);
    
-- expected output
with sel select
m_ref <=
  in2 when '1',
  in1 when others;
  
  
end test;
