LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY subtrator12Bits IS
  PORT (
    word_A, word_B : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    result_subtraction : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    cin_Sub : IN STD_LOGIC;
    cout_Sub : OUT STD_LOGIC
  );
END subtrator12Bits;

ARCHITECTURE subtrator OF subtrator12Bits IS
  COMPONENT somador12Bits IS
    PORT (
      word_X, word_Y : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      cin_Add : IN STD_LOGIC;
      result_Add : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      cout_Add : OUT STD_LOGIC
    );
  END COMPONENT somador12Bits;
  SIGNAL sWord_A1, sWord_B1, sConvertion : STD_LOGIC_VECTOR(11 DOWNTO 0);
  SIGNAL sAux_cin, sAux_cout : STD_LOGIC;
  SIGNAL sNegative_B : STD_LOGIC_VECTOR(11 DOWNTO 0);
BEGIN

  sWord_A1 <= NOT(word_B);
  sWord_B1 <= "000000000001";

  u_conversao : somador12Bits PORT MAP(sWord_A1, sWord_B1, cin_Sub, sConvertion, sAux_cout);

  sNegative_B <= sConvertion;

  sAux_cin <= sAux_cout;

  u_subtracao : somador12Bits PORT MAP(word_A, sNegative_B, sAux_cin, result_subtraction, cout_Sub);

END subtrator; -- subtrator