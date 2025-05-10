library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile_tb is
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is
    component RegisterFile
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
    end component;

    signal clk      : std_logic := '0';
    signal we       : std_logic := '0';
    signal wr_addr  : std_logic_vector(2 downto 0) := (others => '0');
    signal rd_addr1 : std_logic_vector(2 downto 0) := (others => '0');
    signal rd_addr2 : std_logic_vector(2 downto 0) := (others => '0');
    signal wr_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal rd_data1 : std_logic_vector(7 downto 0);
    signal rd_data2 : std_logic_vector(7 downto 0);

    constant clk_period : time := 10 ns;

begin
    uut: RegisterFile port map (
        clk => clk,
        we => we,
        wr_addr => wr_addr,
        rd_addr1 => rd_addr1,
        rd_addr2 => rd_addr2,
        wr_data => wr_data,
        rd_data1 => rd_data1,
        rd_data2 => rd_data2
    );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        -- Inicialización
        wait for 20 ns;
        
        -- Escritura en registro 0
        we <= '1';
        wr_addr <= "000";
        wr_data <= "10101010";
        wait for clk_period;
        
        -- Escritura en registro 5
        wr_addr <= "101";
        wr_data <= "11001100";
        wait for clk_period;
        
        we <= '0';
        
        -- Lectura de registros
        rd_addr1 <= "000";  -- Debería mostrar 10101010
        rd_addr2 <= "101";  -- Debería mostrar 11001100
        wait for clk_period;
        
        -- Cambiar lecturas
        rd_addr1 <= "101";
        rd_addr2 <= "000";
        wait for clk_period;
        
        -- Nueva escritura
        we <= '1';
        wr_addr <= "111";
        wr_data <= "11110000";
        wait for clk_period;
        
        we <= '0';
        rd_addr1 <= "111";
        wait for clk_period;
        
        wait;
    end process;
end Behavioral;