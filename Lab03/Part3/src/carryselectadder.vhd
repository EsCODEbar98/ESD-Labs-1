library ieee;
use ieee.std_logic_1164.all;

entity carryselectadder is
  port ( 
    a, b: in std_logic_vector(3 downto 0);
    c_in: in std_logic;
    s : out std_logic_vector(3 downto 0);
    c_out, ovf : out std_logic
  );
end carryselectadder;

architecture behavior of carryselectadder is
  
  component RCA
    port(
     a,b : in std_logic_vector(3 downto 0);
     c_in : in std_logic;
     s : out std_logic_vector(3 downto 0);
     cout, ovf : out std_logic
    );
  end component;
  
  component mux2to1_gen 
    generic ( dw : positive := 1 );    
    port ( 
       x,y : in std_logic_vector ( dw - 1 downto 0 );	
       s : in std_logic;	
       m : out std_logic_vector ( dw -1 downto 0 )
    );
  end component;
  
  signal sum0, sum1 : std_logic_vector(3 downto 0);
  signal c_out0, c_out1, ovf0, ovf1 : std_logic;
  
begin
  
  RCA0: RCA port map(a, b, '0', sum0, c_out0, ovf0);
  RCA1: RCA port map(a, b, '1', sum1, c_out1, ovf1);
    
  MUX_OUT: mux2to1_gen generic map (1)
                       port map (x(0) => c_out0, y(0) => c_out1, s => c_in, m(0) => c_out);
    
  MUXs: for i in 0 to 3 generate
    MUXi: mux2to1_gen generic map (1) 
                      port map (x(0) => sum0(i), y(0) => sum1(i), s => c_in, m(0) => s(i));
    
  --ovf
  ovf <= ovf1 when c_in = '1' else
         ovf0; 
  
  end generate;
  
end behavior;