-- TB_RAM_Distribuida.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_RAM_Distribuida is
end TB_RAM_Distribuida;

architecture Behavioral of TB_RAM_Distribuida is
    -- Component declaration (la unidad bajo prueba)
    component RAM_Distribuida
        Port (
            clk      : in  STD_LOGIC;
            we       : in  STD_LOGIC;
            fila     : in  STD_LOGIC_VECTOR(9 downto 0);
            columna  : in  STD_LOGIC_VECTOR(3 downto 0);
            data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    -- Señales para conectar al DUT
    signal clk_tb     : STD_LOGIC := '0';
    signal we_tb      : STD_LOGIC := '0';
    signal fila_tb    : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal columna_tb : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_in_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_out_tb : STD_LOGIC_VECTOR(7 downto 0);
    
    -- Clock period
    constant CLK_PERIOD : time := 10 ns;
begin
    -- Instancia de la memoria
    uut: RAM_Distribuida
        Port Map (
            clk      => clk_tb,
            we       => we_tb,
            fila     => fila_tb,
            columna  => columna_tb,
            data_in  => data_in_tb,
            data_out => data_out_tb
        );
    
    -- Generador de reloj
    clk_process : process
    begin
        while now < 200 ns loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Proceso de estimulación
    stim_proc : process
    begin
        -- Primer ciclo: escribir en fila 5, columna 3
        fila_tb <= std_logic_vector(to_unsigned(5, 10));
        columna_tb <= std_logic_vector(to_unsigned(3, 4));
        data_in_tb <= x"AB";
        we_tb <= '1';
        wait for CLK_PERIOD;
        
        -- Segundo ciclo: desactivar escritura, leer lo que hay
        we_tb <= '0';
        wait for CLK_PERIOD;
        
        -- Tercer ciclo: escribir otro valor en otra posición
        fila_tb <= std_logic_vector(to_unsigned(15, 10));
        columna_tb <= std_logic_vector(to_unsigned(7, 4));
        data_in_tb <= x"CD";
        we_tb <= '1';
        wait for CLK_PERIOD;
        
        -- Leer el valor que escribimos primero (fila 5, col 3)
        we_tb <= '0';
        fila_tb <= std_logic_vector(to_unsigned(5, 10));
        columna_tb <= std_logic_vector(to_unsigned(3, 4));
        wait for CLK_PERIOD;
        
        -- Leer el valor que escribimos después (fila 15, col 7)
        fila_tb <= std_logic_vector(to_unsigned(15, 10));
        columna_tb <= std_logic_vector(to_unsigned(7, 4));
        wait for CLK_PERIOD;
        
        -- Terminar simulación
        wait;
    end process;
end Behavioral;