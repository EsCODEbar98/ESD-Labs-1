library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_8b_tb is
     
end adder_8b_tb;



architecture struct of adder_8b_tb is
  
  component adder_8b
    
    generic (n : integer := 8);
     
     port ( A,B : in signed ( n-1 downto 0 );
         add_sub : in std_logic; --sub when add_sub == 1
         c_out : out std_logic;
         ovf_det : out std_logic;
         S : out signed ( n-1 downto 0 ) 
       );
  end component;
  
  signal A : signed ( 7 downto 0 );
  signal B : signed ( 7 downto 0 );
  signal A_int,B_int : integer;
  signal add_sub : std_logic;
  signal c_out_dut,ovf_det_dut : std_logic;
  signal S_dut : signed ( 7 downto 0 );
  signal S_ref,S_int_dut : integer;
  

  
begin
  
  add_sub <= '0', '1' after 16 ns;
  
  process begin
      for i in 2 to 4 loop

        A <= to_signed(63*i, A'length);

        for j in 0 to 2 loop
          
          B <= to_signed(61*j, B'length);
          wait for 2 ns;
          
        end loop;

      end loop;

    end process;    A_int <= to_integer(A);
  B_int <= to_integer(B);
  
  ADD: adder_8b port map (A,B,add_sub,c_out_dut,ovf_det_dut,S_dut);
    
  S_int_dut <= to_integer(S_dut);
  
  with add_sub select
    S_ref <=  
      to_integer(A + B) when '0',
      to_integer(A - B) when others;
  
 
  
  
  
end architecture;
