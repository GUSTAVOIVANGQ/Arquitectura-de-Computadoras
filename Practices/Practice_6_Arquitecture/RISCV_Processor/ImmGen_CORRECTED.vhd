-- ===============================
-- EXTENSOR DE INMEDIATOS - VERSIÓN CORREGIDA
-- Descripción: Extrae y extiende con signo los valores inmediatos de las instrucciones.
-- Soporta todos los formatos de inmediatos de RISC-V: I-type, S-type, B-type, U-type, J-type.
-- Este módulo es crucial para el correcto funcionamiento de load/store y branch.
-- VERSIÓN CORREGIDA: Tamaños de concatenación exactos para evitar errores de síntesis
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ImmGen is
    Port (
        inst : in  STD_LOGIC_VECTOR(31 downto 0); -- Instrucción completa
        imm  : out STD_LOGIC_VECTOR(31 downto 0)  -- Inmediato extendido a 32 bits
    );
end ImmGen;

architecture Behavioral of ImmGen is
    signal opcode : STD_LOGIC_VECTOR(6 downto 0);
begin
    opcode <= inst(6 downto 0);
    
    -- Proceso combinacional que extrae y extiende el inmediato
    process(inst, opcode)
        variable s_imm : STD_LOGIC_VECTOR(11 downto 0);  -- 12 bits para S-type
        variable b_imm : STD_LOGIC_VECTOR(12 downto 0);  -- 13 bits para B-type  
        variable j_imm : STD_LOGIC_VECTOR(20 downto 0);  -- 21 bits para J-type
    begin
        case opcode is
            -- I-type: ADDI, SLTI, XORI, ORI, ANDI, SLLI, SRLI, SRAI, LB, LH, LW, LBU, LHU, JALR
            when "0010011" | "0000011" | "1100111" =>
                -- Inmediato en bits [31:20] (12 bits)
                -- Extensión de signo: 20 bits superiores + 12 bits del inmediato = 32 bits
                if inst(31) = '1' then
                    imm <= x"FFFFF" & inst(31 downto 20); -- Extensión negativa
                else
                    imm <= x"00000" & inst(31 downto 20); -- Extensión positiva
                end if;
                
            -- S-type: SB, SH, SW
            when "0100011" =>
                -- Inmediato dividido: inst[31:25] (7 bits) + inst[11:7] (5 bits) = 12 bits
                -- Extensión de signo: 20 bits superiores + 12 bits del inmediato = 32 bits
                s_imm := inst(31 downto 25) & inst(11 downto 7);
                if inst(31) = '1' then
                    imm <= x"FFFFF" & s_imm; -- Extensión negativa
                else
                    imm <= x"00000" & s_imm; -- Extensión positiva
                end if;
                
            -- B-type: BEQ, BNE, BLT, BGE, BLTU, BGEU
            when "1100011" =>
                -- Inmediato reordenado: inst[31] + inst[7] + inst[30:25] + inst[11:8] + '0'
                -- Formato: [12|11|10:5|4:1|0] donde bit 0 siempre es 0 (alineado a 2 bytes)
                -- Total: 1 + 1 + 6 + 4 + 1 = 13 bits
                -- Extensión de signo: 19 bits superiores + 13 bits del inmediato = 32 bits
                b_imm := inst(31) & inst(7) & inst(30 downto 25) & inst(11 downto 8) & '0';
                if inst(31) = '1' then
                    imm <= (31 downto 13 => '1') & b_imm; -- Extensión negativa
                else
                    imm <= (31 downto 13 => '0') & b_imm; -- Extensión positiva
                end if;
                
            -- U-type: LUI, AUIPC
            when "0110111" | "0010111" =>
                -- Inmediato en bits superiores: inst[31:12] (20 bits) + 12 ceros = 32 bits
                imm <= inst(31 downto 12) & x"000";
                
            -- J-type: JAL
            when "1101111" =>
                -- Inmediato reordenado: inst[31] + inst[19:12] + inst[20] + inst[30:21] + '0'
                -- Formato: [20|19:12|11|10:1|0] donde bit 0 siempre es 0 (alineado a 2 bytes)
                -- Total: 1 + 8 + 1 + 10 + 1 = 21 bits
                -- Extensión de signo: 11 bits superiores + 21 bits del inmediato = 32 bits
                j_imm := inst(31) & inst(19 downto 12) & inst(20) & inst(30 downto 21) & '0';
                if inst(31) = '1' then
                    imm <= (31 downto 21 => '1') & j_imm; -- Extensión negativa
                else
                    imm <= (31 downto 21 => '0') & j_imm; -- Extensión positiva
                end if;
                
            when others => -- Tipos de instrucción no implementados o R-type (no tienen inmediato)
                imm <= x"00000000"; -- Inmediato cero por defecto
        end case;
    end process;
end Behavioral;

-- ===============================
-- TABLA DE VERIFICACIÓN DE TAMAÑOS:
-- ===============================
-- I-type: x"FFFFF" (20 bits) + inst[31:20] (12 bits) = 32 bits ✓
-- S-type: x"FFFFF" (20 bits) + s_imm (12 bits) = 32 bits ✓  
-- B-type: (31 downto 13) (19 bits) + b_imm (13 bits) = 32 bits ✓
-- U-type: inst[31:12] (20 bits) + x"000" (12 bits) = 32 bits ✓
-- J-type: (31 downto 21) (11 bits) + j_imm (21 bits) = 32 bits ✓
-- ===============================
