library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stack_tb is
end entity stack_tb;

architecture test of stack_tb is
    component stack_8bit
        port (
            clk      : in  std_logic;
            reset    : in  std_logic;
            push     : in  std_logic;
            pop      : in  std_logic;
            peek     : in  std_logic;
            data_in  : in  std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0);
            full     : out std_logic;
            empty    : out std_logic
        );
    end component;
    
    -- Señales de prueba
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '1';
    signal push     : std_logic := '0';
    signal pop      : std_logic := '0';
    signal peek     : std_logic := '0';
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0);
    signal full     : std_logic;
    signal empty    : std_logic;
    
begin
    -- Instancia de la pila
    uut: stack_8bit
        port map (
            clk => clk,
            reset => reset,
            push => push,
            pop => pop,
            peek => peek,
            data_in => data_in,
            data_out => data_out,
            full => full,
            empty => empty
        );
    
    -- Generador de reloj
    clk <= not clk after 10 ns;
    
    -- Proceso de prueba
    process
    begin
        wait for 20 ns;
        reset <= '0';
        
        -- Test push
        data_in <= "00000001";
        push <= '1';
        wait for 20 ns;
        push <= '0';
        
        data_in <= "00000010";
        push <= '1';
        wait for 20 ns;
        push <= '0';
        
        -- Test peek
        peek <= '1';
        wait for 20 ns;
        peek <= '0';
        
        -- Test pop
        pop <= '1';
        wait for 20 ns;
        pop <= '0';
        
        wait;
    end process;
end architecture test;