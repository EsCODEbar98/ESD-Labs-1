LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


Entity converter is
    port (  v : IN UNSIGNED(3 DOWNTO 0);
            m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC);
end converter;

Architecture struct of converter is
  
  signal u : UNSIGNED (2 downto 0);
  signal sel : STD_LOGIC;
  
begin
  
  COMPARATOR: entity work.comparator port map( v,sel );
  z <= sel;
  
  CIRCUIT_A: entity work.circuit_A port map( v(2 downto 0), u);
    
  MUX0: entity work.mux2to1_gen port map( STD_LOGIC_VECTOR(v(0 downto 0)), STD_LOGIC_VECTOR(u(0 downto 0)), sel,m(0 downto 0));
    
  MUX1: entity work.mux2to1_gen port map( STD_LOGIC_VECTOR(v(1 downto 1)), STD_LOGIC_VECTOR(u(1 downto 1)), sel, m(1 downto 1));
  
  MUX2: entity work.mux2to1_gen port map( STD_LOGIC_VECTOR(v(2 downto 2)), STD_LOGIC_VECTOR(u(2 downto 2)), sel, m(2 downto 2));
  
  MUX3: entity work.mux2to1_gen port map( STD_LOGIC_VECTOR(v(3 downto 3)), "0", sel, m(3 downto 3));
    
end architecture;
  
  
  
