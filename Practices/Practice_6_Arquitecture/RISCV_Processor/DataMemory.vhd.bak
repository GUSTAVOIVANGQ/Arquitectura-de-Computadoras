-- ===============================
-- MEMORIA DE DATOS
-- Descripción: Memoria de lectura y escritura para operaciones load/store. Aunque en
-- este diseño básico no se usan estas instrucciones, el componente está listo para
-- futuras expansiones. Funciona de forma síncrona para escritura y asíncrona para lectura.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DataMemory is
    Port (
        clk      : in  STD_LOGIC; -- Reloj para operaciones síncronas
        addr     : in  STD_LOGIC_VECTOR(31 downto 0); -- Dirección de memoria
        wr_data  : in  STD_LOGIC_VECTOR(31 downto 0); -- Dato a escribir
        MemRead  : in  STD_LOGIC; -- Señal de habilitación de lectura
        MemWrite : in  STD_LOGIC; -- Señal de habilitación de escritura
        rd_data  : out STD_LOGIC_VECTOR(31 downto 0)  -- Dato leído
    );
end DataMemory;

architecture Behavioral of DataMemory is
    -- Definición del tipo de memoria (256 palabras de 32 bits)
    type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    signal memory : mem_array := (others => x"00000000"); -- Inicializada en ceros
begin
    -- Proceso síncrono para escritura
    process(clk)
    begin
        if rising_edge(clk) then
            if MemWrite = '1' then -- Solo escribir si está habilitado
                memory(to_integer(unsigned(addr(9 downto 2)))) <= wr_data;
            end if;
        end if;
    end process;
    
    -- Lectura asíncrona (combinacional)
    rd_data <= memory(to_integer(unsigned(addr(9 downto 2)))) when MemRead = '1' 
               else x"00000000";
end Behavioral;