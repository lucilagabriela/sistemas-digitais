library ieee;
use ieee.std_logic_1164.all;

entity extensorAL is -- faz a organizacao de operacao que será feita
    port (
        A, B    : in  std_logic_vector(5 downto 0); -- entradas DIP
        x, y, z : in  std_logic;
        IA, IB  : out std_logic_vector(5 downto 0);
        cin     : out std_logic -- calculada no cinext
    );
end entity extensorAL;

architecture struct of extensorAL is
    component abext
        port (
            ai, bi  : in  std_logic;
            x, y, z : in  std_logic;
            ia, ib  : out std_logic
        );
    end component;

    component cinext
        port (
            x, y, z : in  std_logic;
            cin     : out std_logic
        );
    end component;
begin -- seis instancias identicas do abext, um para cada bit ai/bi
    ab0: abext port map(ai=>A(0), bi=>B(0), x=>x, y=>y, z=>z, ia=>IA(0), ib=>IB(0));
    ab1: abext port map(ai=>A(1), bi=>B(1), x=>x, y=>y, z=>z, ia=>IA(1), ib=>IB(1));
    ab2: abext port map(ai=>A(2), bi=>B(2), x=>x, y=>y, z=>z, ia=>IA(2), ib=>IB(2));
    ab3: abext port map(ai=>A(3), bi=>B(3), x=>x, y=>y, z=>z, ia=>IA(3), ib=>IB(3));
    ab4: abext port map(ai=>A(4), bi=>B(4), x=>x, y=>y, z=>z, ia=>IA(4), ib=>IB(4));
    ab5: abext port map(ai=>A(5), bi=>B(5), x=>x, y=>y, z=>z, ia=>IA(5), ib=>IB(5));

    cinx: cinext port map(x=>x, y=>y, z=>z, cin=>cin); -- instancia do cinext, responsavel pelo bit carry-in
end architecture struct;
