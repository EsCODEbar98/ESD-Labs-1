library ieee;
use ieee.std_logic_1164.all;

  entity One_hot_modified_tb is
  end One_hot_modified_tb;

  architecture DUT of One_hot_modified_tb is


   component One_hot_modified is

      port(
      w: in std_logic;
      clk: in std_logic;
      rst: in std_logic;
      current_state :buffer std_logic_vector(8 downto 0);
     z: out std_logic
      );
    end component;

    signal reset,clock,data_test:std_logic;
    signal out_dut: std_logic;
begin


    reset<='1','0' after 4 ns;

    CLK_PR : process begin
    clock <= '0';
    wait for 5 ns;
    clock <= '1';
    wait for 5 ns;
    end process;

--
          data_test<='0',
              '1' after 26 ns,
              '0' after 36 ns,
              '1' after 76 ns,
              '0' after 126 ns;



  DUT: One_hot_modified port map (w=>data_test,clk=>clock,rst=>reset,z=>out_dut);

end architecture;
