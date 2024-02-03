library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

entity testbench_IITB_CPU is
end entity;
architecture struc of testbench_IITB_CPU is

component IITB_CPU is
port(clck : in std_logic; 
	 dummy: out std_logic_vector(7 downto 0);
	 PB_1_start, PB_2_High, PB_3_reset, PB_4_R_M :in std_logic;
	 Address: in std_logic_vector(3 downto 0));
end component IITB_CPU;

signal clk50: std_logic :='0';
signal st: std_logic:='1';
constant clkper:time:= 20 ns;
signal P1, p2, p3, p4: std_logic := '0';
signal adr: std_logic_vector(3 downto 0);
signal dummy: std_logic_vector(7 downto 0);
begin
p: IITB_CPU port map(clck => clk50,dummy => dummy,PB_1_start => st, PB_2_HIGH => p2, PB_3_reset => p3, PB_4_R_M => p4, address => adr);
   clk50 <= not clk50 after clkper/2;
	p2 <= not p2 after 2500 ns;
	p3 <= '0'
	p4 <= '0';
	adr <= "0111";

end struc;