-- ===============================
-- UNIDAD DE CONTROL
-- Descripción: Decodifica el opcode de la instrucción y genera todas las señales de control
-- necesarias para coordinar el funcionamiento del procesador. Determina qué recursos se
-- activan para cada tipo de instrucción (R-type, I-type, etc.)
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port (
        opcode    : in  STD_LOGIC_VECTOR(6 downto 0); -- Los 7 bits menos significativos de la instrucción
        RegWrite  : out STD_LOGIC; -- Habilita escritura en archivo de registros
        ALUSrc    : out STD_LOGIC; -- Selecciona fuente para segundo operando de ALU (0=rs2, 1=inmediato)
        MemRead   : out STD_LOGIC; -- Habilita lectura de memoria de datos
        MemWrite  : out STD_LOGIC; -- Habilita escritura en memoria de datos
        MemToReg  : out STD_LOGIC; -- Selecciona fuente para escribir en registro (0=ALU, 1=memoria)
        Branch    : out STD_LOGIC; -- Indica si es instrucción de salto condicional
        Jump      : out STD_LOGIC; -- Indica si es instrucción de salto incondicional
        ALUOP     : out STD_LOGIC_VECTOR(1 downto 0) -- Código para el control de la ALU
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    -- Proceso combinacional que decodifica el opcode
    process(opcode)
    begin
        -- Valores por defecto (instrucción inválida o NOP)
        RegWrite <= '0';
        ALUSrc   <= '0';
        MemRead  <= '0';
        MemWrite <= '0';
        MemToReg <= '0';
        Branch   <= '0';
        Jump     <= '0';
        ALUOP    <= "00";
        
        case opcode is
            -- R-type (ADD, SUB, etc.) - opcode: 0110011
            when "0110011" =>
                RegWrite <= '1'; -- Escribir resultado en rd
                ALUSrc   <= '0'; -- Usar rs2 como segundo operando
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '0'; -- Escribir resultado de ALU en registro
                Branch   <= '0'; -- No es salto
                Jump     <= '0'; -- No es salto
                ALUOP    <= "10"; -- Operación R-type (necesita decodificación adicional)
                
            -- I-type (ADDI, etc.) - opcode: 0010011
            when "0010011" =>
                RegWrite <= '1'; -- Escribir resultado en rd
                ALUSrc   <= '1'; -- Usar inmediato como segundo operando
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '0'; -- Escribir resultado de ALU en registro
                Branch   <= '0'; -- No es salto
                Jump     <= '0'; -- No es salto
                ALUOP    <= "00"; -- Operación de suma simple
                
            when others =>
                -- Mantener valores por defecto para opcodes no implementados
                null;
        end case;
    end process;
end Behavioral;