LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_somadorSubtrator IS
END tb_somadorSubtrator;

ARCHITECTURE arch OF tb_somadorSubtrator IS
    COMPONENT mux2x12
        PORT (
            c0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            c1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            sel : IN STD_LOGIC;
            Z : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT somador12bits
        PORT (
            word_X, word_Y : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            cin_Add : IN STD_LOGIC;
            result_add : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            cout_Add : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT subtrator12bits
        PORT (
            word_A, word_B : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            result_subtraction : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            cin_Sub : IN STD_LOGIC;
            cout_Sub : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT verifyOverflow
        PORT (
            wordInX, wordInY, wordOut : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            overflow : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL sWord_X, sWord_Y, sZ : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL sResult_add, sResult_subtraction : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL sCin_geral, sCout_geral : STD_LOGIC;
    SIGNAL sOverflow : STD_LOGIC;
    SIGNAL sSel : STD_LOGIC;

BEGIN
    u_mux2x12 : mux2x12 PORT MAP(
        sResult_add,
        sResult_subtraction,
        sSel,
        sZ
    );

    u_somador12bits : somador12bits PORT MAP(
        sWord_X,
        sWord_Y,
        sCin_geral,
        sResult_add,
        sCout_geral
    );

    u_subtrator12bits : subtrator12bits PORT MAP(
        sWord_X,
        sWord_Y,
        sResult_subtraction,
        sCin_geral,
        sCout_geral
    );

    u_verifyOverflow : verifyOverflow PORT MAP(
        sWord_X,
        sWord_Y,
        sZ,
        sOverflow

    );

    u_teste : PROCESS
    BEGIN
        sWord_X <= x"000";
        sWord_Y <= x"FFF";
        sCin_geral <= '0';
        sSel <= '0';
        WAIT FOR 4 ns;

        sWord_X <= x"000";
        sWord_Y <= x"FFF";
        sCin_geral <= '0';
        sSel <= '1';
        WAIT FOR 4 ns;

        sWord_X <= x"FFF";
        sWord_Y <= x"001";
        sCin_geral <= '0';
        sSel <= '0';
        WAIT FOR 4 ns;

        sWord_X <= x"FFF";
        sWord_Y <= x"001";
        sCin_geral <= '0';
        sSel <= '1';

        WAIT FOR 4 ns;

        sWord_X <= x"FFE";
        sWord_Y <= x"FFE";
        sCin_geral <= '0';
        sSel <= '0';
        WAIT FOR 4 ns;

        sWord_X <= x"0FF";
        sWord_Y <= x"0FF";
        sCin_geral <= '0';
        sSel <= '0';
        WAIT FOR 4 ns;


        sWord_X <= x"10F";
        sWord_Y <= x"1FF";
        sCin_geral <= '0';
        sSel <= '1';
        WAIT FOR 4 ns;
        WAIT;

    END PROCESS;

END arch; -- arch