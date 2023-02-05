library ieee;
use ieee.std_logic_1164.all; 

entity subtrator12Bits is
  port (
    A, B: in std_logic_vector(11 downto 0);
    S: out std_logic_vector(11 downto 0);
    cin1: in std_logic;
    cout1: out std_logic    
  );
end subtrator12Bits;

architecture subtrator of subtrator12Bits is
    component somador is
        port (
          X,Y: in std_logic_vector(11 downto 0);
          cin: in std_logic;
          Z: out std_logic_vector(11 downto 0);
          cout: out std_logic
        );
    end component somador;
    signal A1, B1: std_logic_vector(11 downto 0);
begin

    A1 <= not(B);
    B1 <= "000000000001";

    somador12Bits: somador port map (Z => A, Y => B, S => S, cin => cin1, cout => cout1);

    B <= S1;

    cin <= cout1;

    somador12Bits2: somador port map (A, B, S, cin, cout);

end subtrator ; -- subtrator
