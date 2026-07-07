library ieee;
use ieee.std_logic_1164.all;

entity lab4_calculadora6bits is
	port(
		a   : in  std_logic_vector(5 downto 0);
		b   : in  std_logic_vector(5 downto 0);
		sub : in  std_logic;  -- define soma ou subtracao
		ld  : in  std_logic;  -- botao "="
		clk : in  std_logic;  -- clock
		s   : out std_logic_vector(5 downto 0)
	);
end entity lab4_calculadora6bits;

architecture rtl of lab4_calculadora6bits is
	signal soma_int : std_logic_vector(5 downto 0); -- resultado do somador/subtrator
	signal co_int   : std_logic;                    -- carry final (nao usado na saida, mas precisa ser conectado)
begin

	-- Somador/Subtrator: calcula A+B ou A-B, dependendo de sub
	calc : entity work.somador_subtrator
		port map (
			a   => a,
			b   => b,
			sub => sub,
			s   => soma_int,
			co  => co_int
		);

	-- Registrador: so atualiza a saida quando ld = '1' (botao "e" apertado)
	reg : entity work.registrador
		port map (
			clk => clk,
			ld  => ld,
			D   => soma_int,
			Q   => s
		);

end architecture rtl;
