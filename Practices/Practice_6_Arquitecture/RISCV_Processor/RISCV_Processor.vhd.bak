library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RISCV_Processor is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC
    );
end RISCV_Processor;

architecture Behavioral of RISCV_Processor is
    -- Componentes
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
    
    -- Señales internas
    signal PC : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal PC_next : STD_LOGIC_VECTOR(31 downto 0);
    signal instruction : STD_LOGIC_VECTOR(31 downto 0);
    signal immediate : STD_LOGIC_VECTOR(31 downto 0);
    signal reg_data1, reg_data2 : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_input2 : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(31 downto 0);
    signal mem_data : STD_LOGIC_VECTOR(31 downto 0);
    signal write_data : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_ctrl : STD_LOGIC_VECTOR(3 downto 0);
    
    -- Señales de control
    signal RegWrite, ALUSrc, MemRead, MemWrite, MemToReg, Branch, Jump : STD_LOGIC;
    signal ALUOP : STD_LOGIC_VECTOR(1 downto 0);
    signal Zero : STD_LOGIC;
    
begin
    -- Program Counter
    process(clk, reset)
    begin
        if reset = '1' then
            PC <= x"00000000";
        elsif rising_edge(clk) then
            PC <= PC_next;
        end if;
    end process;
    
    PC_next <= std_logic_vector(unsigned(PC) + 4);
    
    -- Instanciación de componentes
    U_CONTROL: ControlUnit
        port map (
            opcode   => instruction(6 downto 0),
            RegWrite => RegWrite,
            ALUSrc   => ALUSrc,
            MemRead  => MemRead,
            MemWrite => MemWrite,
            MemToReg => MemToReg,
            Branch   => Branch,
            Jump     => Jump,
            ALUOP    => ALUOP
        );
    
    U_IMEM: InstructionMemory
        port map (
            addr => PC,
            inst => instruction
        );
    
    U_REGFILE: RegisterFile_32bit
        port map (
            clk      => clk,
            we       => RegWrite,
            wr_addr  => instruction(11 downto 7),   -- rd
            rd_addr1 => instruction(19 downto 15),  -- rs1
            rd_addr2 => instruction(24 downto 20),  -- rs2
            wr_data  => write_data,
            rd_data1 => reg_data1,
            rd_data2 => reg_data2
        );
    
    U_IMMGEN: ImmGen
        port map (
            inst => instruction,
            imm  => immediate
        );
    
    U_ALUCONTROL: ALUControl
        port map (
            ALUOP   => ALUOP,
            funct7  => instruction(31 downto 25),
            funct3  => instruction(14 downto 12),
            ALUCtrl => alu_ctrl
        );
    
    U_ALU: ALU
        port map (
            A       => reg_data1,
            B       => alu_input2,
            ALUCtrl => alu_ctrl,
            Result  => alu_result,
            Zero    => Zero
        );
    
    U_DMEM: DataMemory
        port map (
            clk      => clk,
            addr     => alu_result,
            wr_data  => reg_data2,
            MemRead  => MemRead,
            MemWrite => MemWrite,
            rd_data  => mem_data
        );
    
    -- MUXes
    alu_input2 <= immediate when ALUSrc = '1' else reg_data2;
    write_data <= mem_data when MemToReg = '1' else alu_result;
    
end Behavioral;