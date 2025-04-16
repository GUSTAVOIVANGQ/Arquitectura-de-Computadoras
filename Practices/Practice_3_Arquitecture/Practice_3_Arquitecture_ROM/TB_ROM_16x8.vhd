-- TB_ROM_16x8.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ROM_16x8 is
end TB_ROM_16x8;

architecture Behavioral of TB_ROM_16x8 is
    component ROM_16x8
        Port (
            clk      : in  STD_LOGIC;
            addr     : in  STD_LOGIC_VECTOR(3 downto 0);
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    signal clk_tb     : STD_LOGIC := '0';
    signal addr_tb    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_out_tb : STD_LOGIC_VECTOR(7 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;
begin
    uut: ROM_16x8
        Port Map (
            clk      => clk_tb,
            addr     => addr_tb,
            data_out => data_out_tb
        );
    
    clk_process : process
    begin
        while now < 200 ns loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    stim_proc : process
    begin
        -- Probar todas las direcciones de la ROM
        for i in 0 to 15 loop
            addr_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for CLK_PERIOD;
        end loop;
        
        -- Probar algunas direcciones aleatorias
        addr_tb <= "0101"; -- 5
        wait for CLK_PERIOD;
        
        addr_tb <= "1010"; -- 10
        wait for CLK_PERIOD;
        
        addr_tb <= "1111"; -- 15
        wait for CLK_PERIOD;
        
        wait;
    end process;
end Behavioral;