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
    overflow <= '1' WHEN (wordInX(11) = wordInY(11) AND wordInX(11) /= wordOut(11)) ELSE '0';
END verify;