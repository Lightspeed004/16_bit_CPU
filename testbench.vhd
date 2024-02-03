library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end testbench;

architecture Behavioral of testbench is
  signal inputip : STD_LOGIC_VECTOR(15 downto 0);
  signal outp : STD_LOGIC_VECTOR(15 downto 0);
  
component DataFlow is
    port (state : in  std_logic_vector(3 downto 0);Clock : in std_logic; 
	 A: in std_logic; B: in std_logic; C: in std_logic_vector(1 downto 0); 
	 D: in std_logic; E: in std_logic; F: in std_logic_vector(1 downto 0); 
	 G: in std_logic_vector(1 downto 0); H: in std_logic_vector(1 downto 0); I: in std_logic_vector(1 downto 0); 
	 EnableW : in std_logic; EnableM: in std_logic; Output : out std_logic_vector(15 downto 0); ZeroFlag: out std_logic);
end component DataFlow;

signal curr_state : std_logic_vector(3 downto 0);
signal Output: std_logic_vector(15 downto 0) := "0000000000000000";
signal Mux_D, Mux_E,Mux_A, Mux_B,clk, EnableW, EnableM,Zeroflag: std_logic;
signal Mux_C, Mux_F, Mux_G,Mux_H,Mux_I : std_logic_vector(1 downto 0);

begin

  uut: Dataflow port map (state => curr_state, Clock => clk, 
	 A => Mux_A, B => Mux_B, C => Mux_c,  
	 D => Mux_D, E => Mux_E,  F =>Mux_F,  
	 G => Mux_G, H => Mux_H,  I =>Mux_I,  
	 EnableW => EnableW,  EnableM => EnableM, Output => Output, ZeroFlag => Zeroflag);
	 
  stimulus_process: process
  begin

    curr_state <= "0011";
	 Mux_A <= '0';
	 Mux_B <= '0';
	 Mux_C <= "00";
	 Mux_D <= '0';
	 Mux_E <= '0';
	 Mux_F <= "11";
	 Mux_G <= "11";
	 Mux_H <= "10";
	 Mux_I <= "00";
	 EnableW <= '0';
	 EnableM <= '0';
    wait;
  end process stimulus_process;
  
  clk_process: process
  begin
  clk <= '0';
  wait for 20ns;
  clk <= '1';
  wait for 20ns;
  end process clk_process;
  
  
end Behavioral;