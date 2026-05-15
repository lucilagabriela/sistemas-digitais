    -- Porta AND de duas entradas
entity PortaAnd is
    port(
        en1, en2  : in  bit;
        saida_and : out bit
    );
end PortaAnd;

architecture behav of PortaAnd is
begin
    saida_and <= en1 and en2;
end architecture behav;
