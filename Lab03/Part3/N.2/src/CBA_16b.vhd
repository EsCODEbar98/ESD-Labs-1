library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CBA_16b is
    generic (n : integer := 16);
  port(
      a,b: in signed(n-1 downto 0);
      c_in: in std_logic;
      c_out : out std_logic;
      ovf_det :out std_logic;
      S : out signed ( n-1 downto 0 )
  );
end CBA_16b;

architecture behaviour of CBA_16b is
component CBA is
  port(
  a,b: in signed(3 downto 0);
  c_in: in std_logic;
  s : out  signed(3 downto 0);
  cout : out std_logic
  );
end component;
  signal c : signed (4 downto 0); -- carries
begin
   c(0) <= c_in ; -- first carry-in

CBAs:  for i in 1 to 4 generate
   CBAi : CBA port map (a((4*i-1)downto (4*(i-1))),b((4*i-1)downto (4*(i-1))),c(i-1),s((4*i-1)downto (4*(i-1))),c(i));

   end generate;
    c_out <= c(4);
    ovf_det <= c(3) xor c(4);

end architecture;
