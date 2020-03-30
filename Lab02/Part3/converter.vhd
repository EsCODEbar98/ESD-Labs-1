LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


Entity converter is
    port (  v : IN UNSIGNED(3 DOWNTO 0);
            m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC);
end converter;

Architecture struct of converter is
    
   component comparator
    port( v : IN UNSIGNED(3 DOWNTO 0);
          z : OUT STD_LOGIC);
  end component;
  
  component circuit_A
    PORT (v : IN UNSIGNED(2 DOWNTO 0);
          u : OUT UNSIGNED(2 DOWNTO 0));
  end component;
  
  component mux2to1_gen 
    generic ( dw : positive := 1 );
    port( x,y : in std_logic_vector ( dw - 1 downto 0 );	
          s : in std_logic;	
          m : out std_logic_vector ( dw -1 downto 0 ));
  end component;
  
  signal u : UNSIGNED (2 downto 0);
  signal sel : STD_LOGIC;
  
begin
  
  COMP: comparator port map( v,sel );
  z <= sel;
  
  CIRC_A: circuit_A port map( v(2 downto 0), u);
    
  MUX0: mux2to1_gen generic map (1) port map( STD_LOGIC_VECTOR(v(0 downto 0)), STD_LOGIC_VECTOR(u(0 downto 0)), sel,m(0 downto 0));
    
  MUX1: mux2to1_gen generic map (1) port map( STD_LOGIC_VECTOR(v(1 downto 1)), STD_LOGIC_VECTOR(u(1 downto 1)), sel, m(1 downto 1));
  
  MUX2: mux2to1_gen generic map (1) port map( STD_LOGIC_VECTOR(v(2 downto 2)), STD_LOGIC_VECTOR(u(2 downto 2)), sel, m(2 downto 2));
  
  MUX3: mux2to1_gen generic map (1) port map( STD_LOGIC_VECTOR(v(3 downto 3)), "0", sel, m(3 downto 3));
    
end architecture;
  
  
  
