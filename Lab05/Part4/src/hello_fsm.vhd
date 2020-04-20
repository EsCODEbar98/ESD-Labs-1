library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hello_fsm is
  port(
    KEY0                    : in std_logic;  -- reset
    CLOCK_50                : in std_logic; -- clock
    HEX7, HEX6, HEX5, HEX4,
    HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0)
  );
end entity;


architecture behavioral of hello_fsm is

  component reg is
    port(
      clk, rst, en : in std_logic;
      R            : in std_logic_vector(6 downto 0);
      Q            : out std_logic_vector(6 downto 0)
    );
  end component;

  component counter is
    generic (N : integer := 16; UP_TO : integer := 2**16 - 1);
    port(
        en, clk, clear : in std_logic;
        Q : out unsigned (N-1 downto 0)
    );
  end component;

   -- states definition
  type  STATE is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
  signal present_state  : STATE;
  signal next_state     : STATE;
  signal bcd_char     : std_logic_vector ( 0 to 6);

  signal start : std_logic;   -- flag signal to start scrolling loop
  signal load : std_logic_vector( 6 downto 0);

  signal count_clr : std_logic; -- counter clear signals
  signal Q_out : unsigned (25 downto 0); -- counter output signal
  signal reg_en : std_logic; -- register enable;

  -- tmp signals
  signal H0, H1, H2, H3,
         H4, H5, H6, H7 : std_logic_vector (6 downto 0);


  -- constants to improve readability
  constant H     : std_logic_vector(6 downto 0) := "1001000" ;
  constant E     : std_logic_vector(6 downto 0) := "0110000" ;
  constant L     : std_logic_vector(6 downto 0) := "1110001" ;
  constant O     : std_logic_vector(6 downto 0) := "0000001" ;
  constant BLANK : std_logic_vector(6 downto 0) := "1111111" ;
  constant FREQ  : integer := 50; -- decrease for meaningful testbenching

  begin
    -- counter instantiation
    CONT : counter generic map (26, FREQ)
           port map ('1', CLOCK_50, count_clr, Q_out);


    reg_en <= '1' when Q_out = FREQ - 1 else '0';

    -- main
    TRANSIT_PROC : process (present_state, reg_en) begin

      case present_state is
        when S0 => if reg_en = '1' then next_state <= S1;
                   else next_state <= S0;
                   end if;
        when S1 => if reg_en = '1'  then next_state <= S2;
                  else next_state <= S1;
                   end if;
        when S2 => if reg_en = '1'  then next_state <= S3;
                   else next_state <= S2;
                   end if;
        when S3 => if reg_en = '1'  then next_state <= S4;
                   else next_state <= S3;
                   end if;
        when S4 => if reg_en = '1'  then next_state <= S5;
                   else next_state <= S4;
                   end if;
        when S5 => if reg_en = '1'  then next_state <= S6;
                   else next_state <= S5;
                   end if;
        when S6 => if reg_en = '1'  then next_state <= S7;
                   else next_state <= S6;
                   end if;
        when S7 => if reg_en = '1'  then next_state <= S8;
                   else next_state <= S7;
                   end if;
        when S8 => next_state <= S8;     -- indeterminately long loop
        when others => next_state <= S0; -- back to reset state
      end case;
    end process;


      REG_PROC : process (CLOCK_50) begin
        if CLOCK_50'event and CLOCK_50 = '1' then
          if KEY0 = '0' then -- syn reset
            present_state <= S0;
            count_clr <= '0'; -- clearing counter
          else
            present_state <= next_state;
          end if;
        end if;
      end process;


    -- loading correct char in the first reg
    OUT_PROC : process (present_state) begin
      start <= '0'; --bcd_char <= BLANK;
      case present_state is
        when S0 => bcd_char <= H;
        when S1 => bcd_char <= E;
        when S2 => bcd_char <= L;
        when S3 => bcd_char <= L;
        when S4 => bcd_char <= O;
        when S5 => bcd_char <= BLANK;
        when S6 => bcd_char <= BLANK;
        when S7 => bcd_char <= BLANK;
        when S8 => start <= '1';
        when others => bcd_char <= BLANK;
      end case;
    end process;

    load <= bcd_char when (start = '0') else H7;

    -- registers instantiation
    R0 : reg port map (CLOCK_50, KEY0, reg_en, load, H0);
    R1 : reg port map (CLOCK_50, KEY0, reg_en, H0, H1);
    R2 : reg port map (CLOCK_50, KEY0, reg_en, H1, H2);
    R3 : reg port map (CLOCK_50, KEY0, reg_en, H2, H3);
    R4 : reg port map (CLOCK_50, KEY0, reg_en, H3, H4);
    R5 : reg port map (CLOCK_50, KEY0, reg_en, H4, H5);
    R6 : reg port map (CLOCK_50, KEY0, reg_en, H5, H6);
    R7 : reg port map (CLOCK_50, KEY0, reg_en, H6, H7);

    HEX7 <= H7;
    HEX6 <= H6;
    HEX5 <= H5;
    HEX4 <= H4;
    HEX3 <= H3;
    HEX2 <= H2;
    HEX1 <= H1;
    HEX0 <= H0;
end architecture;
