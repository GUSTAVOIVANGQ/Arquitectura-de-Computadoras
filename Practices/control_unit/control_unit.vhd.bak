library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entidad de la Unidad de Control
entity control_unit is
    Port (
        opcode    : in  STD_LOGIC_VECTOR(6 downto 0);  -- Bits [6:0] de la instrucción
        RegWrite  : out STD_LOGIC;                      -- Habilita escritura en registro rd
        ALUSrc    : out STD_LOGIC;                      -- 0: rs2, 1: inmediato
        MemRead   : out STD_LOGIC;                      -- Habilita lectura de memoria
        MemWrite  : out STD_LOGIC;                      -- Habilita escritura en memoria
        MemToReg  : out STD_LOGIC;                      -- 0: ALU result, 1: memoria
        Branch    : out STD_LOGIC;                      -- Instrucción de salto condicional
        Jump      : out STD_LOGIC;                      -- Salto incondicional (jal/jalr)
        ALUOP     : out STD_LOGIC_VECTOR(2 downto 0)    -- Código de operación ALU
    );
end control_unit;

architecture Behavioral of control_unit is
    -- Definición de opcodes RISC-V
    constant OPCODE_RTYPE   : STD_LOGIC_VECTOR(6 downto 0) := "0110011"; -- R-Type (add, sub, and, or, etc.)
    constant OPCODE_ITYPE   : STD_LOGIC_VECTOR(6 downto 0) := "0010011"; -- I-Type (addi, andi, ori, etc.)
    constant OPCODE_LOAD    : STD_LOGIC_VECTOR(6 downto 0) := "0000011"; -- Load (lw, lb, lh)
    constant OPCODE_STORE   : STD_LOGIC_VECTOR(6 downto 0) := "0100011"; -- Store (sw, sb, sh)
    constant OPCODE_BRANCH  : STD_LOGIC_VECTOR(6 downto 0) := "1100011"; -- Branch (beq, bne, blt, bge)
    constant OPCODE_JAL     : STD_LOGIC_VECTOR(6 downto 0) := "1101111"; -- Jump and Link
    constant OPCODE_JALR    : STD_LOGIC_VECTOR(6 downto 0) := "1100111"; -- Jump and Link Register
    constant OPCODE_LUI     : STD_LOGIC_VECTOR(6 downto 0) := "0110111"; -- Load Upper Immediate
    constant OPCODE_AUIPC   : STD_LOGIC_VECTOR(6 downto 0) := "0010111"; -- Add Upper Immediate to PC
    
    -- Códigos ALUOP
    constant ALUOP_ADD      : STD_LOGIC_VECTOR(2 downto 0) := "000"; -- Suma
    constant ALUOP_SUB      : STD_LOGIC_VECTOR(2 downto 0) := "001"; -- Resta
    constant ALUOP_AND      : STD_LOGIC_VECTOR(2 downto 0) := "010"; -- AND lógico
    constant ALUOP_OR       : STD_LOGIC_VECTOR(2 downto 0) := "011"; -- OR lógico
    constant ALUOP_XOR      : STD_LOGIC_VECTOR(2 downto 0) := "100"; -- XOR lógico
    constant ALUOP_SLT      : STD_LOGIC_VECTOR(2 downto 0) := "101"; -- Set Less Than
    constant ALUOP_RTYPE    : STD_LOGIC_VECTOR(2 downto 0) := "110"; -- Usar funct3 y funct7
    constant ALUOP_BRANCH   : STD_LOGIC_VECTOR(2 downto 0) := "111"; -- Para comparaciones en branch

begin
    -- Proceso principal de decodificación
    control_decode: process(opcode)
    begin
        -- Valores por defecto (estado inactivo)
        RegWrite  <= '0';
        ALUSrc    <= '0';
        MemRead   <= '0';
        MemWrite  <= '0';
        MemToReg  <= '0';
        Branch    <= '0';
        Jump      <= '0';
        ALUOP     <= ALUOP_ADD;
        
        case opcode is
            -- R-Type Instructions (add, sub, and, or, xor, slt, etc.)
            when OPCODE_RTYPE =>
                RegWrite  <= '1';  -- Escribe resultado en rd
                ALUSrc    <= '0';  -- Usa rs2 (registro)
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- Resultado viene de ALU
                Branch    <= '0';  -- No es branch
                Jump      <= '0';  -- No es jump
                ALUOP     <= ALUOP_RTYPE; -- ALU usa funct3/funct7
            
            -- I-Type Instructions (addi, andi, ori, xori, slti, etc.)
            when OPCODE_ITYPE =>
                RegWrite  <= '1';  -- Escribe resultado en rd
                ALUSrc    <= '1';  -- Usa inmediato
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- Resultado viene de ALU
                Branch    <= '0';  -- No es branch
                Jump      <= '0';  -- No es jump
                ALUOP     <= ALUOP_ADD; -- Operación inmediata (típicamente suma)
            
            -- Load Instructions (lw, lb, lh, lbu, lhu)
            when OPCODE_LOAD =>
                RegWrite  <= '1';  -- Escribe dato leído en rd
                ALUSrc    <= '1';  -- Usa inmediato para calcular dirección
                MemRead   <= '1';  -- Lee de memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '1';  -- Dato viene de memoria
                Branch    <= '0';  -- No es branch
                Jump      <= '0';  -- No es jump
                ALUOP     <= ALUOP_ADD; -- Suma base + offset
            
            -- Store Instructions (sw, sb, sh)
            when OPCODE_STORE =>
                RegWrite  <= '0';  -- No escribe en registro
                ALUSrc    <= '1';  -- Usa inmediato para calcular dirección
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '1';  -- Escribe en memoria
                MemToReg  <= '0';  -- No importa (no escribe registro)
                Branch    <= '0';  -- No es branch
                Jump      <= '0';  -- No es jump
                ALUOP     <= ALUOP_ADD; -- Suma base + offset
            
            -- Branch Instructions (beq, bne, blt, bge, bltu, bgeu)
            when OPCODE_BRANCH =>
                RegWrite  <= '0';  -- No escribe en registro
                ALUSrc    <= '0';  -- Compara rs1 con rs2
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- No importa (no escribe registro)
                Branch    <= '1';  -- Es instrucción branch
                Jump      <= '0';  -- No es jump incondicional
                ALUOP     <= ALUOP_BRANCH; -- ALU realiza comparación
            
            -- JAL (Jump and Link)
            when OPCODE_JAL =>
                RegWrite  <= '1';  -- Escribe PC+4 en rd
                ALUSrc    <= '0';  -- No importa para ALU
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- PC+4 viene del adder, no memoria
                Branch    <= '0';  -- No es branch condicional
                Jump      <= '1';  -- Es jump incondicional
                ALUOP     <= ALUOP_ADD; -- Para calcular dirección objetivo
            
            -- JALR (Jump and Link Register)
            when OPCODE_JALR =>
                RegWrite  <= '1';  -- Escribe PC+4 en rd
                ALUSrc    <= '1';  -- Usa inmediato
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- PC+4 viene del adder, no memoria
                Branch    <= '0';  -- No es branch condicional
                Jump      <= '1';  -- Es jump incondicional
                ALUOP     <= ALUOP_ADD; -- Suma rs1 + inmediato
            
            -- LUI (Load Upper Immediate)
            when OPCODE_LUI =>
                RegWrite  <= '1';  -- Escribe inmediato en rd
                ALUSrc    <= '1';  -- Usa inmediato
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- Resultado viene de ALU
                Branch    <= '0';  -- No es branch
                Jump      <= '0';  -- No es jump
                ALUOP     <= ALUOP_ADD; -- Pasa el inmediato (0 + imm)
            
            -- AUIPC (Add Upper Immediate to PC)
            when OPCODE_AUIPC =>
                RegWrite  <= '1';  -- Escribe PC + inmediato en rd
                ALUSrc    <= '1';  -- Usa inmediato
                MemRead   <= '0';  -- No lee memoria
                MemWrite  <= '0';  -- No escribe memoria
                MemToReg  <= '0';  -- Resultado viene de ALU
                Branch    <= '0';  -- No es branch
                Jump      <= '0';  -- No es jump
                ALUOP     <= ALUOP_ADD; -- Suma PC + inmediato
            
            -- Caso por defecto (instrucción no reconocida)
            when others =>
                RegWrite  <= '0';
                ALUSrc    <= '0';
                MemRead   <= '0';
                MemWrite  <= '0';
                MemToReg  <= '0';
                Branch    <= '0';
                Jump      <= '0';
                ALUOP     <= ALUOP_ADD;
        end case;
    end process control_decode;

end Behavioral;