-- RAM_Distribuida.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM_Distribuida is
    Port (
        clk      : in  STD_LOGIC;
        we       : in  STD_LOGIC;
        fila     : in  STD_LOGIC_VECTOR(9 downto 0);  -- 10 bits = 1024 filas
        columna  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4 bits = 16 columnas
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end RAM_Distribuida;

architecture Behavioral of RAM_Distribuida is
    -- Tipos de la RAM: 1024 filas × 16 columnas (8 bits por posición) → Total 16384 bytes
    type matriz_col is array (15 downto 0) of STD_LOGIC_VECTOR(7 downto 0); -- 16 columnas
    type matriz_ram is array (0 to 1023) of matriz_col; -- 1024 filas
    
    -- Declaración de la RAM
    signal memoria : matriz_ram := (others => (others => (others => '0'))); -- Inicialización
    
    -- Aquí se coloca el atributo si se requiere explícitamente indicar al sintetizador que
    -- implemente la RAM en LUTs (no en BRAM)
    attribute ram_style : string;
    attribute ram_style of memoria : signal is "distributed";
    
    signal dato_leido : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                memoria(to_integer(unsigned(fila)))(to_integer(unsigned(columna))) <= data_in;
            end if;
            dato_leido <= memoria(to_integer(unsigned(fila)))(to_integer(unsigned(columna)));
        end if;
    end process;
    
    data_out <= dato_leido;
end Behavioral;