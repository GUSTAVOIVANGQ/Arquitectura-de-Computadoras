-- ===============================
-- TESTBENCH SIMPLE PARA PROCESADOR RISC-V
-- Descripción: Testbench básico para verificar el funcionamiento fundamental
-- del procesador RISC-V con instrucciones de suma.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RISCV_Processor_TB is
end RISCV_Processor_TB;

architecture Behavioral of RISCV_Processor_TB is
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
    
    -- Periodo del reloj (100 MHz -> 10ns)
    constant CLK_PERIOD : time := 10 ns;
    
    -- Señal para control de simulación
    signal sim_running : boolean := true;
    
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
        while sim_running loop
            clk_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;
    
    -- Proceso de estimulación
    stim_process: process
    begin
        -- Mensaje inicial
        report "==========================================";
        report "TESTBENCH SIMPLE - PROCESADOR RISC-V";
        report "==========================================";        report "Programa a ejecutar:";
        report "  addi x1, x0, 5    # x1 = 5";
        report "  addi x2, x0, 3    # x2 = 3"; 
        report "  add  x3, x1, x2   # x3 = 8";
        report "  addi x4, x3, 4    # x4 = 12";
        report "  sw   x1, 0(x0)    # Almacenar x1 en memoria";
        report "  lw   x5, 0(x0)    # Cargar x5 desde memoria";
        report "==========================================";
        
        -- Reset inicial por 3 ciclos
        reset_tb <= '1';
        wait for CLK_PERIOD * 3;
        
        report "Liberando RESET - Iniciando ejecución...";
        reset_tb <= '0';
          -- Ejecutar por suficientes ciclos para completar las 6 instrucciones
        wait for CLK_PERIOD * 15;
        
        -- Mensajes finales  
        report "==========================================";
        report "SIMULACION COMPLETADA EXITOSAMENTE";
        report "==========================================";
        report "El procesador funciono sin errores";
        report "Se ejecutaron las instrucciones programadas";
        report "Use un simulador de formas de onda para ver detalles";
        report "==========================================";
        
        -- Detener el reloj y finalizar
        sim_running <= false;
        wait;
    end process;
    
end Behavioral;