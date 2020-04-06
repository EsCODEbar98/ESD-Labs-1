library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CBA is
  port(
        A,B : in signed( 15 downto 0 );
        c_in : in std_logic;
        S : out signed( 15 downto 0 );
        c_out,ovf_det : out std_logic
      );
end CBA;


architecture behaviour of CBA is

  component setup

    port( a,b : in std_logic;
        p,g : out std_logic
      );

  end component;


  component carry_prop

    port( p,g,c_in : in std_logic;
        s,c_out : out std_logic
      );

  end component;

  signal P,G : std_logic_vector ( 15 downto 0 );
  signal carries : std_logic_vector ( 20 downto 0 );
  signal sel : std_logic_vector ( 3 downto 0 );



begin

  carries(0) <= c_in;

  GEN: for i in 0 to 3 generate

    HDHDH: for j in 0 to 3 generate

        SET: setup port map ( A(4*i+j),B(4*i+j),P(4*i+j),G(4*i+j) );
        CA_PROP: carry_prop port map ( P(4*i+j),G(4*i+j),carries(5*i+j),S(4*i +j),carries(5*i+j+1) );

    end generate;

    sel(i) <= P(4*i) and P(4*i+1) and P(4*i+2) and P(4*i+3);
    carries(i*5 + 5) <= carries(i*5+4) when (sel(i) = '0') else carries(i*5);

  end generate;

  c_out <= carries(20);
  ovf_det <= carries(18) xor carries(19);


end architecture;
