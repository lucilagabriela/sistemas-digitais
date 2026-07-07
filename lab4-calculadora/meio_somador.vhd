library ieee;
use ieee.std_logic_1164.all;

entity meio_somador is
	port (
		a : in std_logic;
		b : in std_logic;
		co: out std_logic;
		s: out std_logic
	);
end entity meio_somador;

architecture rtl of meio_somador is
begin
	co <= a and b;
	s <= a xor b;
end architecture rtl;
