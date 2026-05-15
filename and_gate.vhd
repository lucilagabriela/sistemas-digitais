-- Bibliotecas e pacotes
-- Entidade, deve ter o mesmo nome do arquivo
-- Arquitetura (divisoes do codigo vhdl)

entity and_gate is
	port(
		a, b: in bit;
		z: out bit
	);
end entity and_gate; -- ou end and_gate;

architecture behav of and_gate is
begin
	z <= a and b;
end architecture behav;
