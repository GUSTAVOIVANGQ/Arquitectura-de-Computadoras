-- ===============================
-- CONTROL DE ALU - VERSIÓN MEJORADA
-- Descripción: Decodifica las señales ALUOP junto con los campos funct3 y funct7 de la
-- instrucción para generar la señal de control específica que determina qué operación
-- debe realizar la ALU. Incluye soporte para load/store, branch y más operaciones.
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
            when "00" => -- Instrucciones que requieren suma (I-type, Load, Store)
                ALUCtrl <= "0010"; -- Suma para cálculo de direcciones y ADDI
                
            when "01" => -- Instrucciones Branch (BEQ, BNE, etc.)
                case funct3 is
                    when "000" => -- BEQ (Branch if Equal)
                        ALUCtrl <= "0110"; -- Resta para comparación
                    when "001" => -- BNE (Branch if Not Equal)
                        ALUCtrl <= "0110"; -- Resta para comparación
                    when "100" => -- BLT (Branch if Less Than)
                        ALUCtrl <= "0111"; -- Set Less Than
                    when "101" => -- BGE (Branch if Greater or Equal)
                        ALUCtrl <= "0111"; -- Set Less Than (resultado negado)
                    when others =>
                        ALUCtrl <= "0110"; -- Por defecto resta
                end case;
                
            when "10" => -- Instrucciones R-type (ADD, SUB, AND, OR, etc.)
                -- Decodificación basada en funct3 y funct7
                case funct3 is
                    when "000" => -- ADD o SUB
                        if funct7 = "0000000" then -- ADD
                            ALUCtrl <= "0010";
                        elsif funct7 = "0100000" then -- SUB
                            ALUCtrl <= "0110";
                        else
                            ALUCtrl <= "0000"; -- Operación no válida
                        end if;
                        
                    when "111" => -- AND
                        ALUCtrl <= "0000";
                        
                    when "110" => -- OR
                        ALUCtrl <= "0001";
                        
                    when "100" => -- XOR
                        ALUCtrl <= "1000";
                        
                    when "010" => -- SLT (Set Less Than)
                        ALUCtrl <= "0111";
                        
                    when others =>
                        ALUCtrl <= "0000"; -- Operación no implementada
                end case;
                
            when "11" => -- Instrucciones especiales (LUI, etc.)
                ALUCtrl <= "1001"; -- Paso directo del inmediato
                
            when others => -- Casos no definidos
                ALUCtrl <= "0000"; -- Operación no implementada
        end case;
    end process;
end Behavioral;