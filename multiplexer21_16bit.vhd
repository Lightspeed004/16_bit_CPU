library ieee;
use ieee.std_logic_1164.all;

entity mux21_16bit is
    port (
        A0: in std_logic_vector(15 downto 0);
        A1: in std_logic_vector(15 downto 0);
        S: in std_logic;
        Op: out std_logic_vector(15 downto 0)) ;
end mux21_16bit;
architecture behavior of mux21_16bit is

begin
alu : process( A0, A1, S)
begin
		  if S='0' then
			 Op <= A0;
		  elsif S='1' then
			 Op <= A1;
		  end if;
end process ;
end behavior;