library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    process(opcode)
    begin
        -- Valores por defecto
        RegWrite <= '0';
        ALUSrc <= '0';
        MemWrite <= '0';
        MemRead <= '0';
        MemtoReg <= '0';
        Branch <= '0';
        ALUOp <= "00";
        Jump <= '0';
        
        case opcode is
            -- Instrucciones tipo R (ADD, SUB, AND, OR, etc.)
            when "0110011" => 
                RegWrite <= '1';
                ALUSrc <= '0';
                ALUOp <= "10";
            
            -- LW (load word)
            when "0000011" => 
                RegWrite <= '1';
                ALUSrc <= '1';
                MemRead <= '1';
                MemtoReg <= '1';
                ALUOp <= "00";
            
            -- SW (store word)
            when "0100011" => 
                ALUSrc <= '1';
                MemWrite <= '1';
                ALUOp <= "00";
            
            -- BEQ (branch equal)
            when "1100011" => 
                Branch <= '1';
                ALUOp <= "01";
            
            -- JAL (jump and link)
            when "1101111" => 
                RegWrite <= '1';
                Jump <= '1';
            
            -- Operaciones inmediatas (ADDI, ANDI, ORI, etc.)
            when "0010011" => 
                RegWrite <= '1';
                ALUSrc <= '1';
                ALUOp <= "11";
            
            -- Otras instrucciones pueden añadirse aquí
            when others =>
                -- Todas las señales permanecen en 0 (NOP)
        end case;
    end process;
end Behavioral;