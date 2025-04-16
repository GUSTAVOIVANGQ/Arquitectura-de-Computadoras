-- ROM_16x8.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_16x8 is
    Port (
        clk      : in  STD_LOGIC;
        addr     : in  STD_LOGIC_VECTOR(3 downto 0); -- 4 bits que selecciona 1 de las 16 direcciones
        data_out : out STD_LOGIC_VECTOR(7 downto 0)  -- dato de 8 bits
    );
end ROM_16x8;

architecture Behavioral of ROM_16x8 is
    -- Declaración de la ROM
    type rom_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    
    -- La señal memoria_rom contiene los datos predefinidos
    signal memoria_rom : rom_array := (
        0  => x"01",
        1  => x"02",
        2  => x"03",
        3  => x"04",
        4  => x"05",
        5  => x"06",
        6  => x"07",
        7  => x"08",
        8  => x"09",
        9  => x"0A",
        10 => x"0B",
        11 => x"0C",
        12 => x"0D",
        13 => x"0E",
        14 => x"0F",
        15 => x"10"
    ); 
    
    -- Forzar implementación distribuida (en LUTs)
    attribute rom_style : string;
    attribute rom_style of memoria_rom : signal is "distributed";
    
    signal dato_leido : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            dato_leido <= memoria_rom(to_integer(unsigned(addr)));
        end if;
    end process;
    
    data_out <= dato_leido;
end Behavioral;