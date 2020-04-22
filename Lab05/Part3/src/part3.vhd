library ieee;
use ieee.std_logic_1164.all;

entity part3 is
  port ( Rst,clk,w : in std_logic;
         CS : out std_logic_vector ( 8 downto 0);
         z : out std_logic
       );
 end part3;


architecture beh of part3 is
  
  Type state_type is (A,B,C,D,E,F,G,H,I);
  signal y_Q,Y_D : state_type; --y_Q is present state, Y_D is next state
  
  
begin

  STATE_TRANSITION: process (w,y_Q)
    
  begin
    
    case y_Q is
     when A =>
       if w = '0' then Y_D <= B; else Y_D <= F; end if;
      when B =>
       if w = '0' then Y_D <= C; else Y_D <= F; end if;
      when C =>
       if w = '0' then Y_D <= D; else Y_D <= F; end if;
      when D =>
       if w = '0' then Y_D <= E; else Y_D <= F; end if;
      when E =>
       if w = '0' then Y_D <= E; else Y_D <= F; end if;
      when F =>
       if w = '0' then Y_D <= B; else Y_D <= G; end if;
      when G =>
       if w = '0' then Y_D <= B; else Y_D <= H; end if;
      when H =>
       if w = '0' then Y_D <= B; else Y_D <= I; end if;
      when I =>
       if w = '0' then Y_D <= B; else Y_D <= I; end if;
      when others => 
        Y_D <= A;  --return on reset if unknown states
    end case;
    
  end process;
  
  
  FFs: process (Rst,clk)
  
  begin
  
    if Rst = '1' then
      y_Q <= A;
    elsif clk'event and clk = '1' then
      y_Q <= Y_D;
    end if;
    
  end process;
  
  OUT_DEC: process (y_Q)
  
  begin
  
    z <= '0';
    if (y_Q = E or y_Q = I) then
      z <= '1';
    end if;
    
  end process;
  
  --CS out assignment
  with y_Q select 
     CS <= 
      "000000001" when A,
      "000000010" when B,
      "000000100" when C,
      "000001000" when D,
      "000010000" when E,
      "000100000" when F,
      "001000000" when G,
      "010000000" when H,
      "100000000" when I,
      "000000000" when others;
  
  
end architecture;
      
    