library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_sec_tb is

end timer_sec_tb;


architecture gate of timer_sec_tb is
  
  constant n1 : integer := 9;
  constant n2 : integer := 1;
  
  component timer_sec
    generic (n1 : integer := n1; n2 : integer := n2);
    port( EN,clk,clr : in std_logic;
        count : buffer integer range 0 to n2;
        count_sec : buffer integer range 0 to n1
      );
  end component;
  
  
  
  signal EN,clk, clr : std_logic;
  signal count : integer range 0 to n2;
  signal count_sec : integer range 0 to n1;
  -- signal Q_ref : unsigned (p-1 downto 0) := (others => '0');
  
  
  
begin 
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ns;
    
    wait for 10 ns;
    
  end process CLK_GEN;
  
  
  
  
  
  
  EN <= '1', '0' after 100 ns, '1' after 111 ns;
  clr <= '0', '1' after 1 ns,'0' after 101 ns;
  
  COUN: timer_sec port map (EN,clk,clr,count,count_sec);    
end architecture;
