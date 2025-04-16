library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_4bit is
    Port (
        a     : in  STD_LOGIC_VECTOR(3 downto 0);
        b     : in  STD_LOGIC_VECTOR(3 downto 0);
        cin   : in  STD_LOGIC;
        sum   : out STD_LOGIC_VECTOR(3 downto 0);
        cout  : out STD_LOGIC
    );
end full_adder_4bit;

architecture Structural of full_adder_4bit is
    component full_adder
        Port (
            a, b, cin : in  STD_LOGIC;
            sum, cout : out STD_LOGIC
        );
    end component;
    
    signal carry : STD_LOGIC_VECTOR(4 downto 0);
begin
    carry(0) <= cin;
    
    -- Instantiate 4 full adders
    GEN_FULL_ADDER: for i in 0 to 3 generate
        FA: full_adder port map (
            a => a(i),
            b => b(i),
            cin => carry(i),
            sum => sum(i),
            cout => carry(i+1)
        );
    end generate GEN_FULL_ADDER;
    
    cout <= carry(4);
end Structural;