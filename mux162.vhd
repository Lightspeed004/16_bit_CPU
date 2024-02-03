library ieee;
use ieee.std_logic_1164.all;
use work.gates.all;

entity mux162 is
  
    port (
        A0: in std_logic_vector(15 downto 0);
        A1: in std_logic_vector(15 downto 0);
		  A2: in std_logic_vector(15 downto 0);
		  A3: in std_logic_vector(15 downto 0);
		  A4: in std_logic_vector(15 downto 0);
		  A5: in std_logic_vector(15 downto 0);
		  A6: in std_logic_vector(15 downto 0);
		  A7: in std_logic_vector(15 downto 0);
		  A8: in std_logic_vector(15 downto 0);
		  A9: in std_logic_vector(15 downto 0);
		  A10: in std_logic_vector(15 downto 0);
		  A11: in std_logic_vector(15 downto 0);
		  A12: in std_logic_vector(15 downto 0);
		  A13: in std_logic_vector(15 downto 0);
		  A14: in std_logic_vector(15 downto 0);
		  A15: in std_logic_vector(15 downto 0);
        S: in std_logic_vector(3 downto 0);
        Op: out std_logic_vector(15 downto 0)) ;
end mux162;
architecture behavior of mux162 is
signal Out1, Out2: std_logic_vector(15 downto 0);

begin
ple1: mux81 port map(A0 => A0, A1 => A1, A2 => A2, A3 => A3, A4 => A4, A5 => A5, A6 => A6, A7 => A7, S => S(2 downto 0), Op => Out1);
ple2: mux81 port map(A0 => A8, A1 => A9, A2 => A10, A3 => A11, A4 => A12, A5 => A13, A6 => A14, A7 => A15, S => S(2 downto 0), Op => Out2);
ple3: mux21_16bit port map(A0 => Out1, A1 => Out2, S => S(3), Op => Op);
end behavior;