library ieee;
use ieee.std_logic_1164.all;

-- juntando somador e subtrator
-- controlados pelo sub
-- sub = 0 : soma; sub = 1 : subtrai (complemento de 2: inverte B e ci = 1)
-- possui o inversor, mux e o somador de 6 bits

entity somador_subtrator is
	port(
		a   : in  std_logic_vector(5 downto 0);
		b   : in  std_logic_vector(5 downto 0);
		sub : in  std_logic;
		s   : out std_logic_vector(5 downto 0);
		co  : out std_logic
	);
end entity somador_subtrator;

architecture rtl of somador_subtrator is
	signal b_mux : std_logic_vector(5 downto 0); -- sinal que guarda a saida do mux (invertida ou nao)
begin
	-- MUX 2x1: escolhe entre B (soma) e B invertido (subtracao), conforme sub
	mux_b : entity work.mux2x1_6bits
		port map (
			sel => sub,
			in0 => b,
			in1 => not b,
			y   => b_mux
		);

	-- Somador de 6 bits: soma A com o B escolhido, e cin = sub
	-- (sub=0: soma normal, cin=0 / sub=1: A + B' + 1, ou seja, A - B)
	soma : entity work.somador_6bits
		port map (
			a  => a,
			b  => b_mux,
			ci => sub,
			s  => s,
			co => co
		);
end architecture rtl;
