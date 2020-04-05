library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CBA_16b is
    generic (n : integer := 16);
  port(
      a,b: in std_logic_vector(n-1 downto 0);
      c_in: in std_logic;
      c_out : out std_logic;
      ovf_det :out std_logic;
      S : out signed ( n-1 downto 0 )
  );
end CBA_16b;

architecture behaviour of CBA_16b is
component CBA is
  port(
      a,b: in std_logic_vector(0 to 3);
      c_in: in std_logic;
      s : out std_logic_vector(0 to 3);
      cout : out std_logic
  );
end component;
  signal c : std_logic_vector (4 downto 0); -- carries
begin
   c(0) <= c_in ; -- first carry-in

--NON VA QUESTA PARTE!!!!!!!
CBAs:  for i in 1 to 4 generate
   CBAi : CBA port map (
   a(i-1)=>a(4*(i-1)),a(i)=>a(4*i-3),a(i+1)=>a(4*i-2),a(i+2)=>a(4*i-1),
   b(i-1)=>b(4*(i-1)),b(i)=>b(4*i-3),b(i+1)=>b(4*i-2),b(i+2)=>b(4*i-1),
   c_in=>c(i-1),
   s(i-1)=>s(4*(i-1)),s(i)=>s(4*i-3),s(i+1)=>s(4*i-2),s(i+2)=>s(4*i-1),
   cout=>c(i));
   end generate;
    c_out <= c(4);
    ovf_det <= c(3) xor c(4);

end architecture;
