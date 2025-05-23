library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Paquete para operaciones aritméticas con señales lógicas
use IEEE.NUMERIC_STD.ALL;

-- Definición de la entidad del archivo de registros
entity RegisterFile is
    Port (
        clk      : in  std_logic;        -- Señal de reloj para operaciones síncronas
        -- Señal de habilitación de escritura (Write Enable)
        -- '1' = escritura habilitada, '0' = escritura deshabilitada
        we       : in  std_logic;
        wr_addr  : in  std_logic_vector(2 downto 0);        -- Dirección de escritura (3 bits para seleccionar entre 8 registros)
        rd_addr1 : in  std_logic_vector(2 downto 0);        -- Dirección de lectura 1 (3 bits)
        rd_addr2 : in  std_logic_vector(2 downto 0);        -- Dirección de lectura 2 (3 bits)
        wr_data  : in  std_logic_vector(7 downto 0);        -- Dato de entrada para escritura (8 bits)
        rd_data1 : out std_logic_vector(7 downto 0);        -- Dato de salida 1 de lectura (8 bits)
        rd_data2 : out std_logic_vector(7 downto 0)         -- Dato de salida 2 de lectura (8 bits)
    );
end RegisterFile;

-- Implementación de la arquitectura del archivo de registros
architecture Behavioral of RegisterFile is
    -- Definición del tipo de dato para el banco de registros:
    -- Arreglo de 8 elementos de 8 bits cada uno
    type register_array is array (0 to 7) of std_logic_vector(7 downto 0);
    
    -- Señal que implementa el banco de registros
    -- Inicializado a ceros (todos los bits de todos los registros en '0')
    signal regs : register_array := (others => (others => '0'));

begin
    -- Proceso sensible al flanco de reloj para operaciones síncronas
    process(clk)
    begin
        -- Detección del flanco ascendente del reloj
        if rising_edge(clk) then
            -- Si la escritura está habilitada
            if we = '1' then
                -- Escribe el dato en el registro seleccionado
                -- Conversión de la dirección de std_logic_vector a entero
                regs(to_integer(unsigned(wr_addr))) <= wr_data;
            end if;
        end if;
    end process;
    
    -- Lectura asíncrona del primer puerto de lectura
    -- Conversión de la dirección a entero y selección del registro correspondiente
    rd_data1 <= regs(to_integer(unsigned(rd_addr1)));
    
    -- Lectura asíncrona del segundo puerto de lectura
    rd_data2 <= regs(to_integer(unsigned(rd_addr2)));
end Behavioral;