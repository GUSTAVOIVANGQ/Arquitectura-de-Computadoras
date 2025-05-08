library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stack_8bit is
    generic (
        WIDTH : integer := 8;   -- Ancho de dato
        DEPTH : integer := 16   -- Profundidad de la pila (ajustable)
    );
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        push     : in  std_logic;  -- Señal para hacer push
        pop      : in  std_logic;  -- Señal para hacer pop
        peek     : in  std_logic;  -- Señal para leer el tope sin modificar
        data_in  : in  std_logic_vector(WIDTH-1 downto 0);
        data_out : out std_logic_vector(WIDTH-1 downto 0);
        full     : out std_logic;  -- Indicador de pila llena
        empty    : out std_logic   -- Indicador de pila vacía
    );
end entity stack_8bit;

architecture behavioral of stack_8bit is
    type stack_array is array (0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
    signal stack : stack_array;
    signal pointer : integer range 0 to DEPTH-1 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Resetear la pila
            stack <= (others => (others => '0'));
            pointer <= 0;
            data_out <= (others => '0');
            full <= '0';
            empty <= '1';
        elsif rising_edge(clk) then
            -- Operación push
            if push = '1' and pointer < DEPTH-1 then
                stack(pointer) <= data_in;
                pointer <= pointer + 1;
                empty <= '0';
                if pointer = DEPTH-2 then
                    full <= '1';
                end if;
            
            -- Operación pop
            elsif pop = '1' and pointer > 0 then
                pointer <= pointer - 1;
                data_out <= stack(pointer-1);
                full <= '0';
                if pointer = 1 then
                    empty <= '1';
                end if;
            
            -- Operación peek
            elsif peek = '1' and pointer > 0 then
                data_out <= stack(pointer-1);
            end if;
        end if;
    end process;
end architecture behavioral;