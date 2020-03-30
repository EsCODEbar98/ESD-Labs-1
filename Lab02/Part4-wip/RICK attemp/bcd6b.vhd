library ieee;
use ieee.std_logic_1164.all;

entity bcd6b is
generic ( dw : positive := 5 );  -- data width
  port ( b : in std_logic_vector (5 downto 0);--stringa a 6 bit di ingresso
        dec_out:out std_logic_vector (0 to 6); --output decine
        un_out: out std_logic_vector (0 to 6) --output unità
        );

end bcd6b;


architecture behavior of bcd6b is
--Instanziazzione LUT
component LUT is
port (x :in std_logic_vector(3 downto 0);
      u: out std_logic_vector (3 downto 0));
      end component;
signal uscita : std_logic_vector(3 downto 0); --out temporanea su cui vengono salvati i risultati della LUT
--Instanziazzione del codificatore display
    component bin_to_dec_decoder is
    port (
         m : in std_logic_vector (3 downto 0);
         HEX0 : out std_logic_vector (0 to 6 )
    );
    end component;
signal   dec : std_logic_vector (7 downto 0);--out temporaneo in cui vengono salvati gli 8 bit risultanti dalle operazioni
begin
--assegnazione cifre che non vengono modificate dal loop qualsiasi cosa succeda
dec(dw+2)<='0';
dec(0) <= b(0);
--Loop per fare lo shift degli elementi da analizzare

First_operation :  LUT port  map (x(3) => '0',x(2) => b(dw),x(1) => b(dw-1),x(0) => b(dw-2),u=> uscita);
--asegnazione MSB 
dec(dw+1)<=uscita(3);

a: for i in 1 to 2 generate
operation :  LUT port  map (x(3) => b(dw-i),x(2) => b(dw-i-1),x(1) => b(dw-i-2),x(0) => b(dw-i-3),u=> uscita);
--asegnazione MSB 
dec(dw+1-i)<=uscita(3);
end generate;
--computazione del display delle decine
display1: bin_to_dec_decoder  port  map (m(3)=>dec(dw+2),m(2)=>dec(dw+1),m(1)=>dec(dw),m(0)=>dec(dw-1),HEX0=>dec_out);
  --computazione del display delle unità
display2: bin_to_dec_decoder  port  map (m(3)=>dec(dw-2),m(2)=>dec(dw-3),m(1)=>dec(dw-4),m(0)=>dec(0),HEX0=>un_out);


end behavior;
