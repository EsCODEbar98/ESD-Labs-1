library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity PID_controller_tb is
end PID_controller_tb;

architecture ASM of PID_controller_tb is
  
  component PID_controller
    port( rst,clk,s : in std_logic;
          ext_data : in signed(7 downto 0);
          done_out : out std_logic;
          memB_out : out signed(7 downto 0);
          memB_add : out unsigned(1 downto 0)
      );
  end component;
  
  signal rst,clk,start,done : std_logic;
  signal ext_data,memB_out : signed ( 7 downto 0);
  signal memB_add : unsigned (1 downto 0);
  
    
begin
  
  CLK_GEN: process
  begin
    
    clk <= '0','1' after 5 ns;
    
    wait for 10 ns;
    
  end process CLK_GEN;
  
  read_file: process

    file file_input : text ;
    variable buf  : line;
    variable input_data : std_logic_vector (7 downto 0);
  begin
    
   file_open(file_input , "external_input.txt",  read_mode);
   
   while not endfile(file_input) loop
     
      wait until falling_edge(clk);
      wait for 10 ns; ----!!!!!!!!
      
      readline(file_input,buf);
      read(buf, input_data);
      ext_data <= signed(input_data);

  end loop;
  

  file_close(file_input);
  
 

end process;
  
  rst <= '1','0' after 1 ns;
  start <= '0', '1' after 7 ns,'0' after 489 ns, '1' after 511 ns;
  
  --ext_data <= "11111100" after 24 ns, "00001000" after 34 ns, "11101100" after 44 ns, "01110100" after 54 ns;
  
  PID: PID_controller port map ( rst,clk,start,ext_data,done,memB_out,memB_add ) ;

  
  
end architecture;
