library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RISC_V_Adder is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        opcode : in STD_LOGIC_VECTOR(6 downto 0);
        rs1, rs2, rd : in STD_LOGIC_VECTOR(1 downto 0);
        immediate : in STD_LOGIC_VECTOR(1 downto 0);
        result : out STD_LOGIC_VECTOR(1 downto 0)
    );
end RISC_V_Adder;

architecture Structural of RISC_V_Adder is
    -- Señales de control
    signal RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, Branch, Jump : STD_LOGIC;
    signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);
    
    -- Señales de datos
    signal ReadData1, ReadData2, ALUResult, ExtendedImm, MuxALUOut, WriteData : STD_LOGIC_VECTOR(1 downto 0);
begin
    -- Unidad de Control
    CU: entity work.ControlUnit
    port map (
        opcode => opcode,
        RegWrite => RegWrite,
        ALUSrc => ALUSrc,
        MemWrite => MemWrite,
        MemRead => MemRead,
        MemtoReg => MemtoReg,
        Branch => Branch,
        ALUOp => ALUOp,
        Jump => Jump
    );
    
    -- Banco de registros
    RF: entity work.RegisterFile
    port map (
        clk => clk,
        reset => reset,
        RegWrite => RegWrite,
        rs1 => rs1,
        rs2 => rs2,
        rd => rd,
        WriteData => WriteData,
        ReadData1 => ReadData1,
        ReadData2 => ReadData2
    );
    
    -- Extensor de signo
    SE: entity work.SignExtend
    port map (
        immediate => immediate,
        extended => ExtendedImm
    );
    
    -- Multiplexor ALU
    MuxALU: entity work.Mux2
    port map (
        a => ReadData2,
        b => ExtendedImm,
        sel => ALUSrc,
        output => MuxALUOut
    );
    
    -- ALU
    ALU: entity work.ALU
    port map (
        a => ReadData1,
        b => MuxALUOut,
        ALUOp => ALUOp,
        result => ALUResult
    );
    
    -- Multiplexor WriteBack (solo ALU en este ejemplo)
    WriteData <= ALUResult;
    
    -- Salida
    result <= ALUResult;
end Structural;