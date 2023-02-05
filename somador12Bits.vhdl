LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador12Bits IS
    PORT (
        word_X, word_Y : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        cin_Add : IN STD_LOGIC;
        result_add : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        cout_Add : OUT STD_LOGIC
    );
END somador12Bits;

ARCHITECTURE soma OF somador12Bits IS
    COMPONENT somador4Bits PORT (
        A1, B1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        cin1 : IN STD_LOGIC;
        S1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        cout1 : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL sCout12Bits : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sCarry12Bits : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    u_somador1 : somador4Bits PORT MAP(
        word_X(3 DOWNTO 0), word_Y(3 DOWNTO 0), cin_Add, result_add(3 DOWNTO 0), sCout12Bits(0)
    );
    sCarry12Bits(0) <= sCout12Bits(0);
    u_somador2 : somador4Bits PORT MAP(
        word_X(7 DOWNTO 4), word_Y(7 DOWNTO 4), sCarry12Bits(0), result_add(7 DOWNTO 4), sCout12Bits(1)
    );
    sCarry12Bits(1) <= sCout12Bits(1);
    u_somador3 : somador4Bits PORT MAP(
        word_X(11 DOWNTO 8), word_Y(11 DOWNTO 8), sCarry12Bits(1), result_add(11 DOWNTO 8), sCout12Bits(2)
    );
    cout_Add <= sCout12Bits(2);
END soma;