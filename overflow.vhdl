LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY verifyOverflow IS
    PORT (
        wordInX, wordInY, wordOut : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        overflow : OUT STD_LOGIC
    );
END verifyOverflow;

ARCHITECTURE verify OF verifyOverflow IS
BEGIN
    overflow <= (NOT(wordOut(11)) AND (wordInX(11) OR wordInY(11))) OR (wordInX(11) AND wordInY(11));
END verify;