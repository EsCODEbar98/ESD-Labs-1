library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PID_controller is
  port(
          rst,clk,s : in std_logic;
          ext_data : in signed(7 downto 0);
          done_out : out std_logic;
          memB_out : out signed(7 downto 0);
          memB_CS_ftb: out  std_logic

      );
end entity;

architecture ASM of PID_controller is

  --component multiple_AND
--    generic (N: positive := 13 ); --array size
--    port (
--        bit_vect: in signed(N-1 downto 0);
--        res : out std_logic
--        );
--  end component;
--
--  component multiple_OR
--    generic (N: positive := 13 ); --array size
--    port (
--        bit_vect: in signed(N-1 downto 0);
--        res : out std_logic
--        );
--  end component;


  component counter
    generic (N : integer := 2);
    port(
        en, clk, clear : in std_logic;
        Q : buffer unsigned (N-1 downto 0)
        );
  end component;

  component mux3to1
    generic (n: integer := 20);
    port
        (
          a, b, c: in signed(n-1 downto 0);
          sel    : in unsigned(1 downto 0);
          mux_out: out signed(n-1 downto 0)
        );
    end component;

    component mux5to1
    generic (n: integer := 20);
    port (
            a, b, c, d, e : in signed(n-1 downto 0);
            sel           : in unsigned(2 downto 0);
            mux_out       : out signed(n-1 downto 0)
           );
    end component;

    component memory
    port (
           Clk, CS, WR_RD : in std_logic;
	         ADDRESS_MEM : in unsigned(1 downto 0);
	         DATA_IN : in signed(7 downto 0);
	         DATA_OUT : out signed(7 downto 0)

          );
    end component;

    component reg
    generic (n : integer := 20);
    port (
            clk, rst,en : in std_logic;
            R : in signed(n-1 downto 0);
            Q : out signed(n-1 downto 0)
        );

    end component;

    component adder
    generic (n : integer := 20);
    port(
          A, B :     in signed(n-1 downto 0);
          sub_addn : in std_logic;
          sum :      out signed (n-1 downto 0)
         );
    end component;


  Type state_type is (START,MEMA_W,MEMA_R,ADD1,ADD2,ADD3,ADD4,
                        ADD5,MEMB_W_NEG,MEMB_W_POS,MEMB_W,DONE);


  signal y_Q : state_type; --present state
  signal Y_D : state_type; -- next state

  --control signals
  signal count_en, count_rst, count_tc : std_logic;
  signal count_out : unsigned ( 1 downto 0 );
  signal MEMA_CS, MEMA_R_Wn :  std_logic;
  signal reg_sum_rst, reg_integral_rst,reg_prec_rst, reg_sum_LD,
         reg_integral_LD,reg_prec_LD : std_logic;
  signal mux1_sel : unsigned( 1 downto 0 );
  signal mux2_sel : unsigned( 2 downto 0 );
  signal sub_add, ovf_pos, ovf_neg : std_logic;
  signal mux_memB_sel : unsigned( 1 downto 0 );
  signal memB_CS, memB_R_Wn : std_logic;



  --data signals
  signal data1,data2,data3,data4,data5,data_A_fill : signed (19 downto 0);
  signal data_A : signed (7 downto 0);
  signal reg_prec_out,reg_sum_out,reg_integral_out : signed (19 downto 0);
  signal mux1_out,mux2_out,adder_out :  signed (19 downto 0);
  signal memB_in,reg_sum_out_unfilled : signed (7 downto 0);
  signal nor_in,and_in : signed(12 downto 0);





begin

  ----------------------------------------------
  ----------COMPONENT INSTANTIATION-------------
  ----------------------------------------------

  --counter inst
  COUNT: counter port map(count_en,clk,count_rst,count_out);
  count_tc <= count_out(0) and count_out(1);

  --
  MEMA: memory port map(clk,MEMA_CS,mema_R_Wn,count_out,ext_data,data_A);

  --bit filling
  data_A_fill(19 downto 7) <= (others => data_A(7));
  data_A_fill(6 downto 0) <= data_A(6 downto 0);

  --mux addends entries
  data1 <=data_A_fill(19) & data_A_fill(16 downto 0) & "00";
  data2 <= data_A_fill(19) & data_A_fill(19) & data_A_fill(19) & data_A_fill(18 downto 2);
  data3 <= data_A_fill(19) & data_A_fill(19) & data_A_fill(18 downto 1);
  data4 <= reg_sum_out(19) & reg_sum_out(17 downto 0) & '0';
  data5 <= reg_prec_out(19) & reg_prec_out(19) & reg_prec_out(18 downto 1);

  --regs inst
  REG_PREC: reg port map ( clk, reg_prec_rst,reg_prec_LD, data_A_fill, reg_prec_out);
  REG_INT: reg port map ( clk, reg_integral_rst, reg_integral_LD, adder_out, reg_integral_out);
  REG_SUM: reg port map ( clk, reg_sum_rst, reg_sum_LD, adder_out, reg_sum_out);

  --mux addends inst
  MUX2: mux5to1 port map ( data_A_fill,data1,data2,data3,data5,mux2_sel,mux2_out);
  MUX1: mux3to1 port map ( reg_sum_out,data4,reg_integral_out,mux1_sel,mux1_out);

  ADD: adder port map ( mux1_out,mux2_out,sub_add,adder_out);

  --data on 8 bit
  reg_sum_out_unfilled <= reg_sum_out(19) & reg_sum_out(6 downto 0);

  --mux ovf inst
  MUX_MEMB: mux3to1 generic map(8)
                    port map (to_signed(-128,8), reg_sum_out_unfilled, to_signed(127,8),mux_memB_sel,memB_in);



  
  MEMB: memory port map(clk,MEMB_CS,memb_R_Wn,count_out,memB_in);

  --usefull signals for testbenche
  memB_out <= memB_in when y_Q = MEMB_W_NEG or y_Q = MEMB_W_POS or y_Q = MEMB_W else "ZZZZZZZZ";
   memB_CS_ftb<=memB_CS;


  --OR_MULT: multiple_or port map (reg_sum_out(18 downto 7),);
  --AND_MULT: multiple_and port map (reg_sum_out(19 downto 8),ovf_neg);

  --combinational ovf flags
  ovf_neg <= reg_sum_out(19) and not(reg_sum_out(18) and reg_sum_out(17)
             and reg_sum_out(16) and reg_sum_out(15) and reg_sum_out(14)
             and reg_sum_out(13) and reg_sum_out(12) and reg_sum_out(11)
             and reg_sum_out(10) and reg_sum_out(9) and reg_sum_out(8) and reg_sum_out(7));

  ovf_pos <= (not reg_sum_out(19)) and (reg_sum_out(18) or reg_sum_out(17)
             or reg_sum_out(16) or reg_sum_out(15) or reg_sum_out(14)
             or reg_sum_out(13) or reg_sum_out(12) or reg_sum_out(11)
             or reg_sum_out(10) or reg_sum_out(9) or reg_sum_out(8) or reg_sum_out(7));






  ----------------------------------------------
  ---------------CONTROL FSM--------------------
  ----------------------------------------------

  ---------
  STATE_TRANSITION: process (s,count_tc,ovf_pos,ovf_neg,y_Q)
  begin
    case y_Q is
     when START =>
       if s = '0' then Y_D <= START; else Y_D <= MEMA_W; end if;
      when MEMA_W => if count_tc = '0' then Y_D <= MEMA_W;
                     else Y_D <= MEMA_R; end if;
      when MEMA_R => Y_D <= ADD1;
      when ADD1 =>   Y_D <= ADD2;
      when ADD2 =>   Y_D <= ADD3;
      when ADD3 =>   Y_D <= ADD4;
      when ADD4 =>   Y_D <= ADD5;
      when ADD5 =>  if ovf_neg = '1' then Y_D <= MEMB_W_neg;
                    elsif ovf_pos = '1' then Y_D <= MEMB_W_POS;
                    else Y_D <= MEMB_W; end if;
      when MEMB_W_neg => if count_tc = '0' then Y_D <= MEMA_R;
                         else Y_D <= DONE; end if;
      when MEMB_W_POS => if count_tc = '0' then Y_D <= MEMA_R;
                         else Y_D <= DONE; end if;
      when MEMB_W =>     if count_tc = '0' then Y_D <= MEMA_R;
                         else Y_D <= DONE; end if;
      when DONE =>       if s = '1' then Y_D <= DONE;
                         else Y_D <= START; end if;
      when others =>   Y_D <= START;  --return to rst state
    end case;
  end process;


  ----------
  FFs: process (clk)
  begin
    if Rst = '1' then
        y_Q <= START;
    elsif clk'event and clk = '1' then
        y_Q <= Y_D;
    end if;
  end process;


  -----------
  OUT_DEC: process (y_Q)
  begin
    -- default values
    count_en <= '0';
    count_rst <= '0';
    memA_CS <= '0';
    MEMA_R_Wn <= '0';
    reg_sum_rst <= '0';
    reg_integral_rst <= '0';
    reg_integral_LD <= '0';
    reg_sum_LD <= '0';
    reg_prec_LD <= '0';
    mux1_sel <= "00";
    mux2_sel <= "000";
    sub_add <= '0';
    mux_memB_sel <= "00";
    memB_CS <= '0';
    memB_R_Wn <= '0';
    done_out <= '0';
    reg_prec_rst <= '0';


    case y_Q is
     when START => count_rst <= '1';
                   reg_integral_rst <= '1';
                   reg_prec_rst <= '1';
      when MEMA_W =>  memA_CS <= '1';
                      memA_R_Wn <= '0';
                      count_en <= '1';
      when MEMA_R =>  memA_CS <= '1';
                      memA_R_Wn <= '1';
                      reg_sum_rst <= '1';

      when ADD1 =>    memA_CS <= '1';
                      memA_R_Wn <= '1';
                      mux1_sel <= "10";
                      mux2_sel <= "000";
                      reg_sum_LD <= '1';
                      reg_integral_LD <= '1';
      when ADD2 =>   memA_CS <= '1';
                     memA_R_Wn <= '1';
                     mux1_sel <= "01";
                     mux2_sel <= "001";
                     reg_sum_LD <= '1';
      when ADD3 => memA_CS <= '1';
                   memA_R_Wn <= '1';
                   mux1_sel <= "00";
                   mux2_sel <= "010";
                   reg_sum_LD <= '1';
                   sub_add <= '1';
      when ADD4 => memA_CS <= '1';
                   memA_R_Wn <= '1';
                   mux1_sel <= "00";
                   mux2_sel <= "011";
                   reg_sum_LD <= '1';
      when ADD5 => memA_CS <= '1';
                   memA_R_Wn <= '1';
                   mux1_sel <= "00";
                   mux2_sel <= "100";
                   reg_sum_LD <= '1';
                   sub_add <= '1';
      when MEMB_W_neg => mux_memB_sel <= "00";
                         memB_CS <= '1';
                         memB_R_Wn <=  '0';
                         count_en <= '1';
                         reg_prec_LD <= '1';  ---!!!!!!

      when MEMB_W_POS => mux_memB_sel <= "10";
                         memB_CS <= '1';
                         memB_R_Wn <=  '0';
                         count_en <= '1';
                         reg_prec_LD <= '1';

      when MEMB_W => mux_memB_sel <= "01";
                     memB_CS <= '1';
                     memB_R_Wn <=  '0';
                     count_en <= '1';
                     reg_prec_LD <= '1';

      when DONE => done_out <= '1';

    end case;

  end process;



end architecture;
