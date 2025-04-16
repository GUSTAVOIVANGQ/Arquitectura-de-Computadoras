library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla_4bit is
    Port (
        a    : in  STD_LOGIC_VECTOR(3 downto 0);
        b    : in  STD_LOGIC_VECTOR(3 downto 0);
        cin  : in  STD_LOGIC;
        sum  : out STD_LOGIC_VECTOR(3 downto 0);
        cout : out STD_LOGIC
    );
end cla_4bit;

architecture Structural of cla_4bit is
    component pfa
        Port (
            a, b, cin : in  STD_LOGIC;
            s, p, g   : out STD_LOGIC
        );
    end component;
    
    component cla_logic
        Port (
            p    : in  STD_LOGIC_VECTOR(3 downto 0);
            g    : in  STD_LOGIC_VECTOR(3 downto 0);
            cin  : in  STD_LOGIC;
            c    : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    signal p, g : STD_LOGIC_VECTOR(3 downto 0);
    signal c    : STD_LOGIC_VECTOR(3 downto 0);
    signal carry_internal : STD_LOGIC_VECTOR(4 downto 0);
    
begin
    carry_internal(0) <= cin;
    
    -- Generate 4 PFA units
    GEN_PFA: for i in 0 to 3 generate
        PFA_X: pfa port map (
            a => a(i),
            b => b(i),
            cin => carry_internal(i),
            s => sum(i),
            p => p(i),
            g => g(i)
        );
    end generate GEN_PFA;
    
    -- Carry Look Ahead Logic
    CLA: cla_logic port map (
        p => p,
        g => g,
        cin => cin,
        c => carry_internal(4 downto 1),
        cout => cout
    );
end Structural;