library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_2 is
end testbench_2;

architecture Behavioral of testbench_2 is
  
component DataFlow_2 is
    port (state : in  std_logic_vector(3 downto 0);Clock : in std_logic; 
	 A: in std_logic; B: in std_logic; C: in std_logic_vector(1 downto 0); 
	 D: in std_logic; E: in std_logic; F: in std_logic_vector(1 downto 0); 
	 G: in std_logic_vector(1 downto 0); H: in std_logic_vector(1 downto 0); I: in std_logic_vector(1 downto 0); 
   EnableW : in std_logic; EnableM: in std_logic;IP_for_testbench, IR_for_FSM: out std_logic_vector(15 downto 0);ZeroFlag: out std_logic);end component DataFlow_2;

signal curr_state : std_logic_vector(3 downto 0);
signal Mux_D, Mux_E,Mux_A, Mux_B,clk, EnableW, EnableM,Zeroflag: std_logic;
signal Mux_C, Mux_F, Mux_G,Mux_H,Mux_I : std_logic_vector(1 downto 0);
signal IR_for_FSMO : std_logic_vector(15 downto 0);
signal IP_for_FSM : std_logic_vector(15 downto 0);

begin

  uut: Dataflow_2 port map (state => curr_state, Clock => clk, 
	 A => Mux_A, B => Mux_B, C => Mux_c,  
	 D => Mux_D, E => Mux_E,  F =>Mux_F,  
	 G => Mux_G, H => Mux_H,  I =>Mux_I,  
	 IP_for_testbench => IP_for_FSM, 
	 EnableW => EnableW,  EnableM => EnableM, IR_for_FSM => IR_for_FSMO, ZeroFlag => Zeroflag);
	 
  stimulus_process: process
  begin

    curr_state <= "0001";
	 Mux_A <= '0';
	 Mux_B <= '1';
	 Mux_C <= "00";
	 Mux_D <= '1';
	 Mux_E <= '0';
	 Mux_F <= "00";
	 Mux_G <= "00";
	 Mux_H <= "01";
	 Mux_I <= "00";
	 EnableW <= '1';
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