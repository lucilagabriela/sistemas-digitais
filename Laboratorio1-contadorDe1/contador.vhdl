-- Contador de bits '1' em três entradas A, B, C
-- Saídas S1 (MSB) e S2 (LSB) em binário

entity contador is
    port(
        A, B, C : in  bit;
        S1, S2  : out bit
    );
end contador;

architecture estrutural of contador is

    -- Sinais intermediários (fios internos)
    signal AB, AC, BC : bit;  -- saídas das AND gates
    signal OR1        : bit;  -- saída da primeira OR (AB or AC)
    signal XOR_AB     : bit;  -- saída da primeira XOR (A xor B)

    -- Declaração dos componentes
    component PortaAnd is
        port(
            en1, en2  : in  bit;
            saida_and : out bit
        );
    end component;

    component PortaOr is
        port(
            input1, input2 : in  bit;
            saida_or       : out bit
        );
    end component;

    component PortaXor is
        port(
            x1, x2    : in  bit;
            saida_xor : out bit
        );
    end component;

begin

    -- ===== Circuito de S1 = A·B + A·C + B·C =====
    U1: PortaAnd port map(en1 => A, en2 => B, saida_and => AB);
    U2: PortaAnd port map(en1 => A, en2 => C, saida_and => AC);
    U3: PortaAnd port map(en1 => B, en2 => C, saida_and => BC);

    U4: PortaOr  port map(input1 => AB, input2 => AC, saida_or => OR1);
    U5: PortaOr  port map(input1 => OR1, input2 => BC, saida_or => S1);

    -- ===== Circuito de S2 = A xor B xor C =====
    U6: PortaXor port map(x1 => A,      x2 => B, saida_xor => XOR_AB);
    U7: PortaXor port map(x1 => XOR_AB, x2 => C, saida_xor => S2);

end architecture estrutural;
