library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cla_4bit_tb is
end cla_4bit_tb;

architecture Behavioral of cla_4bit_tb is
    component cla_4bit
        Port (
            a    : in  STD_LOGIC_VECTOR(3 downto 0);
            b    : in  STD_LOGIC_VECTOR(3 downto 0);
            cin  : in  STD_LOGIC;
            sum  : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    signal a, b, sum : STD_LOGIC_VECTOR(3 downto 0);
    signal cin, cout : STD_LOGIC;
    
begin
    UUT: cla_4bit port map (a, b, cin, sum, cout);
    
    process
    begin
        -- Prueba 1: Suma simple sin acarreo de entrada
        a <= "0101"; -- 5
        b <= "0011"; -- 3
        cin <= '0';
        wait for 20 ns;
        
        -- Prueba 2: Suma con acarreo de entrada
        a <= "0101"; -- 5
        b <= "0011"; -- 3
        cin <= '1';  -- +1
        wait for 20 ns;
        
        -- Prueba 3: Generación de acarreo (suma que produce carry)
        a <= "1111"; -- 15
        b <= "0001"; -- 1
        cin <= '0';
        wait for 20 ns;
        
        -- Prueba 4: Propagación de acarreo a través de múltiples bits
        a <= "1000"; -- 8
        b <= "0111"; -- 7
        cin <= '0';
        wait for 20 ns;
        
        wait;
    end process;
    
end Behavioral;