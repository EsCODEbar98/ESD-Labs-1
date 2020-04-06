library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_CSA16 is
  generic (n : integer := 16);
  port ( 
    R1,R2 : in signed ( n-1 downto 0 );
    c_in : in std_logic;
    clk,Rst : in std_logic;
    c_out : out std_logic;
    ovf_det : out std_logic;
    S : out signed ( n-1 downto 0 )
  );
end reg_CSA16;


architecture behavior of reg_CSA16 is
  
  component flipflop
    port (
      D, Clock, Resetn : in std_logic;
      Q : out std_logic
    );
  end component;

  component reg_n
    generic ( N : integer:=n);
    port (
      R : in signed(N-1 downto 0);
      Clock, Resetn : in std_logic;
      Q : out signed(N-1 downto 0)
    );
  end component;
  
  component CSA
      port( 
        A,B : in signed( 15 downto 0 );
        c_in : in std_logic;
        S : out signed( 15 downto 0 );
        c_out,ovf_det : out std_logic
      );
  end component;
  
  signal a,b,q : signed(n-1 downto 0);
  signal ovfl : std_logic; 
  
  begin
    
    REG1: reg_n port map (R1, clk, rst, a);
    REG2: reg_n port map (R2, clk, rst, b); 
    carrysel: CSA port map (a, b, c_in, q, c_out, ovfl);
    FF: flipflop port map (ovfl, clk, rst, ovf_det);
    REGS: reg_n port map(q, clk, rst, S); 
  
end behavior;