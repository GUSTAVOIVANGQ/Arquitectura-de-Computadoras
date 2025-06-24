library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ===============================
-- ALU SIMPLIFICADA (2 BITS)
-- ===============================
entity SimpleALU is
    Port (
        A      : in  STD_LOGIC_VECTOR(1 downto 0);
        B      : in  STD_LOGIC_VECTOR(1 downto 0);
        Result : out STD_LOGIC_VECTOR(1 downto 0);
        Carry  : out STD_LOGIC
    );
end SimpleALU;

architecture Behavioral of SimpleALU is
    signal temp_result : STD_LOGIC_VECTOR(2 downto 0);
begin
    -- Suma simple de 2 bits con acarreo
    temp_result <= std_logic_vector(unsigned('0' & A) + unsigned('0' & B));
    Result <= temp_result(1 downto 0);
    Carry <= temp_result(2);
end Behavioral;