LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_somadorSubtrator IS
END tb_somadorSubtrator;

ARCHITECTURE arch OF tb_somadorSubtrator IS

    COMPONENT mux2x12
    port(
        c0: in std_logic_vector(11 downto 0);
        c1: in std_logic_vector(11 downto 0);
        sel: in std_logic;
        Z: out std_logic_vector(11 downto 0);
        overflow: out std_logic
    );
    END COMPONENT;

    COMPONENT somador12bits
        PORT (
            X, Y : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            cin : IN STD_LOGIC;
            Z : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT subtrator12bits
        PORT (
            a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            b : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            cin1 : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            cout1 : OUT STD_LOGIC
        );
    END COMPONENT;

    --Signal Somador
    SIGNAL x, y, z1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL cin, cout : STD_LOGIC;

    --Signal Subtrator
    SIGNAL a, b, s : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL cin1, cout1 : STD_LOGIC;

    --Signal Mux
    SIGNAL sel : STD_LOGIC;
    SIGNAL z : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL overflow : STD_LOGIC;

BEGIN
    --Instancia Somador
    u_somador12bits : somador12bits PORT MAP(
        x,
        y,
        cin,
        z1,
        cout
    );

    --Instancia Subtrator
    u_subtrator12bits : subtrator12bits PORT MAP(
        a,
        b,
        cin1,
        s,
        cout1
    );

    --Instancia Mux
    u_mux2x12 : mux2x12 PORT MAP(
        x,
        y,
        sel,
        z,
        overflow
    );
    u_teste : PROCESS
    BEGIN

        --Teste Somador
        x <= "000000000000";
        y <= "111111111111";
        cin <= '0';
        sel <= '0';
        z <= z1;
        overflow <= cout;
        WAIT FOR 4 ns;

        --Teste Subtrator
        a <= "000000000000";
        b <= "111111111111";
        cin1 <= '0';
        sel <= '1';
        z <= s;
        overflow <= cout1;
        WAIT FOR 4 ns;
        WAIT;
    END PROCESS;
END arch; -- arch