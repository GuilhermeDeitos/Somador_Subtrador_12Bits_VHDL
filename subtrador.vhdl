library ieee;
use ieee.std_logic_1164.all; 

entity subtrator12Bits is
  port (
    A, B: in std_logic_vector(11 downto 0);
    S: out std_logic_vector(11 downto 0);
    cin: in std_logic;
    cout: out std_logic    
  );
end subtrator12Bits;

architecture subtrator of subtrator12Bits is

    component somador12Bits is
        port (
            A1, B1: in std_logic_vector(11 downto 0);
            S1: out std_logic_vector(11 downto 0);
            cin1: in std_logic;
            cout1: out std_logic
        );
    end component somador12Bits;

    signal A1, B1: std_logic_vector(11 downto 0);
begin

    A1 <= not B(11 downto 0);
    B1 <= "000000000001";

    somador12Bits: somador12Bits port map (A1, B1, S1, cin1, cout1);

    B <= S1;

    cin <= cout1;

    somador12Bits: somador12Bits port map (A, B, S, cin, cout);

end subtrator ; -- subtrator