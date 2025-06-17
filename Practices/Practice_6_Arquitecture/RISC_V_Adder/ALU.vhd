library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        a, b : in STD_LOGIC_VECTOR(1 downto 0);
        ALUOp : in STD_LOGIC_VECTOR(1 downto 0);
        result : out STD_LOGIC_VECTOR(1 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(a, b, ALUOp)
    begin
        case ALUOp is
            when "00" => -- Suma
                result <= std_logic_vector(unsigned(a) + unsigned(b));
            when others =>
                result <= (others => '0'); -- Operaciones no implementadas
        end case;
    end process;
end Behavioral;