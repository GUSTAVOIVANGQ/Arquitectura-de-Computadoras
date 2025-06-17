library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtend is
    Port (
        immediate : in STD_LOGIC_VECTOR(1 downto 0);
        extended : out STD_LOGIC_VECTOR(1 downto 0)
    );
end SignExtend;

architecture Behavioral of SignExtend is
begin
    -- Para 2 bits, simplemente pasamos el valor sin extender
    extended <= immediate;
end Behavioral;