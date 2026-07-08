library ieee;
use ieee.std_logic_1164.all;

entity registrador6 is
    port (
        D       : in  std_logic_vector(5 downto 0); -- entrada de 6 bits que o registrador deve guardar
        ld, clk : in  std_logic; -- ld: pino e que carrega o resultado
        Q       : out std_logic_vector(5 downto 0) -- saída de 6 bits que irá alimentar os LEDS
    );
end entity registrador6;

architecture behavioral of registrador6 is
begin
    process(clk) -- sensível ao clock
    begin
        if rising_edge(clk) then -- detectando a borda de subida
            if ld = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end architecture behavioral;
