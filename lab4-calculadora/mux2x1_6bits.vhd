library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_6bits is
	port(
		sel : in  std_logic; -- seletor
		in0 : in  std_logic_vector(5 downto 0);
		in1 : in  std_logic_vector(5 downto 0);
		y   : out std_logic_vector(5 downto 0)
	);
	-- sel = 0, passa in0
	-- sel = 1, passa in1
end entity mux2x1_6bits;

architecture rtl of mux2x1_6bits is
begin
	y <= in1 when sel = '1' else in0;
end architecture rtl;
