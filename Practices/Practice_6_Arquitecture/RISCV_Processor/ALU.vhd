-- ===============================
-- ALU (Unidad Aritmético-Lógica) - VERSIÓN MEJORADA
-- Descripción: Realiza operaciones aritméticas y lógicas entre dos operandos de 32 bits.
-- Implementa suma, resta, y operaciones lógicas necesarias para RISC-V.
-- Incluye soporte para cálculo de direcciones en load/store y comparaciones para branch.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A        : in  STD_LOGIC_VECTOR(31 downto 0); -- Primer operando (generalmente rs1)
        B        : in  STD_LOGIC_VECTOR(31 downto 0); -- Segundo operando (rs2 o inmediato)
        ALUCtrl  : in  STD_LOGIC_VECTOR(3 downto 0);  -- Código de control de operación
        Result   : out STD_LOGIC_VECTOR(31 downto 0); -- Resultado de la operación
        Zero     : out STD_LOGIC  -- Bandera: '1' si el resultado es cero
    );
end ALU;

architecture Behavioral of ALU is
    signal alu_result : STD_LOGIC_VECTOR(31 downto 0);
begin
    -- Proceso combinacional que selecciona la operación a realizar
    process(A, B, ALUCtrl)
    begin
        case ALUCtrl is
            when "0010" => -- Operación ADD (suma)
                alu_result <= std_logic_vector(signed(A) + signed(B));
                
            when "0110" => -- Operación SUB (resta) - para comparaciones BEQ
                alu_result <= std_logic_vector(signed(A) - signed(B));
                
            when "0000" => -- Operación AND
                alu_result <= A and B;
                
            when "0001" => -- Operación OR
                alu_result <= A or B;
                
            when "0111" => -- Operación SLT (Set Less Than)
                if signed(A) < signed(B) then
                    alu_result <= x"00000001";
                else
                    alu_result <= x"00000000";
                end if;
                
            when "1000" => -- Operación XOR
                alu_result <= A xor B;
                
            when "1001" => -- Operación de paso directo (para LUI)
                alu_result <= B; -- Pasa el inmediato directamente
                
            when others => -- Operaciones no implementadas
                alu_result <= (others => '0');
        end case;
    end process;
    
    -- Asignaciones de salida
    Result <= alu_result;
    Zero <= '1' when alu_result = x"00000000" else '0'; -- Detección de resultado cero
end Behavioral;