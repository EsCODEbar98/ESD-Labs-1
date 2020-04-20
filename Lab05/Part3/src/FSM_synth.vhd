library ieee;
use ieee.std_logic_1164.all;

entity FSM_synth is
  port ( SW : in std_logic_vector(0 to 1);
         KEY0 : in std_logic;
			LEDR : out std_logic_vector(8 downto 0);
         LEDG0 : out std_logic
       );
 end FSM_synth;
 
 

  
  
  
 architecture gate of FSM_synth is
 
 
  component sequence_inspector
    port ( Rst,clk,w : in std_logic;
         CS : out std_logic_vector ( 8 downto 0);
         z : out std_logic
       );
  end component;
  
  
 begin
 
	FSM: sequence_inspector port map(Rst=>SW(0), clk=>KEY0, w=>SW(1),CS=>LEDR,z=>LEDG0);
	
end architecture;
 
 