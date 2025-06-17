library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    Port (
        a, b : in STD_LOGIC_VECTOR(1 downto 0);
        sel : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Mux2;

architecture Behavioral of Mux2 is
begin
    output <= a when sel = '0' else b;
end Behavioral;