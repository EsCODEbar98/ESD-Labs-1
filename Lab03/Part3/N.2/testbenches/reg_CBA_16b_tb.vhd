library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_CBA_16b_tb is
end reg_CBA_16b_tb;



architecture struct of reg_CBA_16b_tb is

  component reg_CBA_16b
    generic (n : integer := 16);

    port ( R1,R2 : in signed ( n-1 downto 0 );
         c_in : in std_logic;
         clk,Rst : in std_logic;
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 )
       );

  end component;

  signal A,B : signed ( 15 downto 0 );
  signal A_int,B_int : integer;
  signal c_out_dut,ovf_det_dut,clk,Rst : std_logic;
  signal S_dut : signed ( 15 downto 0 );
  signal S_int_dut,S_ref : integer;


begin

  process begin
    for i in 1 to 10 loop
      clk <= '0';
      wait for 2 ns;
      clk <= '1';
      wait for 2 ns;
    end loop;
  end process;

  Rst <= '1','0' after 27 ns;

  A <= "1011101010111010", "0111011010111010" after 5 ns, "1011101001111101" after 9 ns, "1010100010101000" after 15 ns,
       "1111011101010001" after 21 ns, "0100101010000111" after 25 ns;

  B <= "0001100110011010", "0110011001100110" after 5 ns, "0001110100011101" after 9 ns, "1100011101111000" after 15 ns,
       "1110001110110001" after 21 ns, "1000111011010101" after 25 ns;

  A_int <= to_integer(A);
  B_int <= to_integer(B);


  ADD: reg_CBA_16b port map (A, B, '0', clk, Rst, c_out_dut, ovf_det_dut, S_dut);

  S_int_dut <= to_integer(S_dut);
  S_ref <= to_integer(A + B);

end architecture;
