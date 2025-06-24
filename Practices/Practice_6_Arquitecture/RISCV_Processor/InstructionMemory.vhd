-- ===============================
-- MEMORIA DE INSTRUCCIONES (VERSIÓN BINARIA)
-- Descripción: Almacena las instrucciones del programa usando formato binario
-- para mayor claridad en el análisis de campos de instrucción.
-- El PC (Program Counter) proporciona la dirección y la memoria devuelve
-- la instrucción de 32 bits correspondiente.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
    Port (
        addr : in  STD_LOGIC_VECTOR(31 downto 0); -- Dirección de la instrucción (PC)
        inst : out STD_LOGIC_VECTOR(31 downto 0)  -- Instrucción de 32 bits
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    -- Definición del tipo de memoria (256 instrucciones de 32 bits)
    type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    
    -- Inicialización de la memoria con un programa de prueba en BINARIO
    signal memory : mem_array := (
        -- ==========================================
        -- PROGRAMA DE EJEMPLO - OPERACIONES DE SUMA
        -- ==========================================
        
        -- INSTRUCCIÓN 0: addi x1, x0, 5 (x1 = 0 + 5 = 5)
        -- Formato I-type: imm[11:0] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
        -- imm=5, rs1=x0, funct3=000, rd=x1, opcode=0010011
        0 => "00000000010100000000000010010011",
        --    ^^^^^^^^^^^^ ^^^^^ ^^^ ^^^^^ ^^^^^^^
        --    imm=5        rs1=0 f3  rd=1  opcode
        
        -- INSTRUCCIÓN 1: addi x2, x0, 3 (x2 = 0 + 3 = 3)
        -- Formato I-type: imm[11:0] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
        -- imm=3, rs1=x0, funct3=000, rd=x2, opcode=0010011
        1 => "00000000001100000000000100010011",
        --    ^^^^^^^^^^^^ ^^^^^ ^^^ ^^^^^ ^^^^^^^
        --    imm=3        rs1=0 f3  rd=2  opcode
        
        -- INSTRUCCIÓN 2: add x3, x1, x2 (x3 = x1 + x2 = 8)
        -- Formato R-type: funct7[31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
        -- funct7=0000000, rs2=x2, rs1=x1, funct3=000, rd=x3, opcode=0110011
        2 => "00000000001000001000000110110011",
        --    ^^^^^^^ ^^^^^ ^^^^^ ^^^ ^^^^^ ^^^^^^^
        --    funct7  rs2=2 rs1=1 f3  rd=3  opcode
          -- INSTRUCCIÓN 3: addi x4, x3, 4 (x4 = x3 + 4 = 12)
        -- Formato I-type: imm[11:0] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
        -- imm=4, rs1=x3, funct3=000, rd=x4, opcode=0010011
        3 => "00000000010000011000001000010011",
        --    ^^^^^^^^^^^^ ^^^^^ ^^^ ^^^^^ ^^^^^^^
        --    imm=4        rs1=3 f3  rd=4  opcode
        
        -- INSTRUCCIÓN 4: sw x1, 0(x0) (Almacenar x1 en dirección 0)
        -- Formato S-type: imm[11:5] | rs2[24:20] | rs1[19:15] | funct3[14:12] | imm[4:0] | opcode[6:0]
        -- imm=0, rs2=x1, rs1=x0, funct3=010, opcode=0100011
        4 => "00000000000100000010000000100011",
        --    ^^^^^^^ ^^^^^ ^^^^^ ^^^ ^^^^^ ^^^^^^^
        --    imm[11:5] rs2=1 rs1=0 f3  imm[4:0] opcode
        
        -- INSTRUCCIÓN 5: lw x5, 0(x0) (Cargar en x5 desde dirección 0)
        -- Formato I-type: imm[11:0] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
        -- imm=0, rs1=x0, funct3=010, rd=x5, opcode=0000011
        5 => "00000000000000000010001010000011",
        --    ^^^^^^^^^^^^ ^^^^^ ^^^ ^^^^^ ^^^^^^^
        --    imm=0        rs1=0 f3  rd=5  opcode
        
        -- Resto de posiciones con NOP (instrucción vacía)
        others => "00000000000000000000000000000000" -- NOP
    );
    
    -- ==========================================
    -- DECODIFICACIÓN DE CAMPOS PARA REFERENCIA:
    -- ==========================================
    -- RISC-V I-type (ADDI):
    --   [31:20] = imm[11:0]    (inmediato de 12 bits)
    --   [19:15] = rs1          (registro fuente)
    --   [14:12] = funct3       (función específica)
    --   [11:7]  = rd           (registro destino)
    --   [6:0]   = opcode       (código de operación)
    --
    -- RISC-V R-type (ADD):
    --   [31:25] = funct7       (función específica extendida)
    --   [24:20] = rs2          (segundo registro fuente)
    --   [19:15] = rs1          (primer registro fuente)
    --   [14:12] = funct3       (función específica)
    --   [11:7]  = rd           (registro destino)
    --   [6:0]   = opcode       (código de operación)
    -- ==========================================
    
begin
    -- Lectura asíncrona: divide addr por 4 para obtener índice de palabra
    -- (Las direcciones van de 4 en 4: 0, 4, 8, 12...)
    inst <= memory(to_integer(unsigned(addr(9 downto 2))));
      -- NOTA: Para debugging, puedes usar los siguientes valores:
    -- addr = 0 → índice 0 → addi x1, x0, 5
    -- addr = 4 → índice 1 → addi x2, x0, 3  
    -- addr = 8 → índice 2 → add x3, x1, x2
    -- addr = 12 → índice 3 → addi x4, x3, 4
    -- addr = 16 → índice 4 → sw x1, 0(x0)
    -- addr = 20 → índice 5 → lw x5, 0(x0)
    
end Behavioral;

-- ==========================================
-- VERIFICACIÓN DE INSTRUCCIONES:
-- ==========================================
-- Para verificar que las instrucciones binarias son correctas,
-- puedes convertir a hexadecimal:
--
-- Instrucción 0: "00000000010100000000000010010011"
-- Binario: 0000_0000_0101_0000_0000_0001_0001_0011
-- Hex: 0x00500093 ✓ → addi x1, x0, 5
--
-- Instrucción 1: "00000000001100000000000100010011"  
-- Binario: 0000_0000_0011_0000_0000_0010_0001_0011
-- Hex: 0x00300113 ✓ → addi x2, x0, 3
--
-- Instrucción 2: "00000000001000001000000110110011"
-- Binario: 0000_0000_0010_0000_1000_0011_0011_0011  
-- Hex: 0x002081B3 ✓ → add x3, x1, x2
--
-- Instrucción 3: "00000000010000011000001000010011"
-- Binario: 0000_0000_0100_0001_1000_0100_0001_0011
-- Hex: 0x00418213 ✓ → addi x4, x3, 4
--
-- Instrucción 4: "00000000000100000010000000100011"
-- Binario: 0000_0000_0001_0000_0010_0000_0010_0011
-- Hex: 0x00102023 ✓ → sw x1, 0(x0)
--
-- Instrucción 5: "00000000000000000010001010000011"
-- Binario: 0000_0000_0000_0000_0010_0010_1000_0011
-- Hex: 0x00002283 ✓ → lw x5, 0(x0)
-- ==========================================