library ieee;
use ieee.std_logic_1164.all;

entity cinext is
    port (
        x, y, z : in  std_logic;
        cin     : out std_logic
    );
end entity cinext;

architecture dataflow of cinext is
begin
    cin <= (not x) and (y xor z);
end architecture dataflow;
