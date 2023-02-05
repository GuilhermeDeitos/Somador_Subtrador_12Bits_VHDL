library ieee;
use ieee.std_logic_1164.all; 

entity somador is
    port(
        A,B: in std_logic;
        cin: in std_logic;
        S: out std_logic;
        cout: out std_logic
    );
end somador;

architecture soma of somador is
begin
    S <= A xor B xor cin;
    cout <= (A and B) or (A and cin) or (B and cin);
end soma;
