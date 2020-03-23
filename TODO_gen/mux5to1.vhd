library ieee;
use ieee.std_logic_1164.all;

entity mux5to1 is
generic ( dw : positive := 3);
port (
       u,v,w,x,y : in std_logic_vector (dw - 1 downto 0);
       s : in std_logic_vector (2 downto 0);
       m : out std_logic_vector (dw -1 downto 0)
      );
end mux5to1;


architecture mux_structure of mux5to1 is
signal m_uv,m_wx,m_uv_wx : std_logic_vector(dw - 1 downto 0); 

begin
   MUX1 : entity work.mux2to1_gen 
          generic map(dw)
          port map (u, v, s(0), m_uv);
   MUX2 : entity work.mux2to1_gen 
          generic map(dw)
          port map (w, x, s(0), m_wx);
   MUX3 : entity work.mux2to1_gen 
          generic map(dw)
          port map (m_uv, m_wx, s(1), m_uv_wx);
   MUX4 : entity work.mux2to1_gen 
          generic map(dw)
          port map (m_uv_wx, y, s(2), m);  
end mux_structure;
