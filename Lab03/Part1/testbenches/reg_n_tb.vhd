library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_n_tb is
end reg_n_tb;


architecture Behavior of reg_n_tb is

  component reg_n is
    generic ( N : integer:=3);

    port (R : in signed(N-1 downto 0);
        Clock, Resetn : in std_logic;
        Q : out signed(N-1 downto 0)
        );

  end component;

    signal clk : std_logic;
    signal Rst : std_logic;
    signal input_string : signed(2 downto 0);
    signal out_dut : signed(2 downto 0);


begin

  process begin
    for i in 1 to 10 loop
      clk <= '0';
      wait for 1 ns;
      clk <= '1';
      wait for 1 ns;
    end loop;
  end process;

  Rst <= '1','0' after 13 ns;

  input_string <= "000", "001" after 4 ns,"010" after 8 ns,
                  "011" after 9 ns, "100" after 11 ns;


  REGN: reg_n port map(input_string,clk,Rst,out_dut);

end Behavior;
