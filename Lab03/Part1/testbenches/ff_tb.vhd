library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_tb is
end ff_tb;

architecture test of ff_tb is
  
  component flipflop
    port (
      d, clock, resetn : in std_logic;
      q : out std_logic
    );
  end component;
  
  signal input, clk, output, output_exp : std_logic;
  
  begin
    
    input <= '1', '0' after 10 ns, '1' after 15 ns;
    clk <= '0', '1' after 10 ns, '0' after 15 ns, '1' after 20 ns;
    
    DUT: flipflop port map (input, clk, '1', output);
      
    output_exp <= '0', '1' after 20 ns;
  
end architecture;
