library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCA_tb is
end RCA_tb;

architecture testcase of RCA_tb is
  component RCA is
    port(
      a,b : in std_logic_vector(3 downto 0);
      s : out std_logic_vector(3 downto 0);
      cout : out std_logic
    );
  end component;

  signal a_dut, b_dut, s_dut, s_ref : std_logic_vector (3 downto 0);
  signal cout_dut: std_logic;

  begin
    -- unit under test
    UUT : RCA port map (a_dut, b_dut, s_dut, cout_dut);

    -- test cases (all combinations of two 4 bit wide inputs)
    process begin
      for i in 0 to 15 loop

        a_dut <= std_logic_vector(to_unsigned(i, a_dut'length));

        for j in 0 to 15 loop
          b_dut <= std_logic_vector(to_unsigned(j, b_dut'length));
          s_ref <= std_logic_vector(unsigned(a_dut) + unsigned(b_dut));
          wait for 5 ns;
        end loop;

      end loop;

    end process;

end architecture;
