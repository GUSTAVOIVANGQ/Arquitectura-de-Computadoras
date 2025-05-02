library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stack_8bit is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        push    : in  STD_LOGIC;
        pop     : in  STD_LOGIC;
        peek    : in  STD_LOGIC;
        data_in : in  STD_LOGIC_VECTOR(7 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0);
        full    : out STD_LOGIC;
        empty   : out STD_LOGIC
    );
end stack_8bit;

architecture Behavioral of stack_8bit is
    type stack_type is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
    signal stack : stack_type := (others => (others => '0'));
    signal pointer : integer range 0 to 7 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            stack <= (others => (others => '0'));
            pointer <= 0;
        elsif rising_edge(clk) then
            if push = '1' and pointer < 7 then
                stack(pointer) <= data_in;
                pointer <= pointer + 1;
            elsif pop = '1' and pointer > 0 then
                pointer <= pointer - 1;
            end if;
        end if;
    end process;

    -- Operación peek (lectura sin modificar el puntero)
    data_out <= stack(pointer-1) when peek = '1' and pointer > 0 else
                (others => '0');
    
    -- Indicadores de estado
    full <= '1' when pointer = 7 else '0';
    empty <= '1' when pointer = 0 else '0';
end Behavioral;