library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flash_digit is
  
  port ( EN, clk, clr : in std_logic;
         Q : buffer unsigned (3 downto 0) ;
         Q_temp : buffer unsigned (25 downto 0)
       );
end flash_digit;


architecture beh of flash_digit is
  
  component counter
    generic (n : integer := 4);
    port ( EN, clk, clr : in std_logic;
           Q : buffer unsigned (n-1 downto 0) 
         );
  end component;
  
  component D_FF
    port( D,clk,clr : in std_logic;
        Q : out std_logic
      );
  end component;
  
  signal EN_temp_in,EN_temp_out,clr_second,clr_princ : std_logic;
  --signal Q_temp : unsigned ( 25 downto 0 );
  
begin
  
  EN_temp_in <= Q_temp(3) and Q_temp(1);
  
  FF: D_FF port map(EN_temp_in,clk,clr,EN_temp_out);
  
  clr_second <= (not EN_temp_out) and clr;
  clr_princ <= not(Q(3) and Q(0)) and clr;
  
  CNT_SEC: counter generic map (26)
                   port map (EN,clk,clr_second,Q_temp);
                    
  CNT_PRINC: counter generic map (4)
                     port map (EN_temp_out,clk,clr_princ,Q);
          
  
     
  
  
  
  
  
end architecture;
