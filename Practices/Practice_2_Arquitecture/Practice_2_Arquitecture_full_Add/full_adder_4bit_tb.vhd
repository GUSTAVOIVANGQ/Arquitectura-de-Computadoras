library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_4bit_tb is
end full_adder_4bit_tb;

architecture Behavioral of full_adder_4bit_tb is
    component full_adder_4bit
        Port (
            a     : in  STD_LOGIC_VECTOR(3 downto 0);
            b     : in  STD_LOGIC_VECTOR(3 downto 0);
            cin   : in  STD_LOGIC;
            sum   : out STD_LOGIC_VECTOR(3 downto 0);
            cout  : out STD_LOGIC
        );
    end component;
    
    signal a, b, sum : STD_LOGIC_VECTOR(3 downto 0);
    signal cin, cout : STD_LOGIC;
    
begin
    UUT: full_adder_4bit port map (a, b, cin, sum, cout);
    
    process
    begin
        -- Test Case 1: Simple addition without carry
        a <= "0001";  -- 1
        b <= "0010";  -- 2
        cin <= '0';
        wait for 10 ns;
        
        -- Test Case 2: Addition with carry-in
        a <= "0001";  -- 1
        b <= "0010";  -- 2
        cin <= '1';
        wait for 10 ns;
        
        -- Test Case 3: Addition with carry propagation
        a <= "1111";  -- 15
        b <= "0001";  -- 1
        cin <= '0';
        wait for 10 ns;
        
        -- Test Case 4: Overflow case
        a <= "1000";  -- 8
        b <= "1000";  -- 8
        cin <= '0';
        wait for 10 ns;
        
        wait;
    end process;
end Behavioral;