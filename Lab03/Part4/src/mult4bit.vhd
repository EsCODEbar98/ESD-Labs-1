library ieee;
use ieee.std_logic_1164.all;

entity mult4bit is
  port(
     a, b : in std_logic_vector(3 downto 0);
     p : out std_logic_vector (7 downto 0)
  );
end mult4bit;


architecture behaviour of mult4bit is
  component RCA
    port(
      a,b : in std_logic_vector(3 downto 0);
      s : out std_logic_vector(3 downto 0);
      cout : out std_logic
    );
  end component;

  signal AND0, AND1, AND2 : std_logic_vector (3 downto 0); --
  signal B0, B1, B2 : std_logic_vector (3 downto 0); -- intermediate signals between RCAs
  begin

-- intermediate signals
    B0 <= ('0', a(3) and b(0), a(2) and b(0), a(1) and b(0));

-- bitwise AND generating correct dimension range
-- for R values of AND operand
AND0 <= a and (AND0'range => b(1));
AND1 <= a and (AND1'range => b(2));
AND2 <= a and (AND2'range => b(3));

--begin process
--  for i in 0 to 2 loop
--    AND0(i)  <= a(3-i) and b(1);
--    AND1(i)  <= a(3-i) and b(2);
--    AND2(i)  <= a(3-i) and b(3);
--  end loop ;
-- end process;

 -- evaluating outputs
 p(0) <= a(0) and b(0);
 RCA0:  RCA port map (
           a => AND0,
           b => B0,
           cout => B1(3),
           s(3 downto 1) => B1(2 downto 0),
           s(0) => p(1)
       );

 RCA1: RCA port map (
           a => AND1,
           b => B1,
           cout => B2(3),
           s(3 downto 1) => B2(2 downto 0),
           s(0) => p(2)
       );

RCA2: RCA port map (
           a => AND2,
           b => B2,
           cout => p(7), -- last bit = carry out
           s => p(6 downto 3)
       );

end architecture;
