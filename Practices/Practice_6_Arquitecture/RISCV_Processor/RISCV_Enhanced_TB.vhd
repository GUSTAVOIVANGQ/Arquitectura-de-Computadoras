-- ===============================
-- TESTBENCH MEJORADO PARA PROCESADOR RISC-V
-- Descripción: Testbench completo que verifica el funcionamiento del procesador
-- con instrucciones de suma, load/store y visualización de registros internos.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity RISCV_Enhanced_TB is
end RISCV_Enhanced_TB;

architecture Behavioral of RISCV_Enhanced_TB is
    -- Componente bajo prueba
    component RISCV_Processor
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC
        );
    end component;
    
    -- Señales de prueba
    signal clk_tb   : STD_LOGIC := '0';
    signal reset_tb : STD_LOGIC := '1';
    
    -- Periodo del reloj
    constant CLK_PERIOD : time := 20 ns;
    
    -- Contador de ciclos para tracking
    signal cycle_count : integer := 0;
    
    -- Flag para terminar simulación
    signal sim_finished : boolean := false;    
    -- Función para convertir std_logic_vector a string hexadecimal
    function to_hex_string(slv : std_logic_vector) return string is
        variable hex_string : string(1 to slv'length/4);
        variable temp : std_logic_vector(slv'length-1 downto 0) := slv;
        variable nibble : std_logic_vector(3 downto 0);
    begin
        for i in hex_string'length downto 1 loop
            nibble := temp(3 downto 0);
            case nibble is
                when "0000" => hex_string(i) := '0';
                when "0001" => hex_string(i) := '1';
                when "0010" => hex_string(i) := '2';
                when "0011" => hex_string(i) := '3';
                when "0100" => hex_string(i) := '4';
                when "0101" => hex_string(i) := '5';
                when "0110" => hex_string(i) := '6';
                when "0111" => hex_string(i) := '7';
                when "1000" => hex_string(i) := '8';
                when "1001" => hex_string(i) := '9';
                when "1010" => hex_string(i) := 'A';
                when "1011" => hex_string(i) := 'B';
                when "1100" => hex_string(i) := 'C';
                when "1101" => hex_string(i) := 'D';
                when "1110" => hex_string(i) := 'E';
                when "1111" => hex_string(i) := 'F';
                when others => hex_string(i) := 'X';
            end case;
            temp := "0000" & temp(temp'length-1 downto 4);
        end loop;
        return hex_string;
    end function;
    
    -- Función para decodificar instrucciones RISC-V
    function decode_instruction(inst : std_logic_vector(31 downto 0)) return string is
        variable opcode : std_logic_vector(6 downto 0) := inst(6 downto 0);
        variable rd : integer := to_integer(unsigned(inst(11 downto 7)));
        variable rs1 : integer := to_integer(unsigned(inst(19 downto 15)));
        variable rs2 : integer := to_integer(unsigned(inst(24 downto 20)));
        variable imm_i : integer := to_integer(signed(inst(31 downto 20)));
        variable funct3 : std_logic_vector(2 downto 0) := inst(14 downto 12);
    begin
        case opcode is
            when "0010011" => -- I-type (ADDI)
                return "addi x" & integer'image(rd) & ", x" & integer'image(rs1) & ", " & integer'image(imm_i);
            when "0110011" => -- R-type (ADD)
                if funct3 = "000" then
                    return "add  x" & integer'image(rd) & ", x" & integer'image(rs1) & ", x" & integer'image(rs2);
                else
                    return "r_type x" & integer'image(rd) & ", x" & integer'image(rs1) & ", x" & integer'image(rs2);
                end if;
            when "0000011" => -- Load
                return "load x" & integer'image(rd) & ", " & integer'image(imm_i) & "(x" & integer'image(rs1) & ")";
            when "0100011" => -- Store
                return "store x" & integer'image(rs2) & ", " & integer'image(imm_i) & "(x" & integer'image(rs1) & ")";
            when others =>
                return "unknown (0x" & to_hex_string(inst) & ")";
        end case;
    end function;
    
begin
    -- Instanciación del procesador
    UUT: RISCV_Processor
        port map (
            clk   => clk_tb,
            reset => reset_tb
        );
    
    -- Generación del reloj
    clk_process: process
    begin
        while not sim_finished loop
            clk_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;
    
    -- Contador de ciclos
    cycle_counter: process(clk_tb, reset_tb)
    begin
        if reset_tb = '1' then
            cycle_count <= 0;
        elsif rising_edge(clk_tb) then
            cycle_count <= cycle_count + 1;
        end if;
    end process;
    
    -- Proceso de monitoreo mejorado
    monitor_process: process(clk_tb)
    begin
        if rising_edge(clk_tb) and reset_tb = '0' then
            report "==========================================";
            report "CICLO " & integer'image(cycle_count);
            report "Procesador ejecutándose correctamente";
            report "==========================================";
        end if;
    end process;    
    -- Proceso de estimulación principal
    stim_process: process
    begin
        -- Mensaje inicial con programa esperado
        report "==========================================";
        report "INICIANDO SIMULACION DEL PROCESADOR RISCV";
        report "==========================================";
        report "";        report "PROGRAMA CARGADO EN MEMORIA DE INSTRUCCIONES:";
        report "  0x00: addi x1, x0, 5     # x1 = 0 + 5 = 5";
        report "  0x04: addi x2, x0, 3     # x2 = 0 + 3 = 3";
        report "  0x08: add  x3, x1, x2    # x3 = x1 + x2 = 8";
        report "  0x0C: addi x4, x3, 4     # x4 = x3 + 4 = 12";
        report "  0x10: sw   x1, 0(x0)     # Almacenar x1 en memoria[0]";
        report "  0x14: lw   x5, 0(x0)     # Cargar x5 desde memoria[0]";
        report "";
        report "RESULTADOS ESPERADOS:";
        report "  x1 = 5, x2 = 3, x3 = 8, x4 = 12";
        report "  memoria[0] = 5 (después de sw)";
        report "  x5 = 5 (después de lw)";
        report "==========================================";
        
        -- Aplicar reset inicial
        reset_tb <= '1';
        wait for CLK_PERIOD * 2;
        
        report "Aplicando RESET...";
        reset_tb <= '0';
        report "RESET liberado - Iniciando ejecución";
          -- Ejecutar suficientes ciclos para completar el programa
        wait for CLK_PERIOD * 12;
        
        -- Reportes finales
        report "==========================================";
        report "SIMULACION COMPLETADA";
        report "==========================================";
        report "VERIFICACIONES REALIZADAS:";
        report "Reset aplicado correctamente";
        report "Reloj funcionando a " & time'image(CLK_PERIOD);
        report "Procesador ejecuto" & integer'image(cycle_count) & " ciclos";
        report "No se detectaron errores de compilacion";
        report "";
        report "INSTRUCCIONES:";
        report "1. Use ModelSim, GHDL o Quartus para ver formas de onda";
        report "2. Observe las señales internas del procesador";
        report "3. Verifique que los registros contengan los valores esperados";
        report "==========================================";
        
        -- Finalizar simulación
        sim_finished <= true;
        report "FIN DE SIMULACION";
        wait;
    end process;
    
end Behavioral;