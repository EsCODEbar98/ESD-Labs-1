library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CBA_tb is

end CBA_tb;



architecture struct of CBA_tb is

  component CBA

  port(
  A,B : in signed( 15 downto 0 );
  c_in : in std_logic;
  S : out signed( 15 downto 0 );
  c_out,ovf_det : out std_logic
);
  end component;

  signal A : signed ( 15 downto 0 );
  signal B : signed ( 15 downto 0 );
  signal A_int,B_int : integer;
  signal c_out_dut,ovf_det_dut : std_logic;
  signal S_dut : signed ( 15 downto 0 );
  signal S_ref,S_int_dut : integer;

begin
  process begin
      for i in 2 to 4 loop

        A <= to_signed(63*i, A'length);

        for j in 0 to 2 loop

          B <= to_signed(61*j, B'length);
          wait for 2 ns;

        end loop;

      end loop;

    end process;

A_int <= to_integer(A);
B_int <= to_integer(B);
BCA: CBA port map (A,B,'0',S_dut,c_out_dut,ovf_det_dut);

S_int_dut <= to_integer(S_dut);


  S_ref <= to_integer(A + B) ;






end architecture;
