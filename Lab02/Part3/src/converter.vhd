library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter is
    port (  
          v : in unsigned(3 downto 0);
          m : out std_logic_vector(3 downto 0);
          z : buffer std_logic
     );
end converter;

architecture struct of converter is
    
   component comparator
    port( v : in unsigned(3 downto 0);
          z : out std_logic);
  end component;
  
  component circuit_A
    port (v : in unsigned(2 downto 0);
          u : out unsigned(2 downto 0));
  end component;
  
  component mux2to1_gen 
    generic ( dw : positive := 1 );
    port( x,y : in std_logic_vector ( dw - 1 downto 0 );	
          s : in std_logic;	
          m : out std_logic_vector ( dw -1 downto 0 ));
  end component;
  
  signal u : unsigned (2 downto 0);
  
begin
  
  COMP: comparator port map (v,z);

  CIRC_A: circuit_A port map (v(2 downto 0), u);
    
  MUX0: mux2to1_gen port map (std_logic_vector(v(0 downto 0)), std_logic_vector(u(0 downto 0)), z,m(0 downto 0));
    
  MUX1: mux2to1_gen port map (std_logic_vector(v(1 downto 1)), std_logic_vector(u(1 downto 1)), z, m(1 downto 1));
  
  MUX2: mux2to1_gen port map (std_logic_vector(v(2 downto 2)), std_logic_vector(u(2 downto 2)), z, m(2 downto 2));
  
  MUX3: mux2to1_gen port map (std_logic_vector(v(3 downto 3)), "0", z, m(3 downto 3));
    
end architecture;
  
  
  
