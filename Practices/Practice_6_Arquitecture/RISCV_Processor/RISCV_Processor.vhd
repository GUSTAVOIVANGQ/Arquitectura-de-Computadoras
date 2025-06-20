-- ===============================
-- PROCESADOR RISC-V MONOCICLO
-- Descripción: Módulo principal que integra todos los componentes del procesador RISC-V
-- monociclo. Implementa la ruta de datos completa desde la búsqueda de instrucciones
-- hasta la escritura de resultados. Cada instrucción se ejecuta en un solo ciclo de reloj.
-- 
-- RUTA DE DATOS IMPLEMENTADA:
-- 1. FETCH: PC → Instruction Memory → Instruction
-- 2. DECODE: Instruction → Control Unit → Control Signals
--            Instruction → Register File → Operands
--            Instruction → Immediate Generator → Immediate Value
-- 3. EXECUTE: Operands → ALU → Result
-- 4. WRITEBACK: ALU Result → Register File (Write Data)
--
-- El procesador soporta instrucciones R-type (ADD) e I-type (ADDI) con operaciones de suma.
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
    -- Cada componente representa una etapa o función específica en la ruta de datos
    -- ===============================
    
    -- COMPONENTE 1: UNIDAD DE CONTROL
    -- Ubicación en ruta de datos: DECODE
    -- Función: Decodifica el opcode y genera todas las señales de control necesarias
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
    
    -- COMPONENTE 2: UNIDAD ARITMÉTICO-LÓGICA (ALU)
    -- Ubicación en ruta de datos: EXECUTE
    -- Función: Realiza operaciones aritméticas y lógicas entre dos operandos
    component ALU
        Port (
            A        : in  STD_LOGIC_VECTOR(31 downto 0);
            B        : in  STD_LOGIC_VECTOR(31 downto 0);
            ALUCtrl  : in  STD_LOGIC_VECTOR(3 downto 0);
            Result   : out STD_LOGIC_VECTOR(31 downto 0);
            Zero     : out STD_LOGIC
        );
    end component;
    
    -- COMPONENTE 3: CONTROL DE ALU
    -- Ubicación en ruta de datos: DECODE/EXECUTE
    -- Función: Decodifica ALUOP + funct3 + funct7 para generar señal específica de ALU
    component ALUControl
        Port (
            ALUOP    : in  STD_LOGIC_VECTOR(1 downto 0);
            funct7   : in  STD_LOGIC_VECTOR(6 downto 0);
            funct3   : in  STD_LOGIC_VECTOR(2 downto 0);
            ALUCtrl  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    -- COMPONENTE 4: MEMORIA DE INSTRUCCIONES
    -- Ubicación en ruta de datos: FETCH
    -- Función: Almacena las instrucciones del programa y las entrega según el PC
    component InstructionMemory
        Port (
            addr : in  STD_LOGIC_VECTOR(31 downto 0);
            inst : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    
    -- COMPONENTE 5: MEMORIA DE DATOS
    -- Ubicación en ruta de datos: MEMORY ACCESS (no usado en esta versión)
    -- Función: Almacena datos para instrucciones load/store (futuras expansiones)
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
    
    -- COMPONENTE 6: GENERADOR DE INMEDIATOS
    -- Ubicación en ruta de datos: DECODE
    -- Función: Extrae y extiende con signo los valores inmediatos de las instrucciones
    component ImmGen
        Port (
            inst : in  STD_LOGIC_VECTOR(31 downto 0);
            imm  : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    
    -- COMPONENTE 7: ARCHIVO DE REGISTROS
    -- Ubicación en ruta de datos: DECODE (lectura) y WRITEBACK (escritura)
    -- Función: Banco de 32 registros que proporciona operandos y almacena resultados
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
    -- Conectan los diferentes componentes siguiendo el flujo de datos
    -- ===============================
    
    -- ETAPA FETCH: Señales del Program Counter y búsqueda de instrucciones
    signal PC : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";        -- Program Counter actual
    signal PC_next : STD_LOGIC_VECTOR(31 downto 0);                  -- Siguiente valor del PC
    signal instruction : STD_LOGIC_VECTOR(31 downto 0);              -- Instrucción actual
    
    -- ETAPA DECODE: Señales de decodificación y lectura de operandos
    signal immediate : STD_LOGIC_VECTOR(31 downto 0);                -- Valor inmediato extendido
    signal reg_data1, reg_data2 : STD_LOGIC_VECTOR(31 downto 0);     -- Datos leídos de registros
    
    -- ETAPA EXECUTE: Señales de ejecución en la ALU
    signal alu_input2 : STD_LOGIC_VECTOR(31 downto 0);               -- Segundo operando de ALU (MUX)
    signal alu_result : STD_LOGIC_VECTOR(31 downto 0);               -- Resultado de la ALU
    signal alu_ctrl : STD_LOGIC_VECTOR(3 downto 0);                  -- Control específico de ALU
    
    -- ETAPA MEMORY: Señales de acceso a memoria (no usado en esta versión)
    signal mem_data : STD_LOGIC_VECTOR(31 downto 0);                 -- Dato leído de memoria
    
    -- ETAPA WRITEBACK: Señales de escritura de resultados
    signal write_data : STD_LOGIC_VECTOR(31 downto 0);               -- Dato a escribir en registro
    
    -- SEÑALES DE CONTROL: Generadas por la unidad de control
    signal RegWrite, ALUSrc, MemRead, MemWrite, MemToReg, Branch, Jump : STD_LOGIC;
    signal ALUOP : STD_LOGIC_VECTOR(1 downto 0);
    signal Zero : STD_LOGIC;                                          -- Bandera Zero de la ALU
    
begin
    -- ===============================
    -- ETAPA 1: FETCH (BÚSQUEDA DE INSTRUCCIONES)
    -- Actualización del Program Counter y búsqueda de la siguiente instrucción
    -- ===============================
    
    -- PROGRAM COUNTER: Registro que mantiene la dirección de la instrucción actual
    -- Se incrementa en 4 cada ciclo (direcciones de palabra en RISC-V)
    process(clk, reset)
    begin
        if reset = '1' then
            PC <= x"00000000";  -- Inicializar PC en dirección 0
        elsif rising_edge(clk) then
            PC <= PC_next;      -- Cargar siguiente dirección
        end if;
    end process;
    
    -- CÁLCULO DE PRÓXIMO PC: En este diseño básico siempre PC + 4
    -- (Sin saltos implementados en esta versión)
    PC_next <= std_logic_vector(unsigned(PC) + 4);
    
    -- ===============================
    -- INSTANCIACIÓN DE COMPONENTES EN ORDEN DE RUTA DE DATOS
    -- ===============================
    
    -- MEMORIA DE INSTRUCCIONES (FETCH)
    -- Entrada: PC (dirección)
    -- Salida: instruction (instrucción de 32 bits)
    -- Función: Busca la instrucción en la dirección indicada por PC
    U_IMEM: InstructionMemory
        port map (
            addr => PC,                    -- Dirección desde PC
            inst => instruction            -- Instrucción obtenida
        );
    
    -- UNIDAD DE CONTROL (DECODE)
    -- Entrada: opcode (bits 6:0 de la instrucción)
    -- Salidas: Todas las señales de control
    -- Función: Decodifica el tipo de instrucción y activa las rutas de datos apropiadas
    U_CONTROL: ControlUnit
        port map (
            opcode   => instruction(6 downto 0),    -- Opcode de la instrucción
            RegWrite => RegWrite,                   -- Habilitar escritura en registro
            ALUSrc   => ALUSrc,                     -- Seleccionar fuente de ALU
            MemRead  => MemRead,                    -- Habilitar lectura de memoria
            MemWrite => MemWrite,                   -- Habilitar escritura de memoria
            MemToReg => MemToReg,                   -- Seleccionar fuente de write-back
            Branch   => Branch,                     -- Señal de branch
            Jump     => Jump,                       -- Señal de jump
            ALUOP    => ALUOP                       -- Tipo de operación ALU
        );
    
    -- ARCHIVO DE REGISTROS (DECODE para lectura, WRITEBACK para escritura)
    -- Entradas: direcciones rs1, rs2, rd y dato a escribir
    -- Salidas: datos de rs1 y rs2
    -- Función: Proporciona operandos y almacena resultados
    U_REGFILE: RegisterFile_32bit
        port map (
            clk      => clk,                        -- Reloj para escritura síncrona
            we       => RegWrite,                   -- Habilitación de escritura (de Control Unit)
            wr_addr  => instruction(11 downto 7),   -- rd: registro destino
            rd_addr1 => instruction(19 downto 15),  -- rs1: primer operando
            rd_addr2 => instruction(24 downto 20),  -- rs2: segundo operando
            wr_data  => write_data,                 -- Dato a escribir (de MUX final)
            rd_data1 => reg_data1,                  -- Primer operando leído
            rd_data2 => reg_data2                   -- Segundo operando leído
        );
    
    -- GENERADOR DE INMEDIATOS (DECODE)
    -- Entrada: instrucción completa
    -- Salida: valor inmediato extendido a 32 bits
    -- Función: Extrae inmediatos según el tipo de instrucción y los extiende con signo
    U_IMMGEN: ImmGen
        port map (
            inst => instruction,                    -- Instrucción completa
            imm  => immediate                       -- Inmediato extendido
        );
    
    -- CONTROL DE ALU (DECODE/EXECUTE)
    -- Entradas: ALUOP, funct3, funct7
    -- Salida: código específico de operación ALU
    -- Función: Decodifica la operación específica que debe realizar la ALU
    U_ALUCONTROL: ALUControl
        port map (
            ALUOP   => ALUOP,                       -- Código general de ALU (de Control Unit)
            funct7  => instruction(31 downto 25),   -- Campo funct7 de la instrucción
            funct3  => instruction(14 downto 12),   -- Campo funct3 de la instrucción
            ALUCtrl => alu_ctrl                     -- Código específico para ALU
        );
    
    -- UNIDAD ARITMÉTICO-LÓGICA (EXECUTE)
    -- Entradas: dos operandos de 32 bits y código de control
    -- Salidas: resultado y bandera Zero
    -- Función: Realiza la operación aritmética/lógica especificada
    U_ALU: ALU
        port map (
            A       => reg_data1,                   -- Primer operando (siempre rs1)
            B       => alu_input2,                  -- Segundo operando (rs2 o inmediato)
            ALUCtrl => alu_ctrl,                    -- Código de operación específica
            Result  => alu_result,                  -- Resultado de la operación
            Zero    => Zero                         -- Bandera: '1' si resultado es cero
        );
    
    -- MEMORIA DE DATOS (MEMORY ACCESS)
    -- Aunque no se usa en esta versión, está instanciada para futuras expansiones
    -- Función: Maneja operaciones load/store cuando se implementen
    U_DMEM: DataMemory
        port map (
            clk      => clk,                        -- Reloj para escritura síncrona
            addr     => alu_result,                 -- Dirección (resultado de ALU)
            wr_data  => reg_data2,                  -- Dato a escribir (rs2)
            MemRead  => MemRead,                    -- Habilitación de lectura
            MemWrite => MemWrite,                   -- Habilitación de escritura
            rd_data  => mem_data                    -- Dato leído
        );
    
    -- ===============================
    -- MULTIPLEXORES DE LA RUTA DE DATOS
    -- Implementan las decisiones de enrutamiento basadas en señales de control
    -- ===============================
    
    -- MUX 1: SELECCIÓN DE SEGUNDO OPERANDO DE ALU (EXECUTE)
    -- Controla: ALUSrc (de Control Unit)
    -- Función: Selecciona entre rs2 (instrucciones R-type) o inmediato (instrucciones I-type)
    alu_input2 <= immediate when ALUSrc = '1' else reg_data2;
    
    -- MUX 2: SELECCIÓN DE DATO PARA WRITE-BACK (WRITEBACK)
    -- Controla: MemToReg (de Control Unit)
    -- Función: Selecciona entre resultado de ALU o dato de memoria como fuente de escritura
    -- En esta versión siempre usa ALU ya que no hay instrucciones load implementadas
    write_data <= mem_data when MemToReg = '1' else alu_result;
    
    -- ===============================
    -- RESUMEN DE FLUJO DE DATOS:
    -- 1. PC → Instruction Memory → Instruction
    -- 2. Instruction[6:0] → Control Unit → Control Signals
    -- 3. Instruction → Register File → reg_data1, reg_data2
    -- 4. Instruction → ImmGen → immediate
    -- 5. reg_data1 + (reg_data2 OR immediate) → ALU → alu_result
    -- 6. alu_result → Register File (write_data)
    -- 7. PC = PC + 4 (próximo ciclo)
    -- ===============================
    
end Behavioral;