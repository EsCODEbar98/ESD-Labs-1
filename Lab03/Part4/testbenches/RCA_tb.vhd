library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCA_tb is
end RCA_tb;

architecture testcase of RCA_tb is
  component RCA is
    port(
      a,b : in unsigned(3 downto 0);
      s : out unsigned(3 downto 0);
      cout : out std_logic
    );
  end component;

  signal a_dut, b_dut, s_dut, s_ref : unsigned (3 downto 0);
  signal cout_dut: std_logic;

  begin
    -- unit under test
    UUT : RCA port map (a_dut, b_dut, s_dut, cout_dut);

    -- test cases (all combinations of two 4 bit wide inputs)
    process begin
      for i in 0 to 3 loop

        a_dut <= to_unsigned(i, a_dut'length);

        for j in 0 to 3 loop
          b_dut <= to_unsigned(j, b_dut'length);
          wait for 0 ns;
          s_ref <= a_dut + b_dut; -- works because they're both unsigned!!
          wait for 15 ns;
        end loop;

      end loop;

    end process;

end architecture;
