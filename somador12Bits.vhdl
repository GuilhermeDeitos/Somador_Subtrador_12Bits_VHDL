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
    component somador4Bits(
        A1,B1: in std_logic_vector(3 downto 0);
        cin1: in std_logic;
        S1: out std_logic_vector(3 downto 0);
        cout1: out std_logic
    )
    end component;
begin
    u_somador1: somador4Bits port map(
        X(3 downto 0),Y(3 downto 0),cin,Z(3 downto 0),cout
    );
    u_somador2: somador4Bits port map(
        X(7 downto 4),Y(7 downto 4),cout,Z(7 downto 4),cout
    );
    u_somador3: somador4Bits port map(
        X(11 downto 8),Y(11 downto 8),cout,Z(11 downto 8),cout
    );


end soma;
