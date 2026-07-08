library ieee;
use ieee.std_logic_1164.all;

entity calc is
    port (
        A, B    : in  std_logic_vector(5 downto 0); -- chaves DIP de A e B
        x, y, z : in  std_logic;                    -- chave DIP tripla
        e, clk  : in  std_logic;                     -- botao "igual" e clock
        LED     : out std_logic_vector(5 downto 0)
    );
end entity calc;

architecture struct of calc is
    component alu
        port (
            A, B    : in  std_logic_vector(5 downto 0);
            x, y, z : in  std_logic;
            S       : out std_logic_vector(5 downto 0);
            cout    : out std_logic
        );
    end component;

    component registrador6
        port (
            D       : in  std_logic_vector(5 downto 0);
            ld, clk : in  std_logic;
            Q       : out std_logic_vector(5 downto 0)
        );
    end component;

    signal S_sig    : std_logic_vector(5 downto 0);
    signal cout_sig : std_logic;
    signal e_n : std_logic; -- adicionado para corrigir o sinal de e
begin
    e_n <= not e; -- adicionado para corrigir o sinal de e
    unidade_alu: alu port map(A => A, B => B, x => x, y => y, z => z, S => S_sig, cout => cout_sig);
    reg:         registrador6 port map(D => S_sig, ld => e_n, clk => clk, Q => LED);
end architecture struct;
