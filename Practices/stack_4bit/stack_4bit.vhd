library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stack_4bit is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        push    : in  STD_LOGIC;  -- Switch para push
        pop     : in  STD_LOGIC;  -- Switch para pop
        peek    : in  STD_LOGIC;  -- Switch para peek
        data_in : in  STD_LOGIC_VECTOR(3 downto 0);  -- Datos de entrada (4 switches)
        data_out: out STD_LOGIC_VECTOR(3 downto 0);   -- Datos de salida
        full    : out STD_LOGIC;  -- Indicador de pila llena
        empty   : out STD_LOGIC   -- Indicador de pila vacía
    );
end stack_4bit;

architecture Behavioral of stack_4bit is
    type stack_type is array (0 to 3) of STD_LOGIC_VECTOR(3 downto 0);
    signal stack : stack_type := (others => (others => '0'));
    signal pointer : integer range 0 to 3 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            stack <= (others => (others => '0'));
            pointer <= 0;
        elsif rising_edge(clk) then
            -- Operación push
            if push = '1' and pointer < 3 then
                stack(pointer) <= data_in;
                pointer <= pointer + 1;
            -- Operación pop
            elsif pop = '1' and pointer > 0 then
                pointer <= pointer - 1;
            end if;
        end if;
    end process;
    
    -- Salida peek (sin modificar el puntero)
    data_out <= stack(pointer-1) when peek = '1' and pointer > 0 else
                (others => '0') when peek = '1' else
                stack(pointer-1) when pointer > 0 else
                (others => '0');
    
    -- Indicadores de estado
    full <= '1' when pointer = 3 else '0';
    empty <= '1' when pointer = 0 else '0';
end Behavioral;