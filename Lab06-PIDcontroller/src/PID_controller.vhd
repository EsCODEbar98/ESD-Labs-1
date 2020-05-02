library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PID_controller is
  port( rst,clk,s : in std_logic;
        done_out : out std_logic
      );
end entity;

architecture ASM of PID_controller is
  
  
  component counter 
    generic (N : integer := 2);
    port(
        en, clk, clear : in std_logic;
        Q : buffer unsigned (N-1 downto 0)
        );
  end component;
  
  
  
  Type state_type is (START,MEMA_W,MEMA_R,ADD1,ADD2,ADD3,ADD4,
                        ADD5,MEMB_W_NEG,MEMB_W_POS,MEMB_W,DONE);
                        
  
  signal y_Q,Y_D : state_type; --y_Q is present state, Y_D is next state
  
  signal count_en,count_rst,count_tc : std_logic;
  signal count_out : unsigned ( 1 downto 0 );
  signal MEMA_CS,MEMA_R_Wn :  std_logic;
  signal reg_sum_rst,reg_integral_rst,reg_sum_LD,reg_integral_LD,MEMA_prec_LD : std_logic;
  signal mux1_sel : std_logic_vector( 1 downto 0 );
  signal mux2_sel : std_logic_vector( 2 downto 0 );
  signal sub_add : std_logic;
  signal to_pos,to_neg : std_logic;
  signal mux_memB_sel : std_logic_vector( 1 downto 0 );
  signal memB_CS,memB_R_Wn : std_logic; 
  
    
begin
  
  COUNT: counter port map(count_en,clk,count_rst,count_out);
  
  count_tc <= count_out(0) and count_out(1);

  STATE_TRANSITION: process (s,count_tc,to_pos,to_neg,y_Q)
    
  begin
    
    case y_Q is
     when START =>
       if s = '0' then Y_D <= START; else Y_D <= MEMA_W; end if;
      when MEMA_W =>
       if count_tc = '0' then Y_D <= MEMA_W; else Y_D <= MEMA_R; end if;
      when MEMA_R =>
       Y_D <= ADD1;
      when ADD1 =>
       Y_D <= ADD2;
      when ADD2 =>
       Y_D <= ADD3;
      when ADD3 =>
       Y_D <= ADD4;
      when ADD4 =>
       Y_D <= ADD5;
      when ADD5 =>
        if to_neg = '1' then
          Y_D <= MEMB_W_neg;
        else
          if to_pos = '1' then
            Y_D <= MEMB_W_POS;
          else
            Y_D <= MEMB_W;
          end if;
        end if;
      when MEMB_W_neg =>
        if count_tc = '0' then Y_D <= MEMA_R; else Y_D <= DONE; end if;
      when MEMB_W_POS =>
        if count_tc = '0' then Y_D <= MEMA_R; else Y_D <= DONE; end if;
      when MEMB_W =>
        if count_tc = '0' then Y_D <= MEMA_R; else Y_D <= DONE; end if;
      when DONE =>
        if s = '1' then Y_D <= DONE; else Y_D <= START; end if;
      --when others => 
        --Y_D <= A;  --return on reset if unknown states
    end case;
    
  end process;
  
  
  
  FFs: process (clk)
  
  begin
    
    if Rst = '1' then
        y_Q <= START;
    
    elsif clk'event and clk = '1' then
        y_Q <= Y_D;
        
    end if;
    
  end process;
  
  
  
  OUT_DEC: process (y_Q)
  
  begin
  
    count_en <= '0';
    count_rst <= '0';
    count_tc <= '0';
    memA_CS <= '0';
    MEMA_R_Wn <= '0';
    reg_sum_rst <= '0';
    reg_integral_rst <= '0';
    reg_integral_LD <= '0';
    reg_sum_LD <= '0';
    memA_prec_LD <= '0';
    mux1_sel <= "00";
    mux2_sel <= "000";
    sub_add <= '0';
    mux_memB_sel <= "00";
    memB_CS <= '0';
    memB_R_Wn <= '0';
    
    
    case y_Q is
     when START =>
       count_rst <= '1'; 
       reg_integral_rst <= '1';
      when MEMA_W =>
       memA_CS <= '1';
       memA_R_Wn <= '0';
       count_en <= '1';
      when MEMA_R =>
       memA_CS <= '1';
       memA_R_Wn <= '1';
       reg_sum_rst <= '1';
      when ADD1 =>
       memA_CS <= '1';
       memA_R_Wn <= '1';
       mux1_sel <= "10";
       mux2_sel <= "000";
       reg_sum_LD <= '1';
       reg_integral_LD <= '1';
      when ADD2 =>
       memA_CS <= '1';
       memA_R_Wn <= '1';
       mux1_sel <= "01";
       mux2_sel <= "001";
       reg_sum_LD <= '1';
      when ADD3 =>
       memA_CS <= '1';
       memA_R_Wn <= '1';
       mux1_sel <= "00";
       mux2_sel <= "010";
       reg_sum_LD <= '1';
       sub_add <= '1';
      when ADD4 =>
       memA_CS <= '1';
       memA_R_Wn <= '1';
       mux1_sel <= "00";
       mux2_sel <= "011";
       reg_sum_LD <= '1';
      when ADD5 =>
        memA_CS <= '1';
       memA_R_Wn <= '1';
       mux1_sel <= "00";
       mux2_sel <= "100";
       reg_sum_LD <= '1';
       sub_add <= '1';
      when MEMB_W_neg =>
        mux_memB_sel <= "00";
        memB_CS <= '1';
        memB_R_Wn <=  '0';
        count_en <= '1';
      when MEMB_W_POS =>
        mux_memB_sel <= "10";
        memB_CS <= '1';
        memB_R_Wn <=  '0';
        count_en <= '1';
      when MEMB_W =>
        mux_memB_sel <= "01";
        memB_CS <= '1';
        memB_R_Wn <=  '0';
        count_en <= '1';
      when DONE =>
        done_out <= '0';
    end case;
    
    
    
  end process;
  
  
end architecture;
    
    
    
    
  
      
  
