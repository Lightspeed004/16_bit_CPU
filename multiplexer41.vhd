library ieee;
use ieee.std_logic_1164.all;
use work.gates.all;


entity mux41 is
    port (
        A0: in std_logic_vector(15 downto 0);
        A1: in std_logic_vector(15 downto 0);
		  A2: in std_logic_vector(15 downto 0);
		  A3: in std_logic_vector(15 downto 0);
        S: in std_logic_vector(1 downto 0);
        Op: out std_logic_vector(15 downto 0)) ;
end mux41;
architecture behavior of mux41 is
signal Out1, Out2: std_logic_vector(15 downto 0);
begin
ple1: mux21_16bit port map (A0 => A0, A1 => A1, S => S(0), Op => Out1);
ple2: mux21_16bit port map (A0 => A2, A1 => A3, S => S(0), Op => Out2);
ple3: mux21_16bit port map (A0 => Out1, A1 => Out2, S => S(1), Op => Op);
end behavior;
