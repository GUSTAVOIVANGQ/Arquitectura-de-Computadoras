-- ===============================
-- MEMORIA DE DATOS - VERSIÓN MEJORADA
-- Descripción: Memoria de lectura y escritura para operaciones load/store.
-- Soporta diferentes tamaños de datos (byte, halfword, word) y operaciones
-- con y sin extensión de signo. Incluye datos de prueba inicializados.
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
        funct3   : in  STD_LOGIC_VECTOR(2 downto 0);  -- Para determinar tamaño de operación
        rd_data  : out STD_LOGIC_VECTOR(31 downto 0)  -- Dato leído
    );
end DataMemory;

architecture Behavioral of DataMemory is
    -- Definición del tipo de memoria (1024 palabras de 32 bits = 4KB)
    type mem_array is array (0 to 1023) of STD_LOGIC_VECTOR(31 downto 0);
    
    -- Inicialización con algunos datos de prueba
    signal memory : mem_array := (
        0 => x"12345678",  -- Dato de prueba en dirección 0
        1 => x"9ABCDEF0",  -- Dato de prueba en dirección 4
        2 => x"FEDCBA98",  -- Dato de prueba en dirección 8
        3 => x"76543210",  -- Dato de prueba en dirección 12
        others => x"00000000"
    );
    
    signal word_addr : integer;
    signal read_data : STD_LOGIC_VECTOR(31 downto 0);
    
begin
    -- Conversión de dirección de byte a dirección de palabra
    word_addr <= to_integer(unsigned(addr(11 downto 2)));
    
    -- Proceso síncrono para escritura
    process(clk)
        variable byte_offset : integer;
        variable temp_data : STD_LOGIC_VECTOR(31 downto 0);
    begin
        if rising_edge(clk) then
            if MemWrite = '1' then
                byte_offset := to_integer(unsigned(addr(1 downto 0)));
                temp_data := memory(word_addr);
                
                case funct3 is
                    when "000" => -- SB (Store Byte)
                        case byte_offset is
                            when 0 => temp_data(7 downto 0) := wr_data(7 downto 0);
                            when 1 => temp_data(15 downto 8) := wr_data(7 downto 0);
                            when 2 => temp_data(23 downto 16) := wr_data(7 downto 0);
                            when 3 => temp_data(31 downto 24) := wr_data(7 downto 0);
                            when others => null;
                        end case;
                        memory(word_addr) <= temp_data;
                        
                    when "001" => -- SH (Store Halfword)
                        if byte_offset = 0 then
                            temp_data(15 downto 0) := wr_data(15 downto 0);
                        elsif byte_offset = 2 then
                            temp_data(31 downto 16) := wr_data(15 downto 0);
                        end if;
                        memory(word_addr) <= temp_data;
                        
                    when "010" => -- SW (Store Word)
                        memory(word_addr) <= wr_data;
                        
                    when others => -- Operaciones no válidas
                        null;
                end case;
            end if;
        end if;
    end process;
    
    -- Lectura asíncrona (combinacional)
    process(MemRead, addr, memory, funct3)
        variable byte_offset : integer;
        variable word_data : STD_LOGIC_VECTOR(31 downto 0);
    begin
        if MemRead = '1' then
            byte_offset := to_integer(unsigned(addr(1 downto 0)));
            word_data := memory(word_addr);
            
            case funct3 is                when "000" => -- LB (Load Byte con extensión de signo)
                    case byte_offset is
                        when 0 => 
                            if word_data(7) = '1' then
                                read_data <= x"FFFFFF" & word_data(7 downto 0);
                            else
                                read_data <= x"000000" & word_data(7 downto 0);
                            end if;
                        when 1 => 
                            if word_data(15) = '1' then
                                read_data <= x"FFFFFF" & word_data(15 downto 8);
                            else
                                read_data <= x"000000" & word_data(15 downto 8);
                            end if;
                        when 2 => 
                            if word_data(23) = '1' then
                                read_data <= x"FFFFFF" & word_data(23 downto 16);
                            else
                                read_data <= x"000000" & word_data(23 downto 16);
                            end if;
                        when 3 => 
                            if word_data(31) = '1' then
                                read_data <= x"FFFFFF" & word_data(31 downto 24);
                            else
                                read_data <= x"000000" & word_data(31 downto 24);
                            end if;
                        when others => read_data <= x"00000000";
                    end case;
                    
                when "001" => -- LH (Load Halfword con extensión de signo)
                    if byte_offset = 0 then
                        if word_data(15) = '1' then
                            read_data <= x"FFFF" & word_data(15 downto 0);
                        else
                            read_data <= x"0000" & word_data(15 downto 0);
                        end if;
                    elsif byte_offset = 2 then
                        if word_data(31) = '1' then
                            read_data <= x"FFFF" & word_data(31 downto 16);
                        else
                            read_data <= x"0000" & word_data(31 downto 16);
                        end if;
                    else
                        read_data <= x"00000000";
                    end if;
                    
                when "010" => -- LW (Load Word)
                    read_data <= word_data;
                    
                when "100" => -- LBU (Load Byte sin extensión de signo)
                    case byte_offset is
                        when 0 => read_data <= x"000000" & word_data(7 downto 0);
                        when 1 => read_data <= x"000000" & word_data(15 downto 8);
                        when 2 => read_data <= x"000000" & word_data(23 downto 16);
                        when 3 => read_data <= x"000000" & word_data(31 downto 24);
                        when others => read_data <= x"00000000";
                    end case;
                    
                when "101" => -- LHU (Load Halfword sin extensión de signo)
                    if byte_offset = 0 then
                        read_data <= x"0000" & word_data(15 downto 0);
                    elsif byte_offset = 2 then
                        read_data <= x"0000" & word_data(31 downto 16);
                    else
                        read_data <= x"00000000";
                    end if;
                    
                when others => -- Operaciones no válidas
                    read_data <= x"00000000";
            end case;
        else
            read_data <= x"00000000";
        end if;
    end process;
    
    rd_data <= read_data;
    
end Behavioral;