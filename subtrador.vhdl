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
    component somador12Bits is
      port(
        X,Y: in std_logic_vector(11 downto 0);
        cin: in std_logic;
        Z: out std_logic_vector(11 downto 0);
        cout: out std_logic
    );
    end component somador12Bits;
    signal A1, B1, S1: std_logic_vector(11 downto 0);
    signal aux_cin, aux_cout: std_logic;
    signal negative_B: std_logic_vector(11 downto 0);
begin

    A1 <= not(B);
    B1 <= "000000000001";

    u_conversao: somador12Bits port map (A1, B1, cin1, S1, aux_cout);

    negative_B <= S1;

    aux_cin <= aux_cout;

    u_subtracao: somador12Bits port map (A, negative_B, aux_cin, S, cout1);

end subtrator ; -- subtrator
