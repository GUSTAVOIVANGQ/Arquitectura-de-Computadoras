-- ===============================
-- PROCESADOR PRINCIPAL SIMPLIFICADO
-- ===============================
entity SimpleRISCV is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        -- Entradas para configurar operación manualmente
        instruction: in  STD_LOGIC_VECTOR(15 downto 0); -- Instrucción simplificada
        -- Salidas para mostrar en LEDs/7-seg
        result_out : out STD_LOGIC_VECTOR(1 downto 0);
        carry_out  : out STD_LOGIC;
        reg_display: out STD_LOGIC_VECTOR(7 downto 0)   -- Para mostrar 4 registros
    );
end SimpleRISCV;

architecture Behavioral of SimpleRISCV is
    -- Componentes
    component SimpleControlUnit
        Port (
            opcode   : in  STD_LOGIC_VECTOR(6 downto 0);
            RegWrite : out STD_LOGIC;
            ALUSrc   : out STD_LOGIC
        );
    end component;
    
    component SimpleALU
        Port (
            A      : in  STD_LOGIC_VECTOR(1 downto 0);
            B      : in  STD_LOGIC_VECTOR(1 downto 0);
            Result : out STD_LOGIC_VECTOR(1 downto 0);
            Carry  : out STD_LOGIC
        );
    end component;
    
    component SimpleRegFile
        Port (
            clk      : in  STD_LOGIC;
            we       : in  STD_LOGIC;
            wr_addr  : in  STD_LOGIC_VECTOR(1 downto 0);
            rd_addr1 : in  STD_LOGIC_VECTOR(1 downto 0);
            rd_addr2 : in  STD_LOGIC_VECTOR(1 downto 0);
            wr_data  : in  STD_LOGIC_VECTOR(1 downto 0);
            rd_data1 : out STD_LOGIC_VECTOR(1 downto 0);
            rd_data2 : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
    
    -- Señales internas
    signal RegWrite, ALUSrc : STD_LOGIC;
    signal reg_data1, reg_data2 : STD_LOGIC_VECTOR(1 downto 0);
    signal alu_input2, alu_result : STD_LOGIC_VECTOR(1 downto 0);
    signal immediate : STD_LOGIC_VECTOR(1 downto 0);
    
    -- Decodificación de instrucción simplificada
    signal opcode : STD_LOGIC_VECTOR(6 downto 0);
    signal rs1, rs2, rd : STD_LOGIC_VECTOR(1 downto 0);
    
begin
    -- Decodificación simple de la instrucción
    opcode <= instruction(6 downto 0);
    rs1 <= instruction(9 downto 8);
    rs2 <= instruction(11 downto 10);
    rd <= instruction(13 downto 12);
    immediate <= instruction(15 downto 14);
    
    -- Instanciación de componentes
    U_CONTROL: SimpleControlUnit
        port map (
            opcode   => opcode,
            RegWrite => RegWrite,
            ALUSrc   => ALUSrc
        );
    
    U_REGFILE: SimpleRegFile
        port map (
            clk      => clk,
            we       => RegWrite,
            wr_addr  => rd,
            rd_addr1 => rs1,
            rd_addr2 => rs2,
            wr_data  => alu_result,
            rd_data1 => reg_data1,
            rd_data2 => reg_data2
        );
    
    U_ALU: SimpleALU
        port map (
            A      => reg_data1,
            B      => alu_input2,
            Result => alu_result,
            Carry  => carry_out
        );
    
    -- MUX para seleccionar fuente de ALU
    alu_input2 <= immediate when ALUSrc = '1' else reg_data2;
    
    -- Salidas
    result_out <= alu_result;
    
    -- Para mostrar contenido de registros en displays
    reg_display <= reg_data1 & reg_data2 & alu_result & "00";
    
end Behavioral;