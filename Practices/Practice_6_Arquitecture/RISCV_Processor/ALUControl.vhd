-- ===============================
-- CONTROL DE ALU
-- Descripción: Decodifica las señales ALUOP junto con los campos funct3 y funct7 de la
-- instrucción para generar la señal de control específica que determina qué operación
-- debe realizar la ALU. Actúa como un decodificador de segundo nivel.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUControl is
    Port (
        ALUOP    : in  STD_LOGIC_VECTOR(1 downto 0); -- Código de la unidad de control principal
        funct7   : in  STD_LOGIC_VECTOR(6 downto 0); -- Bits [31:25] de la instrucción
        funct3   : in  STD_LOGIC_VECTOR(2 downto 0); -- Bits [14:12] de la instrucción
        ALUCtrl  : out STD_LOGIC_VECTOR(3 downto 0)  -- Código específico para la ALU
    );
end ALUControl;

architecture Behavioral of ALUControl is
begin
    -- Proceso combinacional que decodifica la operación específica
    process(ALUOP, funct7, funct3)
    begin
        case ALUOP is
            when "00" => -- Instrucciones I-type (ADDI, etc.)
                ALUCtrl <= "0010"; -- Siempre suma para I-type
                
            when "10" => -- Instrucciones R-type (ADD, SUB, etc.)
                -- Decodificación basada en funct3 y funct7
                if funct3 = "000" and funct7 = "0000000" then -- ADD
                    ALUCtrl <= "0010"; -- Código para suma
                else
                    ALUCtrl <= "0000"; -- Operación no implementada (NOP)
                end if;
                
            when others => -- Otros tipos de instrucción
                ALUCtrl <= "0000"; -- Operación no implementada
        end case;
    end process;
end Behavioral;