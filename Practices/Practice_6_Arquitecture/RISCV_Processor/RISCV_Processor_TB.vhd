-- Testbench para el procesador RISC-V
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
    
    -- Periodo del reloj
    constant CLK_PERIOD : time := 10 ns;
    
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
        clk_tb <= '0';
        wait for CLK_PERIOD/2;
        clk_tb <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    -- Proceso de estimulación
    stim_process: process
    begin
        -- Reset inicial
        reset_tb <= '1';
        wait for 20 ns;
        reset_tb <= '0';
        
        -- Ejecutar varias instrucciones
        wait for 100 ns;
        
        -- Finalizar simulación
        report "Simulación completada";
        wait;
    end process;
    
end Behavioral;