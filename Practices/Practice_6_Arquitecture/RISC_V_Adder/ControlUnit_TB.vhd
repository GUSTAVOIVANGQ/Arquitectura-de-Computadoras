library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ControlUnit_TB is
end ControlUnit_TB;

architecture Behavioral of ControlUnit_TB is
    component ControlUnit
        Port (
            opcode : in  STD_LOGIC_VECTOR(6 downto 0);
            RegWrite : out STD_LOGIC;
            ALUSrc : out STD_LOGIC;
            MemWrite : out STD_LOGIC;
            MemRead : out STD_LOGIC;
            MemtoReg : out STD_LOGIC;
            Branch : out STD_LOGIC;
            ALUOp : out STD_LOGIC_VECTOR(1 downto 0);
            Jump : out STD_LOGIC
        );
    end component;

    signal opcode : STD_LOGIC_VECTOR(6 downto 0);
    signal RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, Branch, Jump : STD_LOGIC;
    signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);

begin
    uut: ControlUnit port map (
        opcode => opcode,
        RegWrite => RegWrite,
        ALUSrc => ALUSrc,
        MemWrite => MemWrite,
        MemRead => MemRead,
        MemtoReg => MemtoReg,
        Branch => Branch,
        ALUOp => ALUOp,
        Jump => Jump
    );

    stim_proc: process
    begin
        -- Test instrucción tipo R
        opcode <= "0110011";
        wait for 10 ns;
        
        -- Test LW
        opcode <= "0000011";
        wait for 10 ns;
        
        -- Test SW
        opcode <= "0100011";
        wait for 10 ns;
        
        -- Test BEQ
        opcode <= "1100011";
        wait for 10 ns;
        
        -- Test JAL
        opcode <= "1101111";
        wait for 10 ns;
        
        -- Test ADDI (operación inmediata)
        opcode <= "0010011";
        wait for 10 ns;
        
        -- Test instrucción no definida
        opcode <= "1111111";
        wait for 10 ns;
        
        wait;
    end process;
end Behavioral;