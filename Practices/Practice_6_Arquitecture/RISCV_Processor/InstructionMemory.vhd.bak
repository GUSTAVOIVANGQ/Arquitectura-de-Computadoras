-- ===============================
-- MEMORIA DE INSTRUCCIONES
-- Descripción: Almacena las instrucciones del programa. Es una memoria de solo lectura
-- que contiene el código máquina a ejecutar. El PC (Program Counter) proporciona la
-- dirección y la memoria devuelve la instrucción de 32 bits correspondiente.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
    Port (
        addr : in  STD_LOGIC_VECTOR(31 downto 0); -- Dirección de la instrucción (PC)
        inst : out STD_LOGIC_VECTOR(31 downto 0)  -- Instrucción de 32 bits
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    -- Definición del tipo de memoria (256 instrucciones de 32 bits)
    type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    
    -- Inicialización de la memoria con un programa de prueba
    signal memory : mem_array := (
        -- Programa de ejemplo que demuestra ADD e ADDI
        0 => x"00500093",  -- addi x1, x0, 5     (x1 = 0 + 5 = 5)
        1 => x"00300113",  -- addi x2, x0, 3     (x2 = 0 + 3 = 3)
        2 => x"002081B3",  -- add  x3, x1, x2    (x3 = x1 + x2 = 8)
        3 => x"00418213",  -- addi x4, x3, 4     (x4 = x3 + 4 = 12)
        others => x"00000000" -- NOP para el resto de posiciones
    );
begin
    -- Lectura asíncrona: divide addr por 4 para obtener índice de palabra
    -- (Las direcciones van de 4 en 4: 0, 4, 8, 12...)
    inst <= memory(to_integer(unsigned(addr(9 downto 2))));
end Behavioral;

