library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
    Port (
        clk      : in  std_logic;
        we       : in  std_logic;
        wr_addr  : in  std_logic_vector(2 downto 0);
        rd_addr1 : in  std_logic_vector(2 downto 0);
        rd_addr2 : in  std_logic_vector(2 downto 0);
        wr_data  : in  std_logic_vector(7 downto 0);
        rd_data1 : out std_logic_vector(7 downto 0);
        rd_data2 : out std_logic_vector(7 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    type register_array is array (0 to 7) of std_logic_vector(7 downto 0);
    signal regs : register_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                regs(to_integer(unsigned(wr_addr))) <= wr_data;
            end if;
        end if;
    end process;
    
    rd_data1 <= regs(to_integer(unsigned(rd_addr1)));
    rd_data2 <= regs(to_integer(unsigned(rd_addr2)));
end Behavioral;