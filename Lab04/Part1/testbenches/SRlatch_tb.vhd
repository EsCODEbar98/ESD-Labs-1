library ieee;
use ieee.std_logic_1164.all;

entity SRlatch_tb is
end SRlatch_tb;

architecture test of SRlatch_tb is
  
  component SRlatch
    port (Clk, R, S : IN STD_LOGIC;
          Q : OUT STD_LOGIC);
  end component;
  
  signal clock, in_r, in_s, out_q, out_q_exp : std_logic;
  
begin
  
  --input values
  
  process
    begin
    clock <= '0', '1' after 2 ns; --4 ns periodic clock
    wait for 4 ns;
  end process;
    
    in_r <= '0', '1' after 13 ns, '0' after 17 ns, '1' after 23 ns, '0' after 27 ns;
    in_s <= '1', '0' after 11 ns, '1' after 17 ns, '0' after 21 ns, '1' after 27 ns, '0' after 29 ns;
    
  DUT: SRlatch port map (clock, in_r, in_s, out_q);
    
    --expexted output
    out_q_exp <= 'U', '1' after 2 ns, '0' after 14 ns, '1' after 18 ns, '0' after 23 ns, '1' after 27 ns;
    
    
end test;