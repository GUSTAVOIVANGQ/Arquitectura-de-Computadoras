-- ===============================
-- EXTENSOR DE INMEDIATOS
-- Descripción: Extrae y extiende con signo los valores inmediatos de las instrucciones.
-- Diferentes tipos de instrucción tienen el inmediato en diferentes posiciones y formatos.
-- Este módulo maneja la extracción y extensión de signo a 32 bits.
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ImmGen is
    Port (
        inst : in  STD_LOGIC_VECTOR(31 downto 0); -- Instrucción completa
        imm  : out STD_LOGIC_VECTOR(31 downto 0)  -- Inmediato extendido a 32 bits
    );
end ImmGen;

architecture Behavioral of ImmGen is
begin
    -- Proceso combinacional que extrae y extiende el inmediato
    process(inst)
    begin
        case inst(6 downto 0) is -- Decodificar basado en opcode
            -- I-type (ADDI, LOAD, etc.) - inmediato en bits [31:20]
            when "0010011" =>
                -- Extensión de signo: si bit 31 es '1', rellenar con '1's, sino con '0's
                if inst(31) = '1' then
                    imm <= x"FFFFF" & inst(31 downto 20); -- Extensión negativa
                else
                    imm <= x"00000" & inst(31 downto 20); -- Extensión positiva
                end if;
                
            when others => -- Tipos de instrucción no implementados
                imm <= x"00000000"; -- Inmediato cero por defecto
        end case;
    end process;
end Behavioral;