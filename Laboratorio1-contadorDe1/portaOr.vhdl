-- Porta OR de duas entradas
entity PortaOr is
    port(
        input1, input2 : in  bit;
        saida_or       : out bit
    );
end PortaOr;

architecture behav of PortaOr is
begin
    saida_or <= input1 or input2;
end architecture behav;
