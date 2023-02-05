library ieee;
use ieee.std_logic_1164.all; 

entity somador12Bits is
    port(
        X,Y: in std_logic_vector(11 downto 0);
        cin: in std_logic;
        Z: out std_logic_vector(11 downto 0);
        cout: out std_logic
    );
end somador12Bits;

architecture soma of somador12Bits is
    component somador4Bits port(
        A1,B1: in std_logic_vector(3 downto 0);
        cin1: in std_logic;
        S1: out std_logic_vector(3 downto 0);
        cout1: out std_logic
    );
    end component;

    signal coutVetor: std_logic_vector(2 downto 0);
    signal carry: std_logic_vector(1 downto 0);
begin
    u_somador1: somador4Bits port map(
        X(3 downto 0),Y(3 downto 0),cin,Z(3 downto 0),coutVetor(0)
    );
    carry(0) <= coutVetor(0);
    u_somador2: somador4Bits port map(
        X(7 downto 4),Y(7 downto 4),carry(0),Z(7 downto 4),coutVetor(1)
    );
    carry(1) <= coutVetor(1);
    u_somador3: somador4Bits port map(
        X(11 downto 8),Y(11 downto 8),carry(1),Z(11 downto 8),coutVetor(2)
    );
    cout <= coutVetor(2);
end soma;
