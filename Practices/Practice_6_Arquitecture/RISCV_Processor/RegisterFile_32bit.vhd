-- ===============================
-- ARCHIVO DE REGISTROS (Adaptado para RISC-V de 32 bits)
-- Descripción: Banco de 32 registros de 32 bits cada uno. Proporciona dos puertos de
-- lectura independientes y un puerto de escritura. El registro x0 siempre contiene
-- cero y no puede ser modificado (característica especial de RISC-V).
-- ===============================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile_32bit is
    Port (
        clk      : in  std_logic; -- Reloj para escritura síncrona
        we       : in  std_logic; -- Habilitación de escritura (Write Enable)
        wr_addr  : in  std_logic_vector(4 downto 0);  -- Dirección de escritura (5 bits = 32 registros)
        rd_addr1 : in  std_logic_vector(4 downto 0);  -- Dirección de lectura puerto 1
        rd_addr2 : in  std_logic_vector(4 downto 0);  -- Dirección de lectura puerto 2
        wr_data  : in  std_logic_vector(31 downto 0); -- Dato a escribir (32 bits)
        rd_data1 : out std_logic_vector(31 downto 0); -- Dato leído puerto 1
        rd_data2 : out std_logic_vector(31 downto 0)  -- Dato leído puerto 2
    );
end RegisterFile_32bit;

architecture Behavioral of RegisterFile_32bit is
    -- Definición del banco de registros: 32 registros de 32 bits
    type register_array is array (0 to 31) of std_logic_vector(31 downto 0);
    signal regs : register_array := (others => (others => '0')); -- Inicializado en ceros
begin
    -- Proceso síncrono para escritura
    process(clk)
    begin
        if rising_edge(clk) then
            -- Solo escribir si está habilitado Y no es el registro x0
            -- x0 en RISC-V siempre debe contener 0
            if we = '1' and wr_addr /= "00000" then
                regs(to_integer(unsigned(wr_addr))) <= wr_data;
            end if;
        end if;
    end process;
    
    -- Lectura asíncrona (combinacional) en ambos puertos
    rd_data1 <= regs(to_integer(unsigned(rd_addr1)));
    rd_data2 <= regs(to_integer(unsigned(rd_addr2)));
end Behavioral;