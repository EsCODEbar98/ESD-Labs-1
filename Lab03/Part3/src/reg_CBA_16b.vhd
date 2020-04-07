library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_CBA_16b is

  

  port ( R1,R2 : in signed ( 15 downto 0 );
         c_in : in std_logic;
         clk,Rst : in std_logic;
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( 15 downto 0 )
       );

end reg_CBA_16b;

architecture struct of reg_CBA_16b is

  component flipflop
    port (D, Clock, Resetn : in std_logic;
          Q : out std_logic
        );
  end component;



  component reg_n

    generic ( N : integer:=16);

    port (R : in signed(N-1 downto 0);
        Clock, Resetn : in std_logic;
        Q : out signed(N-1 downto 0)
        );
  end component;



    component CBA

    port(
          A,B : in signed( 15 downto 0 );
          c_in : in std_logic;
          S : out signed( 15 downto 0 );
          c_out,ovf_det : out std_logic
        );
    end component;

    signal A,B,Q : signed ( 15 downto 0 );
    signal ovf : std_logic;

begin

  REG_A: reg_n port map ( R1,clk,Rst,A);
  REG_B: reg_n port map ( R2,clk,Rst,B);

  ADD: CBA port map ( A,B,c_in,Q ,c_out,ovf);

  FF: flipflop port map ( ovf,clk,Rst,ovf_det );

  REG_S: reg_n port map (Q,clk,Rst,S);

end architecture;
