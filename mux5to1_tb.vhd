-- USAGE: in the "Objects" scope, select ONLY m_dut and m_ref 
--        in order to compare the expected output and the obtained one!


library ieee;
use ieee.std_logic_1164.all;

-- empty entity section
entity tb_mux5to1 is
end tb_mux5to1;

architecture Behavioral of tb_mux5to1 is

-- testing signals

signal u_dut, v_dut, w_dut, x_dut, y_dut, m_dut : std_logic;
signal sel : std_logic_vector (2 downto 0) ;
signal m_ref: std_logic; -- reference (expected) output 

begin

-- implicit process testcase

sel <= "000",
       "001" after 5 ns, 
       "010" after 10 ns,
       "011" after 15 ns,
       "100" after 20 ns,
       "101" after 25 ns,
       "100" after 30 ns,
       "111" after 35 ns;

-- example input

    u_dut <= '1';
    v_dut <= '0';
    w_dut <= '0';
    x_dut <= '1';
    y_dut <= '1';


-- testing instance
   DUT : entity work.mux5to1 port map (u_dut, v_dut, w_dut, x_dut, y_dut, sel, m_dut);


-- expected output def

with sel select 
     m_ref <= u_dut when "000",
              v_dut when "001",
              w_dut when "010",
              x_dut when "011",
              y_dut when others;

  
end architecture;
