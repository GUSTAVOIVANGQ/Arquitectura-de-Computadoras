library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RISC_V_Adder_TB is
end RISC_V_Adder_TB;

architecture Behavioral of RISC_V_Adder_TB is
    component RISC_V_Adder
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            opcode : in STD_LOGIC_VECTOR(6 downto 0);
            rs1, rs2, rd : in STD_LOGIC_VECTOR(1 downto 0);
            immediate : in STD_LOGIC_VECTOR(1 downto 0);
            result : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    signal clk, reset : STD_LOGIC := '0';
    signal opcode : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal rs1, rs2, rd, immediate, result : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    
    constant CLK_PERIOD : time := 10 ns;
begin
    uut: RISC_V_Adder port map (
        clk => clk,
        reset => reset,
        opcode => opcode,
        rs1 => rs1,
        rs2 => rs2,
        rd => rd,
        immediate => immediate,
        result => result
    );
    
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    stim_proc: process
    begin
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        
        -- Configurar registro x1 con valor 1
        opcode <= "0010011"; -- ADDI
        rs1 <= "00";         -- x0 (siempre 0)
        rd <= "01";          -- x1
        immediate <= "01";   -- valor 1
        wait for CLK_PERIOD;
        
        -- Configurar registro x2 con valor 2
        opcode <= "0010011"; -- ADDI
        rs1 <= "00";         -- x0
        rd <= "10";          -- x2
        immediate <= "10";   -- valor 2
        wait for CLK_PERIOD;
        
        -- Sumar x1 + x2, resultado en x3
        opcode <= "0110011"; -- ADD
        rs1 <= "01";         -- x1
        rs2 <= "10";         -- x2
        rd <= "11";          -- x3
        wait for CLK_PERIOD;
        
        -- El resultado (3) debería estar en x3 y en la salida
        wait;
    end process;
end Behavioral;