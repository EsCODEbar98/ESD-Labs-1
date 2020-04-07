library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity csa_tb is
end csa_tb;

architecture test of csa_tb is
  
  component CSA
     port( 
        A,B : in signed( 15 downto 0 );
        c_in : in std_logic;
        S : out signed( 15 downto 0 );
        c_out,ovf_det : out std_logic
      );
    end component;
    
    signal in1, in2, sum, sum_ref : signed(15 downto 0);
    signal cin, cout, cout_ref, ovf, ovf_ref : std_logic;
    
    begin
      --input values
      in1 <= "0000000000000001", "1000000000000001" after 5 ns, "0000000000001111" after 10 ns,
      "0101010101010101" after 15 ns, "0101010101010101" after 20 ns;
      
      in2 <= "0000000000000101", "1000000000000000" after 5 ns, "1000000000000000" after 10 ns,
      "1010101000101010" after 15 ns,  "0000000000000011" after 20 ns;
      
      cin <= '0', '1' after 5 ns, '1' after 10 ns, '0' after 15 ns, '1' after 20 ns;
      
      --expected outputs
      sum_ref <= "0000000000000110", "0000000000000010" after 5 ns, "1000000000010000" after 10 ns,
      "1111111101111111" after 15 ns, "0101010101011001" after 20 ns;
      
      cout_ref <= '0', '1' after 5 ns, '0' after 10 ns, '0' after 15 ns, '0' after 20 ns;
      
      ovf_ref <= '0', '1' after 5 ns, '0' after 10 ns, '0' after 15 ns, '0' after 20 ns;
      
      DUT: CSA port map (in1, in2, cin, sum, cout, ovf); 
  
end test;
