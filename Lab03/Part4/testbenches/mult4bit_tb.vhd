library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult4bit_tb is
end mult4bit_tb;


architecture testcase of mult4bit_tb is
  component mult4bit is
    port(
       a, b : in unsigned(3 downto 0);
       p : out unsigned (7 downto 0)
    );
  end component;

  signal a_dut, b_dut : unsigned(3 downto 0);
  signal p_dut, p_ref : unsigned(7 downto 0);



  begin
    UUT : mult4bit port map (a_dut, b_dut, p_dut);

    -- test cases (all combinations of two 4 bit wide inputs)
    process begin
      for i in 0 to 15 loop

        a_dut <= to_unsigned(i, a_dut'length);

        for j in 0 to 15 loop
          b_dut <= to_unsigned(j, b_dut'length);
          wait for 0 ns;
          p_ref <= a_dut * b_dut; -- works bc they're both unsigned !!
          wait for 5 ns;
        end loop;

      end loop;

    end process;

end architecture;
