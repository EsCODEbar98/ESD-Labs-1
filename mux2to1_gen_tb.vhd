library ieee;
use ieee.std_logic_1164.all;

--Tb per un multiplexer 2to1 con parallelismo generico
--Di default lavora con mux ad un bit, ma basya cambiare il parametro p e l'assegnazione dei valori
--ai segnali di ingresso e funziona per qualsiasi parallelismo

entity mux2to1_gen_tb is
generic ( p : POSITIVE := 1);
end mux2to1_gen_tb;

architecture test of mux2to1_gen_tb is
  
  ---- segnali test
  signal in1 : STD_LOGIC_VECTOR ( (p-1)  downto 0);
  signal in2 : STD_LOGIC_VECTOR ( (p-1) downto 0);
  signal sel : STD_LOGIC;
  signal m_dut, m_ref : STD_LOGIC_VECTOR ((p-1) downto 0);
  

  --utilizzo un mux2to1 generico come component da testare
  component mux2to1_gen
  generic (p : POSITIVE := p);
  port ( 
       x,y : in STD_LOGIC_VECTOR( (p-1) downto 0 );	
       s : in STD_LOGIC;	
       m : out STD_LOGIC_VECTOR( (p-1) downto 0 )
      );
  end component;
begin
  
  --assegnamento valori arbitrari agli ingressi
  in1 <= "0";
  in2 <= "1";

 
  sel <= '0', '1' after 5 ns;
  dut: mux2to1_gen port map( x => in1, y => in2, s => sel, m => m_dut);
    
    
  with sel select
  m_ref <=
    in2 when '1',
    in1 when others;
  
  
end test;
