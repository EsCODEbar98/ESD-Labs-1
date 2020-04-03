library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n_bit_registered_adder_circuit is
  generic ( n : integer:=8);
  port( x,y : in signed(n-1 downto 0);
        clk, res : in std_logic;
        c_in : in std_logic := '0'; 
        ovf: out std_logic;
        s : out signed(n-1 downto 0)
      );
    
end entity;


architecture behavior of n_bit_registered_adder_circuit is
  
  component regn
    generic (n : integer := 8);
    port (
      r : in signed (n-1 downto 0);
      clock, resetn : in std_logic;
      q : out signed (n-1 downto 0)
    );
  end component;
  
  component flipflop
    port (
      d, clock, resetn : in std_logic;
      q : out std_logic
    );
  end component;
  
  component adder
    port (
      a, b : in std_logic_vector(7 downto 0);
      c_in : in std_logic; 
      cout: out std_logic;
      s : out std_logic_vector(7 downto 0)
    );
  end component;
  
  signal a1, b1 : signed (n-1 downto 0);
  signal result: std_logic_vector(n-1 downto 0);
  signal c_out: std_logic;
    
  begin
    
    REG1: regn generic map (8)
               port map (r => x, clock => clk, resetn => res, q => a1); 
                 
    REG2: regn generic map (8)
               port map (r => y, clock => clk, resetn => res, q => b1);
                 
    ADD: adder port map (a => std_logic_vector(a1), b => std_logic_vector(b1), c_in => c_in, cout => c_out, s => result); 
    
    REG3: regn generic map (8)
               port map(r => signed(result), clock => clk, resetn => res, q => s);
                 
    FF: flipflop port map (d => c_out, clock => clk, resetn => res, q => ovf);
    
    
end architecture;
