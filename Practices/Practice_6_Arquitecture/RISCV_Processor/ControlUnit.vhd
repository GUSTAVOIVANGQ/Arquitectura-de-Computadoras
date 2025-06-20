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
                
            -- Load (lw) - opcode: 0000011
            when "0000011" =>
                RegWrite <= '1'; -- Escribir dato cargado en rd
                ALUSrc   <= '1'; -- Usar inmediato para calcular dirección
                MemRead  <= '1'; -- Habilitar lectura de memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '1'; -- Escribir dato de memoria en registro
                Branch   <= '0'; -- No es salto
                Jump     <= '0'; -- No es salto
                ALUOP    <= "00"; -- Suma para calcular dirección (base + offset)
                
            -- Store (sw) - opcode: 0100011
            when "0100011" =>
                RegWrite <= '0'; -- No escribir en registro
                ALUSrc   <= '1'; -- Usar inmediato para calcular dirección
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '1'; -- Habilitar escritura en memoria
                MemToReg <= '0'; -- No aplica (no se escribe en registro)
                Branch   <= '0'; -- No es salto
                Jump     <= '0'; -- No es salto
                ALUOP    <= "00"; -- Suma para calcular dirección (base + offset)
                
            -- Branch (beq) - opcode: 1100011
            when "1100011" =>
                RegWrite <= '0'; -- No escribir en registro
                ALUSrc   <= '0'; -- Usar rs2 para comparación
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '0'; -- No aplica (no se escribe en registro)
                Branch   <= '1'; -- Es instrucción de salto condicional
                Jump     <= '0'; -- No es salto incondicional
                ALUOP    <= "01"; -- Operación de comparación (resta para beq)
                
            -- JAL (Jump and Link) - opcode: 1101111
            when "1101111" =>
                RegWrite <= '1'; -- Escribir PC+4 en rd
                ALUSrc   <= '0'; -- No aplica para cálculo de dirección
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '0'; -- Escribir PC+4 (no resultado de ALU ni memoria)
                Branch   <= '0'; -- No es salto condicional
                Jump     <= '1'; -- Es salto incondicional
                ALUOP    <= "00"; -- Operación simple (puede necesitar ajuste)
                
            -- JALR (Jump and Link Register) - opcode: 1100111
            when "1100111" =>
                RegWrite <= '1'; -- Escribir PC+4 en rd
                ALUSrc   <= '1'; -- Usar inmediato para calcular dirección destino
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '0'; -- Escribir PC+4 (no resultado de ALU ni memoria)
                Branch   <= '0'; -- No es salto condicional
                Jump     <= '1'; -- Es salto incondicional
                ALUOP    <= "00"; -- Suma para calcular dirección (rs1 + inmediato)
                
            -- LUI (Load Upper Immediate) - opcode: 0110111
            when "0110111" =>
                RegWrite <= '1'; -- Escribir inmediato en rd
                ALUSrc   <= '1'; -- Usar inmediato como operando
                MemRead  <= '0'; -- No leer memoria
                MemWrite <= '0'; -- No escribir memoria
                MemToReg <= '0'; -- Escribir resultado de ALU en registro
                Branch   <= '0'; -- No es salto
                Jump     <= '0'; -- No es salto
                ALUOP    <= "00"; -- Operación simple (puede requerir código específico)
                
            when others =>
                -- Mantener valores por defecto para opcodes no implementados
                null;
        end case;
    end process;
end Behavioral;