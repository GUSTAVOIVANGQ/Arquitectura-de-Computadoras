library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stack_8bit_tb is
end stack_8bit_tb;

architecture Behavioral of stack_8bit_tb is
    component stack_8bit
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            push     : in  STD_LOGIC;
            pop      : in  STD_LOGIC;
            peek     : in  STD_LOGIC;
            data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
            data_out : out STD_LOGIC_VECTOR(7 downto 0);
            full     : out STD_LOGIC;
            empty    : out STD_LOGIC
        );
    end component;

    signal clk      : STD_LOGIC := '0';
    signal reset    : STD_LOGIC := '0';
    signal push     : STD_LOGIC := '0';
    signal pop      : STD_LOGIC := '0';
    signal peek     : STD_LOGIC := '0';
    signal data_in  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);
    signal full     : STD_LOGIC;
    signal empty    : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: stack_8bit port map (
        clk => clk,
        reset => reset,
        push => push,
        pop => pop,
        peek => peek,
        data_in => data_in,
        data_out => data_out,
        full => full,
        empty => empty
    );

    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
    begin
        -- Reset inicial
        reset <= '1';
        wait for CLK_PERIOD*2;
        reset <= '0';
        
        -- Test 1: Push de varios valores
        push <= '1';
        data_in <= "00000001"; wait for CLK_PERIOD;
        data_in <= "00000010"; wait for CLK_PERIOD;
        data_in <= "00000100"; wait for CLK_PERIOD;
        push <= '0';
        
        -- Test 2: Peek (debería mostrar 00000100 sin modificar la pila)
        peek <= '1'; wait for CLK_PERIOD;
        assert data_out = "00000100" report "Peek failed" severity error;
        peek <= '0'; wait for CLK_PERIOD;
        
        -- Test 3: Pop (debería sacar 00000100)
        pop <= '1'; wait for CLK_PERIOD;
        pop <= '0'; wait for CLK_PERIOD;
        
        -- Verificar con peek que ahora el tope es 00000010
        peek <= '1'; wait for CLK_PERIOD;
        assert data_out = "00000010" report "Pop failed" severity error;
        peek <= '0'; wait for CLK_PERIOD;
        
        -- Test 4: Llenar la pila
        push <= '1';
        for i in 0 to 4 loop
            data_in <= std_logic_vector(to_unsigned(i+3, 8));
            wait for CLK_PERIOD;
        end loop;
        push <= '0';
        
        -- Verificar señal full
        assert full = '1' report "Full signal failed" severity error;
        
        -- Test 5: Reset
        reset <= '1'; wait for CLK_PERIOD;
        reset <= '0'; wait for CLK_PERIOD;
        assert empty = '1' report "Reset failed" severity error;
        
        wait;
    end process;
end Behavioral;