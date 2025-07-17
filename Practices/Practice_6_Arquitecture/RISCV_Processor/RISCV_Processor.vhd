-- ===============================
-- PROCESADOR RISC-V MONOCICLO - VERSIÓN COMPLETA CON LOAD/STORE y SUMA
-- Descripción: Módulo principal que integra todos los componentes del procesador RISC-V
-- monociclo con soporte completo para instrucciones load/store.
-- Implementa la ruta de datos completa y manejo de hazards básicos.
-- ===============================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RISCV_Processor is
    Port (
        clk   : in  STD_LOGIC; -- Reloj del sistema
        reset : in  STD_LOGIC  -- Reset asíncrono
    );
end RISCV_Processor;

architecture Behavioral of RISCV_Processor is
    -- ===============================
    -- DECLARACIÓN DE COMPONENTES
    -- ===============================
    
    component ControlUnit
        Port (
            opcode    : in  STD_LOGIC_VECTOR(6 downto 0);
            RegWrite  : out STD_LOGIC;
            ALUSrc    : out STD_LOGIC;
            MemRead   : out STD_LOGIC;
            MemWrite  : out STD_LOGIC;
            MemToReg  : out STD_LOGIC;
            Branch    : out STD_LOGIC;
            Jump      : out STD_LOGIC;
            ALUOP     : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    
    component ALU
        Port (
            A        : in  STD_LOGIC_VECTOR(31 downto 0);
            B        : in  STD_LOGIC_VECTOR(31 downto 0);
            ALUCtrl  : in  STD_LOGIC_VECTOR(3 downto 0);
            Result   : out STD_LOGIC_VECTOR(31 downto 0);
            Zero     : out STD_LOGIC
        );
    end component;
    
    component ALUControl
        Port (
            ALUOP    : in  STD_LOGIC_VECTOR(1 downto 0);
            funct7   : in  STD_LOGIC_VECTOR(6 downto 0);
            funct3   : in  STD_LOGIC_VECTOR(2 downto 0);
            ALUCtrl  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    component InstructionMemory
        Port (
            addr : in  STD_LOGIC_VECTOR(31 downto 0);
            inst : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    
    component DataMemory
        Port (
            clk      : in  STD_LOGIC;
            addr     : in  STD_LOGIC_VECTOR(31 downto 0);
            wr_data  : in  STD_LOGIC_VECTOR(31 downto 0);
            MemRead  : in  STD_LOGIC;
            MemWrite : in  STD_LOGIC;
            funct3   : in  STD_LOGIC_VECTOR(2 downto 0);
            rd_data  : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    
    component ImmGen
        Port (
            inst : in  STD_LOGIC_VECTOR(31 downto 0);
            imm  : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    
    component RegisterFile_32bit
        Port (
            clk      : in  std_logic;
            we       : in  std_logic;
            wr_addr  : in  std_logic_vector(4 downto 0);
            rd_addr1 : in  std_logic_vector(4 downto 0);
            rd_addr2 : in  std_logic_vector(4 downto 0);
            wr_data  : in  std_logic_vector(31 downto 0);
            rd_data1 : out std_logic_vector(31 downto 0);
            rd_data2 : out std_logic_vector(31 downto 0)
        );
    end component;
    
    -- ===============================
    -- SEÑALES DE LA RUTA DE DATOS
    -- ===============================
    
    -- Program Counter y control de flujo
    signal PC : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal PC_next : STD_LOGIC_VECTOR(31 downto 0);
    signal PC_plus4 : STD_LOGIC_VECTOR(31 downto 0);
    signal PC_branch : STD_LOGIC_VECTOR(31 downto 0);
    signal PC_jump : STD_LOGIC_VECTOR(31 downto 0);
    signal PCSrc : STD_LOGIC;
    
    -- Instrucción y campos
    signal instruction : STD_LOGIC_VECTOR(31 downto 0);
    signal opcode : STD_LOGIC_VECTOR(6 downto 0);
    signal funct3 : STD_LOGIC_VECTOR(2 downto 0);
    signal funct7 : STD_LOGIC_VECTOR(6 downto 0);
    
    -- Registros y datos
    signal immediate : STD_LOGIC_VECTOR(31 downto 0);
    signal reg_data1, reg_data2 : STD_LOGIC_VECTOR(31 downto 0);
    signal write_data : STD_LOGIC_VECTOR(31 downto 0);
    
    -- ALU
    signal alu_input2 : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_ctrl : STD_LOGIC_VECTOR(3 downto 0);
    signal zero : STD_LOGIC;
    
    -- Memoria
    signal mem_data : STD_LOGIC_VECTOR(31 downto 0);
    
    -- Señales de control
    signal RegWrite, ALUSrc, MemRead, MemWrite, MemToReg, Branch, Jump : STD_LOGIC;
    signal ALUOP : STD_LOGIC_VECTOR(1 downto 0);
    
    -- Señales auxiliares
    signal branch_taken : STD_LOGIC;
    
begin
    -- ===============================
    -- EXTRACCIÓN DE CAMPOS DE INSTRUCCIÓN
    -- ===============================
    opcode <= instruction(6 downto 0);
    funct3 <= instruction(14 downto 12);
    funct7 <= instruction(31 downto 25);
    
    -- ===============================
    -- PROGRAM COUNTER Y CONTROL DE FLUJO
    -- ===============================
    
    -- Registro del Program Counter
    process(clk, reset)
    begin
        if reset = '1' then
            PC <= x"00000000";
        elsif rising_edge(clk) then
            PC <= PC_next;
        end if;
    end process;
    
    -- Cálculo de direcciones
    PC_plus4 <= std_logic_vector(unsigned(PC) + 4);
    PC_branch <= std_logic_vector(signed(PC) + signed(immediate));
    PC_jump <= std_logic_vector(signed(PC) + signed(immediate));
    
    -- Lógica de salto
    branch_taken <= Branch and zero when funct3 = "000" else  -- BEQ
                    Branch and not zero when funct3 = "001" else  -- BNE
                    '0';
    
    PCSrc <= branch_taken or Jump;
    
    -- Selección del próximo PC
    PC_next <= PC_branch when branch_taken = '1' else
               PC_jump when Jump = '1' else
               PC_plus4;
    
    -- ===============================
    -- INSTANCIACIÓN DE COMPONENTES
    -- ===============================
    
    -- Memoria de instrucciones
    U_IMEM: InstructionMemory
        port map (
            addr => PC,
            inst => instruction
        );
    
    -- Unidad de control
    U_CONTROL: ControlUnit
        port map (
            opcode   => opcode,
            RegWrite => RegWrite,
            ALUSrc   => ALUSrc,
            MemRead  => MemRead,
            MemWrite => MemWrite,
            MemToReg => MemToReg,
            Branch   => Branch,
            Jump     => Jump,
            ALUOP    => ALUOP
        );
      -- Archivo de registros  
    U_REGFILE: RegisterFile_32bit
        port map (
            clk      => clk,
            we       => RegWrite,
            wr_addr  => instruction(11 downto 7),  -- rd
            rd_addr1 => instruction(19 downto 15), -- rs1
            rd_addr2 => instruction(24 downto 20), -- rs2
            wr_data  => write_data,
            rd_data1 => reg_data1,
            rd_data2 => reg_data2
        );
    
    -- Generador de inmediatos
    U_IMMGEN: ImmGen
        port map (
            inst => instruction,
            imm  => immediate
        );
    
    -- Control de ALU
    U_ALUCONTROL: ALUControl
        port map (
            ALUOP   => ALUOP,
            funct7  => funct7,
            funct3  => funct3,
            ALUCtrl => alu_ctrl
        );
    
    -- ALU
    U_ALU: ALU
        port map (
            A       => reg_data1,
            B       => alu_input2,
            ALUCtrl => alu_ctrl,
            Result  => alu_result,
            Zero    => zero
        );
    
    -- Memoria de datos
    U_DMEM: DataMemory
        port map (
            clk      => clk,
            addr     => alu_result,
            wr_data  => reg_data2,
            MemRead  => MemRead,
            MemWrite => MemWrite,
            funct3   => funct3,
            rd_data  => mem_data
        );
    
    -- ===============================
    -- MULTIPLEXORES DE LA RUTA DE DATOS
    -- ===============================
    
    -- Multiplexor para entrada B de la ALU (rs2 o inmediato)
    alu_input2 <= immediate when ALUSrc = '1' else reg_data2;
    
    -- Multiplexor para dato a escribir en registro (resultado ALU o memoria)
    write_data <= mem_data when MemToReg = '1' else alu_result;

end Behavioral;