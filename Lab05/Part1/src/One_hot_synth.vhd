library ieee;
use ieee.std_logic_1164.all;


entity One_hot_synth is
--SW1->w,KEY0->clk,SW0->rst,
--LEDR(8 DOWNTO 0)->current_state,
--LEDG0->z
port(
       SW1: in std_logic;
      KEY0: in std_logic;
       SW0: in std_logic;
       LEDR: buffer std_logic_vector (8 DOWNTO 0);
      LEDG0: out std_logic
);
end One_hot_synth;

architecture structure of One_hot_synth is

  component One_hot is
  port(
         w: in std_logic;
         clk: in std_logic;
         rst: in std_logic;
          current_state :buffer std_logic_vector(8 downto 0);
        z: out std_logic
  );
  end component;
  begin

  OHFSM: One_hot port map (SW1,KEY0,SW0,LEDR(8 downto 0),LEDG0);
  end architecture;
