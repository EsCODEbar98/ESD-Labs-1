library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCA_tb is
end RCA_tb;



architecture struct of RCA_tb is

  component RCA
    generic (n : integer := 8);

     port ( A,B : in signed ( n-1 downto 0 );
         c_in : in std_logic; --sub when add_sub == 1
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 )
       );
  end component;

  signal A : signed ( 7 downto 0 );
  signal B : signed ( 7 downto 0 );
  signal A_int,B_int : integer;
  signal c_out_dut,ovf_det_dut : std_logic;
  signal S_dut : signed ( 7 downto 0 );
  signal S_ref,S_int_dut : integer;


begin
  process begin
      for i in 0 to 4 loop

        A <= to_signed(25*i, A'length);

        for j in 0 to 3 loop
          B <= to_signed(25*j, B'length);
          wait for 5 ns;
        end loop;

      end loop;

    end process;

  A_int <= to_integer(A);
  B_int <= to_integer(B);

  ADD: RCA port map (A,B,'0',c_out_dut,ovf_det_dut,S_dut);

  S_int_dut <= to_integer(S_dut);
  S_ref <= to_integer(A + B) ;

end architecture;
