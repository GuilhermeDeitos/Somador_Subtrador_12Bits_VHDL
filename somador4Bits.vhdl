library ieee;
use ieee.std_logic_1164.all; 

entity somador4Bits is
    port(
        A1,B1: in std_logic_vector(3 downto 0);
        cin1: in std_logic;
        S1: out std_logic_vector(3 downto 0);
        cout1: out std_logic
    );
end somador4Bits;

architecture soma of somador4Bits is
    component somador1Bit(
        A,B: in std_logic;
        cin: in std_logic;
        S: out std_logic;
        cout: out std_logic
    );
    end component;
begin
    u_somador1: somador port map(
        A1(0),B1(0),cin1,S1(0),cout1
    );
    u_somador2: somador port map(
        A1(1),B1(1),cout1,S1(1),cout1
    );
    u_somador3: somador port map(
        A1(2),B1(2),cout1,S1(2),cout1
    );
    u_somador4: somador port map(
        A1(3),B1(3),cout1,S1(3),cout1
    );
end soma;
