library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
  port (
    a, b : in std_logic_vector(7 downto 0);
    c_in : in std_logic; 
    cout : out std_logic;
    s : out std_logic_vector(7 downto 0)
  );
end adder;

architecture sum of adder is
  
  component fulladder
    port (
      a, b: in std_logic; 
      c_in: in std_logic; 
    s, c_out : out std_logic
    );
  end component;
  
  signal c : std_logic_vector(7 downto 0);
  
  begin
    FA0: fulladder port map (a => a(0), b => b(0), c_in => '0', s => s(0),  c_out => c(0));
    FA1: fulladder port map (a => a(1), b => b(1), c_in => c(0), s => s(1), c_out => c(1));  
    FA2: fulladder port map (a => a(2), b => b(2), c_in => c(1), s => s(2), c_out => c(2));
    FA3: fulladder port map (a => a(3), b => b(3), c_in => c(2), s => s(3), c_out => c(3));
    FA4: fulladder port map (a => a(4), b => b(4), c_in => c(3), s => s(4), c_out => c(4));
    FA5: fulladder port map (a => a(5), b => b(5), c_in => c(4), s => s(5), c_out => c(5));
    FA6: fulladder port map (a => a(6), b => b(6), c_in => c(5), s => s(6), c_out => c(6));
    FA7: fulladder port map (a => a(7), b => b(7), c_in => c(6), s => s(7), c_out => c(7)); 
      
    cout <= c(7) xor c(6);
  
end sum;
