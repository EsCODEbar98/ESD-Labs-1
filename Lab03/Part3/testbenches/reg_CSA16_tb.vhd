library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_csa16_tb is
end reg_csa16_tb;

architecture test of reg_csa16_tb is
  
  component reg_CSA16 is
  generic (n : integer := 16);
  port ( 
    R1,R2 : in signed ( n-1 downto 0 );
    c_in : in std_logic;
    clk,Rst : in std_logic;
    c_out : out std_logic;
    ovf_det : out std_logic;
    S : out signed ( n-1 downto 0 )
  );
 end component;

  signal A,B : signed ( 15 downto 0 );
  signal A_int,B_int : integer;
  signal cin, c_out_dut,ovf_det_dut,clk,Rst : std_logic;
  signal S_dut : signed ( 15 downto 0 );
  signal s_int_dut, S_ref : integer;
  
  
begin

  process begin
    for i in 1 to 10 loop
      clk <= '0';
      wait for 2 ns;
      clk <= '1';
      wait for 2 ns;
    end loop;
  end process;
  
  rst <= '1', '0' after 5 ns, '1' after 10 ns; 
  
  --input values
  A <= "0000000000000001", "1000000000000001" after 3 ns, "1000000000001111" after 11 ns,
  "0101010101010101" after 15 ns, "0101010101010101" after 21 ns, "0100101010000111" after 25 ns;
      
  B <= "0000000000000101", "1000000000000000" after 3 ns, "1000000000000000" after 11 ns,
  "1010101000101010" after 15 ns,  "0000000000000011" after 21 ns, "1000111011010101" after 25 ns;
  
  cin <= '0', '1' after 5 ns, '1' after 10 ns, '0' after 15 ns, '1' after 20 ns;
  
  DUT: reg_CSA16 port map (A, B, cin, clk, rst, c_out_dut, ovf_det_dut, s_dut);
  
  A_int <= to_integer(A);
  B_int <= to_integer(B);
  
  S_int_dut <= to_integer(S_dut);
  S_ref <= to_integer(A + B);
  
  end test;