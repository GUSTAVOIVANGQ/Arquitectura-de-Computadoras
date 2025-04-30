library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stack_tb is
end stack_tb;

architecture test of stack_tb is
    component stack_8bit
        port (
            clk     : in  std_logic;
            reset   : in  std_logic;
            push    : in  std_logic;
            pop     : in  std_logic;
            peek    : in  std_logic;
            data_in : in  std_logic_vector(7 downto 0);
            data_out: out std_logic_vector(7 downto 0);
            empty   : out std_logic;
            full    : out std_logic
        );
    end component;
    
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal push     : std_logic := '0';
    signal pop      : std_logic := '0';
    signal peek     : std_logic := '0';
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0);
    signal empty    : std_logic;
    signal full     : std_logic;
    
    constant CLK_PERIOD : time := 20 ns;
    
begin
    -- Instanciación de la unidad bajo prueba (UUT)
    uut: stack_8bit 
    port map (
        clk      => clk,
        reset    => reset,
        push     => push,
        pop      => pop,
        peek     => peek,
        data_in  => data_in,
        data_out => data_out,
        empty    => empty,
        full     => full
    );
    
    -- Generación de reloj
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    -- Proceso de estimulación
    stim_process: process
    begin
        -- Reset inicial
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD;
        
        -- Test 1: Push de 3 valores
        report "Test 1: Push de 3 valores";
        data_in <= "00000001";
        push <= '1';
        wait for CLK_PERIOD;
        push <= '0';
        wait for CLK_PERIOD;
        
        data_in <= "00000010";
        push <= '1';
        wait for CLK_PERIOD;
        push <= '0';
        wait for CLK_PERIOD;
        
        data_in <= "00000011";
        push <= '1';
        wait for CLK_PERIOD;
        push <= '0';
        wait for CLK_PERIOD;
        
        -- Test 2: Peek (debería mostrar 0x03)
        report "Test 2: Operación Peek";
        peek <= '1';
        wait for CLK_PERIOD;
        peek <= '0';
        wait for CLK_PERIOD;
        
        -- Test 3: Pop de 2 valores
        report "Test 3: Pop de 2 valores";
        pop <= '1';
        wait for CLK_PERIOD;
        pop <= '0';
        wait for CLK_PERIOD;
        
        pop <= '1';
        wait for CLK_PERIOD;
        pop <= '0';
        wait for CLK_PERIOD;
        
        -- Test 4: Intentar Pop cuando empty está activo
        report "Test 4: Pop con pila vacía";
        pop <= '1';
        wait for CLK_PERIOD;
        pop <= '0';
        wait for CLK_PERIOD;
        
        -- Test 5: Llenar la pila completamente
        report "Test 5: Llenar la pila";
        for i in 1 to 4 loop
            data_in <= std_logic_vector(to_unsigned(i, 8));
            push <= '1';
            wait for CLK_PERIOD;
            push <= '0';
            wait for CLK_PERIOD;
        end loop;
        
        -- Test 6: Intentar Push cuando full está activo
        report "Test 6: Push con pila llena";
        data_in <= "11111111";
        push <= '1';
        wait for CLK_PERIOD;
        push <= '0';
        wait for CLK_PERIOD;
        
        -- Finalizar simulación
        report "Simulación completada";
        wait;
    end process;
end test;