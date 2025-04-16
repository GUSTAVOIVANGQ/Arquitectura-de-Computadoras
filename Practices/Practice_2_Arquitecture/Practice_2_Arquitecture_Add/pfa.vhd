library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pfa is
    Port (
        a    : in  STD_LOGIC;
        b    : in  STD_LOGIC;
        cin  : in  STD_LOGIC;
        s    : out STD_LOGIC;
        p    : out STD_LOGIC;
        g    : out STD_LOGIC
    );
end pfa;

architecture Behavioral of pfa is
begin
    s <= a xor b xor cin;
    p <= a or b;
    g <= a and b;
end Behavioral;