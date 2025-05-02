library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stack_8bit is
    generic (
        WIDTH : integer := 8;   -- Ancho de datos
        DEPTH : integer := 4    -- Profundidad de la pila (para 2-3 valores)
    );
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        push    : in  std_logic;  -- Señal para hacer push
        pop     : in  std_logic;  -- Señal para hacer pop
        peek    : in  std_logic;  -- Señal para hacer peek
        data_in : in  std_logic_vector(WIDTH-1 downto 0);
        data_out: out std_logic_vector(WIDTH-1 downto 0);
        empty   : out std_logic;  -- Indica si la pila está vacía
        full    : out std_logic   -- Indica si la pila está llena
    );
end entity stack_8bit;

architecture behavioral of stack_8bit is
    type stack_array is array (0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
    signal stack : stack_array;
    signal stack_ptr : integer range 0 to DEPTH-1 := 0;
    signal empty_signal, full_signal : std_logic;
begin
    -- Proceso principal de la pila
    stack_process: process(clk, reset)
    begin
        if reset = '1' then
            stack <= (others => (others => '0'));
            stack_ptr <= 0;
        elsif rising_edge(clk) then
            -- Operación push tiene prioridad sobre pop si ambas están activas
            if push = '1' and full_signal = '0' then
                stack(stack_ptr) <= data_in;
                if stack_ptr < DEPTH-1 then
                    stack_ptr <= stack_ptr + 1;
                end if;
            elsif pop = '1' and empty_signal = '0' then
                if stack_ptr > 0 then
                    stack_ptr <= stack_ptr - 1;
                end if;
            end if;
        end if;
    end process;
    
    -- Lógica para empty y full
    empty_signal <= '1' when stack_ptr = 0 else '0';
    full_signal <= '1' when stack_ptr = DEPTH-1 else '0';
    empty <= empty_signal;
    full <= full_signal;
    
    -- Salida de datos (peek o pop)
    data_out <= stack(stack_ptr-1) when (peek = '1' or pop = '1') and empty_signal = '0' 
                else (others => '0');
end architecture behavioral;