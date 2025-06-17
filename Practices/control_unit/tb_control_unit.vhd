library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity tb_control_unit is
end tb_control_unit;

architecture Behavioral of tb_control_unit is
    -- Señales para el UUT (Unit Under Test)
    signal opcode    : STD_LOGIC_VECTOR(6 downto 0);
    signal RegWrite  : STD_LOGIC;
    signal ALUSrc    : STD_LOGIC;
    signal MemRead   : STD_LOGIC;
    signal MemWrite  : STD_LOGIC;
    signal MemToReg  : STD_LOGIC;
    signal Branch    : STD_LOGIC;
    signal Jump      : STD_LOGIC;
    signal ALUOP     : STD_LOGIC_VECTOR(2 downto 0);
    
    -- Constantes de tiempo
    constant clk_period : time := 10 ns;
    
    -- Componente a probar
    component control_unit
        Port (
            opcode    : in  STD_LOGIC_VECTOR(6 downto 0);
            RegWrite  : out STD_LOGIC;
            ALUSrc    : out STD_LOGIC;
            MemRead   : out STD_LOGIC;
            MemWrite  : out STD_LOGIC;
            MemToReg  : out STD_LOGIC;
            Branch    : out STD_LOGIC;
            Jump      : out STD_LOGIC;
            ALUOP     : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    
    -- Procedimiento para mostrar resultados
    procedure print_signals(signal opcode_val : STD_LOGIC_VECTOR(6 downto 0);
                           instruction_name : string) is
        variable l : line;
    begin
    end procedure;

begin
    -- Instanciación de la unidad de control
    UUT: control_unit
        Port map (
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
    
    -- Proceso de estimulación
    stim_proc: process
        variable l : line;
    begin
        
        -- Test 1: R-Type Instructions (add, sub, and, or, etc.)
        opcode <= "0110011";
        wait for clk_period;
        print_signals(opcode, "R-TYPE (add, sub, and, or, xor, slt)");
        
        -- Test 2: I-Type Instructions (addi, andi, ori, etc.)
        opcode <= "0010011";
        wait for clk_period;
        print_signals(opcode, "I-TYPE (addi, andi, ori, xori, slti)");
        
        -- Test 3: Load Instructions (lw, lb, lh)
        opcode <= "0000011";
        wait for clk_period;
        print_signals(opcode, "LOAD (lw, lb, lh, lbu, lhu)");
        
        -- Test 4: Store Instructions (sw, sb, sh)
        opcode <= "0100011";
        wait for clk_period;
        print_signals(opcode, "STORE (sw, sb, sh)");
        
        -- Test 5: Branch Instructions (beq, bne, blt, bge)
        opcode <= "1100011";
        wait for clk_period;
        print_signals(opcode, "BRANCH (beq, bne, blt, bge, bltu, bgeu)");
        
        -- Test 6: JAL (Jump and Link)
        opcode <= "1101111";
        wait for clk_period;
        print_signals(opcode, "JAL (Jump and Link)");
        
        -- Test 7: JALR (Jump and Link Register)
        opcode <= "1100111";
        wait for clk_period;
        print_signals(opcode, "JALR (Jump and Link Register)");
        
        -- Test 8: LUI (Load Upper Immediate)
        opcode <= "0110111";
        wait for clk_period;
        print_signals(opcode, "LUI (Load Upper Immediate)");
        
        -- Test 9: AUIPC (Add Upper Immediate to PC)
        opcode <= "0010111";
        wait for clk_period;
        print_signals(opcode, "AUIPC (Add Upper Immediate to PC)");
        
        -- Test 10: Opcode inválido
        opcode <= "1111111";
        wait for clk_period;
        print_signals(opcode, "INVALID OPCODE (caso por defecto)");
        
        wait;
    end process;

end Behavioral;