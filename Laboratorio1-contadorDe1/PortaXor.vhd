-- Porta XOR de duas entradas
entity PortaXor is
    port(
        x1, x2    : in  bit;
        saida_xor : out bit
    );
end PortaXor;

architecture behav of PortaXor is
begin
    saida_xor <= x1 xor x2;
end architecture behav;
