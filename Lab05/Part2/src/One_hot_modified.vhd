library ieee;
use ieee.std_logic_1164.all;

entity One_hot_modified is

port(
       w: in std_logic;
       clk: in std_logic;
       rst: in std_logic;
        current_state :buffer std_logic_vector(8 downto 0);
      z: out std_logic
);
  end One_hot_modified;

  architecture behavior of One_hot_modified is

    component flipflop is
      port (
            D, Clock, Reset,Set : in std_logic;
            Q : out std_logic
      );
      end component;
 signal next_state: std_logic_vector(8 downto 0);
      begin


              gen: for i in 0 to 8  generate
              FFs: flipflop port map (next_state(i),clk,Rst,'0', current_state(i));
        end generate;





        next_state(0)<='1';
        next_state(1)<= ( not current_state(0) or current_state(5) or current_state(6)   or current_state(7)   or current_state(8)) and not w;
        next_state(2)<= current_state(1) and not w ;
        next_state(3)<= current_state(2) and not w;
        next_state(4)<= (current_state(3) or current_state(4)) and not w;
        next_state(5)<= (not current_state(0)  or current_state(1)  or current_state(2)  or current_state(3)  or current_state(4) )and  w;
        next_state(6)<= current_state(5) and  w;
        next_state(7)<= current_state(6) and  w;
        next_state(8)<= (current_state(7)  or current_state(8)) and w;
        z<= current_state(8) or current_state(4) ;


end architecture;
