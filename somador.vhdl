library ieee;
use ieee.std_logic_1164.all; 

entity somador12Bits is
    port(
        A,B: in std_logic_vector(11 downto 0);
        cin: in std_logic;
        S: out std_logic_vector(11 downto 0);
        cout: out std_logic
    );
end somador12Bits;

architecture soma of somador12Bits is
    signal carry: std_logic_vector(12 downto 0);
begin
    carry(11 downto 0) <= cin;
    s(11 downto 0) <= A(11 downto 0) xor B(11 downto 0) xor carry(11 downto 0);
    carry(11 downto 0) <= (A(11 downto 0) and B(11 downto 0)) or (A(11 downto 0) and carry(11 downto 0)) or (B(11 downto 0) and carry(11 downto 0));
    cout <= carry(12);
end soma;
