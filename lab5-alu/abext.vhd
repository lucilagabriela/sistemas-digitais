library ieee;
use ieee.std_logic_1164.all;

entity abext is
    port (
        ai, bi  : in  std_logic;
        x, y, z : in  std_logic;
        ia, ib  : out std_logic
    );
end entity abext;

architecture dataflow of abext is
begin
    ia <= (not x and ai) or
          (x and not y and not z and (ai and bi)) or
          (x and not y and z and (ai or bi)) or
          (x and y and not z and (ai xor bi)) or
          (x and y and z and not ai);

    ib <= (not x) and (not y) and (bi xor z); -- uma parte do complemento de dois. bi negado.
end architecture dataflow;
