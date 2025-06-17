library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        RegWrite : in STD_LOGIC;
        rs1 : in STD_LOGIC_VECTOR(1 downto 0);  -- Dirección registro fuente 1
        rs2 : in STD_LOGIC_VECTOR(1 downto 0);  -- Dirección registro fuente 2
        rd : in STD_LOGIC_VECTOR(1 downto 0);   -- Dirección registro destino
        WriteData : in STD_LOGIC_VECTOR(1 downto 0);  -- Dato a escribir
        ReadData1 : out STD_LOGIC_VECTOR(1 downto 0); -- Dato leído 1
        ReadData2 : out STD_LOGIC_VECTOR(1 downto 0)  -- Dato leído 2
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    type RegArray is array (0 to 3) of STD_LOGIC_VECTOR(1 downto 0);
    signal registers : RegArray;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Inicializar registros (opcional)
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if RegWrite = '1' then
                registers(to_integer(unsigned(rd))) <= WriteData;
            end if;
        end if;
    end process;
    
    -- Lectura asíncrona
    ReadData1 <= registers(to_integer(unsigned(rs1)));
    ReadData2 <= registers(to_integer(unsigned(rs2)));
end Behavioral;