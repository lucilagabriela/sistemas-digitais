library ieee;
use ieee.std_logic_1164.all;

entity registrador is
	port(
		clk : in std_logic;
		ld : in std_logic;  -- "load" = carregar (ligado ao botão e)
		D : in std_logic_vector(5 downto 0); -- entrada: vem do somador_subtrator
		Q : out std_logic_vector(5 downto 0) -- saída: vai para os LEDs
	);
end entity registrador;

architecture rtl of registrador is
	signal q_int : std_logic_vector(5 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if ld = '1' then
				q_int <= D;
			end if;
		end if;
	end process;

	Q <= q_int;
end architecture;
