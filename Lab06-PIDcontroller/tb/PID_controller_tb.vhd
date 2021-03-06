library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity PID_controller_tb is
end PID_controller_tb;

architecture ASM of PID_controller_tb is

  component PID_controller
   port(
           rst,clk,s : in std_logic;
           ext_data : in signed(7 downto 0);
           done_out : out std_logic;
           memB_out : out signed(7 downto 0);
           memB_CS_ftb: out  std_logic
    );
  end component;
  constant T_clk : time :=  10 ns;
  signal rst,clk,start,done,memB_CS: std_logic;
  signal ext_data,memB_out : signed ( 7 downto 0);


begin

  rst <= '1','0' after 1 ns;
  start <= '0', '1' after 7 ns,'0' after 17 ns;

  CLK_GEN: process
  begin
    clk <= '0','1' after 5 ns;

    wait for T_clk;

  end process CLK_GEN;

  PID: PID_controller port map (rst,clk,start,ext_data,done,memB_out,memB_CS) ;

  read_file: process

  file file_input : text ;
  variable buf  : line;
  variable input_data : std_logic_vector (7 downto 0);
  begin

      file_open(file_input , "input.txt",  read_mode);
      if(start = '1') then
        wait for T_clk;
        while not endfile(file_input) loop

            readline(file_input,buf);
            read(buf, input_data);
            ext_data <= signed(input_data);

          wait for T_clk;

        end loop;
      else
        ext_data <= "ZZZZZZZZ";
        wait for T_clk;

      end if;

      file_close(file_input);

    end process;


  write_file: process
   file file_output:text;
   variable fstatus : File_open_status;
   variable buf: line; -- buffer to file
  begin

    file_open(fstatus, file_output, "output.txt",write_mode); -- open the file for writing

        wait until rising_edge(clk) and memB_CS = '1';
        write(buf,integer'image(to_integer(memB_out)));
        writeline(file_output, buf);

  if (done ='1') then
    file_close(file_output); -- flush the buffer to the file
  end if;
    end process;

end architecture;
