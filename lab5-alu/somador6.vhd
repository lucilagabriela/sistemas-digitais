library ieee;
use ieee.std_logic_1164.all;

entity somador6 is
    port (
        IA, IB : in  std_logic_vector(5 downto 0); -- vetores de 6 bits
        cin    : in  std_logic; -- 1 bit
        S      : out std_logic_vector(5 downto 0); -- resultado de 6 bits
        cout   : out std_logic -- 1 bit
    );
end entity somador6;

architecture struct of somador6 is
    component fulladder
        port (
            a, b, cin : in  std_logic;
            s, cout   : out std_logic
        );
    end component;

    signal c : std_logic_vector(6 downto 0); -- sinal do carry interno
begin
    c(0) <= cin; -- conectando ci ao primeiro carry
    -- instaciando os 6 somadores completos, um para cada bit
    fa0: fulladder port map(a=>IA(0), b=>IB(0), cin=>c(0), s=>S(0), cout=>c(1));
    fa1: fulladder port map(a=>IA(1), b=>IB(1), cin=>c(1), s=>S(1), cout=>c(2));
    fa2: fulladder port map(a=>IA(2), b=>IB(2), cin=>c(2), s=>S(2), cout=>c(3));
    fa3: fulladder port map(a=>IA(3), b=>IB(3), cin=>c(3), s=>S(3), cout=>c(4));
    fa4: fulladder port map(a=>IA(4), b=>IB(4), cin=>c(4), s=>S(4), cout=>c(5));
    fa5: fulladder port map(a=>IA(5), b=>IB(5), cin=>c(5), s=>S(5), cout=>c(6));

    cout <= c(6); -- carry de saida
end architecture struct;
