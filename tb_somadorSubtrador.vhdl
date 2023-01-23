library ieee;
use ieee.std_logic_1164.all; 


ENTITY tb_somadorSubtrator IS
END tb_somadorSubtrator;

ARCHITECTURE arch OF tb_somadorSubtrator IS

    COMPONENT mux2x12
        PORT (
            a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            b : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            sel : IN STD_LOGIC;
            z : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            overflow : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT somador12bits
        PORT (
            a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            b : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            cin : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT subtrator12bits
        PORT (
            a1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            b1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            cin1 : IN STD_LOGIC;
            s1 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            cout1 : OUT STD_LOGIC
        );
    END COMPONENT;

    --Signal Somador
    SIGNAL a, b, s : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL cin, cout : STD_LOGIC;

    --Signal Subtrator
    SIGNAL a1, b1, s1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL cin1, cout1 : STD_LOGIC;

    --Signal Mux
    SIGNAL sel : STD_LOGIC;
    SIGNAL z : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL overflow : STD_LOGIC;

BEGIN
    --Instancia Somador
    u_somador12bits : somador12bits PORT MAP(
        a,
        b,
        cin,
        s,
        cout
    );

    --Instancia Subtrator
    u_subtrator12bits : subtrator12bits PORT MAP(
        a1,
        b1,
        cin1,
        s1,
        cout1
    );

    --Instancia Mux
    u_mux2x12 : mux2x12 PORT MAP(
        a,
        b,
        sel,
        z,
        overflow
    );
    u_teste: process
    begin

        --Teste Somador
        a <= "000000000000";
        b <= "111111111111";
        cin <= '0';
        sel <= '0';
        z <= s;
        overflow <= cout;
        wait for 4 ns;

        --Teste Subtrator
        a1 <= "000000000000";
        b1 <= "111111111111";
        cin1 <= '0';
        sel <= '1';
        z <= s1;
        overflow <= cout1;
        wait for 4 ns;
        wait;
    end process;


END arch; -- arch