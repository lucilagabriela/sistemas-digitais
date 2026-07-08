library ieee;
use ieee.std_logic_1164.all;

entity somador_6bits is
	port(
		a : in std_logic_vector(5 downto 0); -- vetor de 6 bits
		b : in std_logic_vector(5 downto 0); -- resultado de 6 bits
		ci : in std_logic; -- 1 bit
		s : out std_logic_vector(5 downto 0); -- resultado de 6 bits
		co : out std_logic -- 1 bit
	);
end entity somador_6bits;

architecture rtl of somador_6bits is
	signal carry : std_logic_vector(6 downto 0);
	-- vetor do sinal de carry
	-- carry [0] entra no bit 0
	-- carry [1] sai do bit 0 e entra no bit 1
begin
	carry(0) <= ci; -- conectando ci ao primeiro carry
	
	-- instaciando os 6 somadores completos, um para cada bit
	bit0 : entity work.somador_completo
		port map (
			a  => a(0),
			b  => b(0),
			ci => carry(0),
			s  => s(0),
			co => carry(1)
		);

	bit1 : entity work.somador_completo
		port map (
			a  => a(1),
			b  => b(1),
			ci => carry(1),
			s  => s(1),
			co => carry(2)
		);
		
	bit2 : entity work.somador_completo
		port map (
			a  => a(2),
			b  => b(2),
			ci => carry(2),
			s  => s(2),
			co => carry(3)
		);

	bit3 : entity work.somador_completo
		port map (
			a  => a(3),
			b  => b(3),
			ci => carry(3),
			s  => s(3),
			co => carry(4)
		);
		
	bit4 : entity work.somador_completo
		port map (
			a  => a(4),
			b  => b(4),
			ci => carry(4),
			s  => s(4),
			co => carry(5)
		);

	bit5 : entity work.somador_completo
		port map (
			a  => a(5),
			b  => b(5),
			ci => carry(5),
			s  => s(5),
			co => carry(6)
		);
	
	co <= carry(6); -- conectando o carry final na saida co
end architecture rtl;
