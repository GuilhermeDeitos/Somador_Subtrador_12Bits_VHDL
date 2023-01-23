--  Multiplexador de 2 canais com 12 bits por canal
library ieee;
use ieee.std_logic_1164.all;

entity mux2x12 is
    port(
        c0: in std_logic_vector(11 downto 0);
        c1: in std_logic_vector(11 downto 0);
        sel: in std_logic;
        Z: out std_logic_vector(11 downto 0);
        overflow: out std_logic
    );
end entity;

architecture comutar of mux2x6 is
begin
    -- atribuição condicional
    Z <= c0 when sel = '0' else
         c1 when sel = '1' else "ZZZZZZZZZZZZ"; 

end architecture;