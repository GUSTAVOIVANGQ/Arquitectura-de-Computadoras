library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ===============================
-- UNIDAD DE CONTROL SIMPLIFICADA
-- ===============================
entity SimpleControlUnit is
    Port (
        opcode   : in  STD_LOGIC_VECTOR(6 downto 0);
        RegWrite : out STD_LOGIC;  -- Habilita escritura en registros
        ALUSrc   : out STD_LOGIC   -- Selecciona fuente ALU (0=reg, 1=inmediato)
    );
end SimpleControlUnit;

architecture Behavioral of SimpleControlUnit is
begin
    process(opcode)
    begin
        -- Valores por defecto
        RegWrite <= '0';
        ALUSrc   <= '0';
        
        case opcode is
            when "0110011" => -- R-type (ADD)
                RegWrite <= '1';
                ALUSrc   <= '0';
            when "0010011" => -- I-type (ADDI)
                RegWrite <= '1';
                ALUSrc   <= '1';
            when others =>
                RegWrite <= '0';
                ALUSrc   <= '0';
        end case;
    end process;
end Behavioral;