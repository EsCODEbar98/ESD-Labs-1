library ieee;
use ieee.std_logic_1164.all;

entity hello_fsm_tb is
end entity;

architecture testing of hello_fsm_tb is
  component hello_fsm is
  port(
    KEY0                    : in std_logic; -- reset
    CLOCK_50                : in std_logic; -- clock
    HEX7, HEX6, HEX5, HEX4,
    HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0)
  );
  end component;

  signal clk    : std_logic := '1';
  signal reset  : std_logic := '0';
  signal H0, H1, H2, H3,
        H4, H5, H6, H7 : std_logic_vector(6 downto 0);

  constant Ts : time := 20 ns;
  signal H0_ref : std_logic_vector (6 downto 0);

  begin
    FSM_M : hello_fsm port map (reset, clk, H7, H6, H5, H4, H3, H2, H1, H0);

    process begin
      clk <= '1';
      wait for Ts/2;
      clk <= '0';
      wait for Ts/2;
    end process;


    process begin
      reset <= '1';
      wait for 25 ns;
      reset <= '0';
    end process;
    -- reset <= '1', '0' after 20 ns, '1'  after 16000 ns, '0' after 16001 ns;

    -- H0_ref <= "1001000", "0110000" after 1 us, "1110001" after 2 us;

end architecture;
