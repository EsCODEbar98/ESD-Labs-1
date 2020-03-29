library ieee;
use ieee.std_logic_1164.all;

entity decoder_synth is
  port ( SW : in std_logic_vector(2 downto 0);
        HEX0 : out std_logic_vector(0 to 6));
end decoder_synth;

architecture structure of decoder_synth is
  begin
    MUX: entity work.decoder
    port map ( c => SW,
              HEX0 => HEX0
            );
end structure;