library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity carryselectadder_tb is
end entity;

architecture test of carryselectadder_tb is
  
  component carryselectadder is
    port ( 
    a, b: in std_logic_vector(3 downto 0);
    c_in: in std_logic;
    s : out std_logic_vector(3 downto 0);
    c_out, ovf : out std_logic
    );
   end component;
   
   signal in1, in2, sum, sum_ref : std_logic_vector(3 downto 0);
   signal cin, cout, ovfl, cout_ref, ovfl_ref : std_logic;
   
   begin
     --input values
     in1 <= "0001", "1010" after 5 ns, "0101" after 10 ns;
     in2 <= "0100", "1001" after 5 ns, "1000" after 10 ns;
     cin <= '1', '0' after 5 ns, '1' after 10 ns;
     
     --expected outputs
     sum_ref <= "0110", "0011" after 5 ns, "1110" after 10 ns;
     cout_ref <= '0', '1' after 5 ns, '0' after 10 ns;
     ovfl_ref <= '0', '1' after 5 ns, '0' after 10 ns;
     
     DUT: carryselectadder port map (in1, in2, cin, sum, cout, ovfl);
  
end test;
