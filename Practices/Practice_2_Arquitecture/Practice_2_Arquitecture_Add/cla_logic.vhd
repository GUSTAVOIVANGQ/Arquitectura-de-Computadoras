library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla_logic is
    Port (
        p    : in  STD_LOGIC_VECTOR(3 downto 0);
        g    : in  STD_LOGIC_VECTOR(3 downto 0);
        cin  : in  STD_LOGIC;
        c    : buffer STD_LOGIC_VECTOR(3 downto 0);
        cout : out STD_LOGIC
    );
end cla_logic;

architecture Behavioral of cla_logic is
begin
    c(0) <= g(0) or (p(0) and cin);
    c(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
    c(2) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
    c(3) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or 
            (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);
    cout <= c(3);
end Behavioral;