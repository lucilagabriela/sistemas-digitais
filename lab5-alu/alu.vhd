library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (
        A, B    : in  std_logic_vector(5 downto 0);
        x, y, z : in  std_logic;
        S       : out std_logic_vector(5 downto 0);
        cout    : out std_logic
    );
end entity alu;

architecture struct of alu is
    component extensorAL
        port (
            A, B    : in  std_logic_vector(5 downto 0);
            x, y, z : in  std_logic;
            IA, IB  : out std_logic_vector(5 downto 0);
            cin     : out std_logic
        );
    end component;

    component somador6
        port (
            IA, IB : in  std_logic_vector(5 downto 0);
            cin    : in  std_logic;
            S      : out std_logic_vector(5 downto 0);
            cout   : out std_logic
        );
    end component;

    signal IA_sig, IB_sig : std_logic_vector(5 downto 0);
    signal cin_sig        : std_logic;
begin
    ext: extensorAL port map(A=>A, B=>B, x=>x, y=>y, z=>z, IA=>IA_sig, IB=>IB_sig, cin=>cin_sig);
    som: somador6    port map(IA=>IA_sig, IB=>IB_sig, cin=>cin_sig, S=>S, cout=>cout);
end architecture struct;
