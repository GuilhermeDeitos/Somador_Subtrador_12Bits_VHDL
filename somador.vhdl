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
    variable carry: std_logic_vector(12 downto 0);
begin
    carry(0) <= cin;
    s(0) <= A(0) xor B(0) xor carry(0);
    carry(1) <= (A(0) and B(0)) or (A(0) and carry(0)) or (B(0) and carry(0));

    s(1) <= A(1) xor B(1) xor carry(1);
    carry(2) <= (A(1) and B(1)) or (A(1) and carry(1)) or (B(1) and carry(1));

    s(2) <= A(2) xor B(2) xor carry(2);
    carry(3) <= (A(2) and B(2)) or (A(2) and carry(2)) or (B(2) and carry(2));

    s(3) <= A(3) xor B(3) xor carry(3);
    carry(4) <= (A(3) and B(3)) or (A(3) and carry(3)) or (B(3) and carry(3));
    
    s(4) <= A(4) xor B(4) xor carry(4);
    carry(5) <= (A(4) and B(4)) or (A(4) and carry(4)) or (B(4) and carry(4));

    s(5) <= A(5) xor B(5) xor carry(5);
    carry(6) <= (A(5) and B(5)) or (A(5) and carry(5)) or (B(5) and carry(5));

    s(6) <= A(6) xor B(6) xor carry(6);
    carry(7) <= (A(6) and B(6)) or (A(6) and carry(6)) or (B(6) and carry(6));

    s(7) <= A(7) xor B(7) xor carry(7);
    carry(8) <= (A(7) and B(7)) or (A(7) and carry(7)) or (B(7) and carry(7));

    s(8) <= A(8) xor B(8) xor carry(8);
    carry(9) <= (A(8) and B(8)) or (A(8) and carry(8)) or (B(8) and carry(8));

    s(9) <= A(9) xor B(9) xor carry(9);
    carry(10) <= (A(9) and B(9)) or (A(9) and carry(9)) or (B(9) and carry(9));

    s(10) <= A(10) xor B(10) xor carry(10);
    carry(11) <= (A(10) and B(10)) or (A(10) and carry(10)) or (B(10) and carry(10));

    s(11) <= A(11) xor B(11) xor carry(11);
    carry(12) <= (A(11) and B(11)) or (A(11) and carry(11)) or (B(11) and carry(11));

    cout <= carry(12);
end soma;