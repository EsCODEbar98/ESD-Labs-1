library ieee;
use ieee.std_logic_1164.all;

-- Simple module that connects the SW switches to the LEDR lights

entity light is
 port (SW : in std_logic_vector(17 downto 0);
   LEDR : out std_logic_vector(17 downto 0)); --red LEDs
end light;

architecture behavior of light is
begin
 LEDR <= SW; --LED assignment
end behavior;
