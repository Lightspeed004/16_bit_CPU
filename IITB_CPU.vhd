library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity IITB_CPU is
    port(clck : in std_logic; 
	 dummy: out std_logic_vector(7 downto 0);
	 PB_1_start, PB_2_High, PB_3_reset, PB_4_R_M :in std_logic;
	 Address: in std_logic_vector(3 downto 0));
end IITB_CPU;

architecture main of IITB_CPU is

component DataFlow_2 is
port (state : in  std_logic_vector(3 downto 0); reset : in std_logic; Clock : in std_logic; 
	 A: in std_logic; B: in std_logic; C: in std_logic_vector(1 downto 0); 
	 D: in std_logic; E: in std_logic; F: in std_logic_vector(1 downto 0); 
	 G: in std_logic_vector(1 downto 0); H: in std_logic_vector(1 downto 0); I: in std_logic_vector(1 downto 0); J: in std_logic;
	 EnableW : in std_logic; EnableM: in std_logic; IR_for_FSM: out std_logic_vector(15 downto 0);ZeroFlag: out std_logic;
	 Ro0, Ro1, Ro2, Ro3, Ro4, Ro5, Ro6, Ro7: out std_logic_vector(15 downto 0);
	 m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15 : out STD_LOGIC_VECTOR (15 downto 0));

end component DataFlow_2;
	 

component dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end component dff_reset;
	
component FSMforCP is
port(IP:in std_logic_vector(15 downto 0);
 Z: in std_logic;
 reset,clock:in std_logic;
 outpstate: out std_logic_vector(3 downto 0); 
 Aselector: out std_logic;
 Bselector: out std_logic; 
 Cselector: out std_logic_vector(1 downto 0); 
 Dselector: out std_logic; 
 Eselector: out std_logic;
 Fselector: out std_logic_vector(1 downto 0);
 Gselector: out std_logic_vector(1 downto 0);
 Hselector: out std_logic_vector(1 downto 0);
 Iselector: out std_logic_vector( 1 downto 0);
 Jselector: out std_logic;
 EnableWr: out std_logic; 
 EnableWrMem: out std_logic);
end component FSMforCP;
	signal reset: std_logic;
	signal IR: std_logic_vector(15 downto 0);
	signal Z, notstop, clock: std_logic;
	signal IRin: std_logic_vector(15 downto 0):="0000001000010010"; ---We will have to initialize it from storage
	signal outpstate: std_logic_vector(3 downto 0):="0001";
	signal Zin: std_logic:='0';
	signal A, B, D, E, J, EnableWr, EnableWRmem: std_logic;
	signal C, F, G, H, I: std_logic_vector(1 downto 0);
	signal ro0, ro1, ro2, ro3, ro4, ro5, ro6, ro7 : std_logic_vector(15 downto 0);
	signal m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11,m12,m13,m14,m15: std_logic_vector(15 downto 0);

begin
reset <= PB_3_reset;

clock <= clck AND PB_1_start;

--reset <= not PS_1stop

FSM : FSMforCP port map
(IP => IRin, ---
 Z => Zin, ---
 reset => reset,----
 clock => clock,----
 outpstate =>  outpstate, 
 Aselector=> A,
 Bselector=> B,
 Cselector=> C, 
 Dselector=> D, 
 Eselector=> E,
 Fselector=> F,
 Gselector=> G,
 Hselector=> H,
 Iselector=> I,
 Jselector=> J,
 EnableWr=> EnableWr,
 EnableWrMem=> EnableWrMem);
 
sig: IRin <= IR;
sigg: Zin <= Z;
DATA_PATH : DataFlow_2  port map(
    state => outpstate,
	 Clock => clock,
	 A=>A,
	 B=>B,
	 C=>C,
	 D=>D,
	 E=>E,
	 F=>F, 
	 G=>G,
	 H=>H,
	 I=>I,
	 J=>J,
	 reset=>reset,
	 EnableW => EnableWr, 
	 EnableM => EnableWrmem, 
	 IR_for_FSM => IR, 
	 ZeroFlag =>Z,
	 ro0 => ro0,
	 ro1 => ro1,
	 ro2 => ro2, 
	 ro3 => ro3, 
	 ro4 => ro4, 
	 ro5 => ro5, 
	 ro6 => ro6, 
	 ro7 => ro7,m0 => m0, m1 => m1, m2 => m2, m3 => m3, m4 => m4, m5 => m5, m6 => m6, m7 => m7, m8 => m8,
	 m9 => m9, m10 => m10, m11 => m11, m12 => m12, m13 => m13, m14 => m14, m15 => m15);
proc_output: process(PB_1_start, PB_2_high, PB_4_R_M, address, ro0, ro1, ro2, ro3, ro4, ro5, ro6, ro7, m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15)
begin

if (PB_4_R_M = '0') then
if (PB_2_high = '1') then
case address(2 downto 0) is
            when "000" =>
                dummy <= ro0(15 downto 8);
            when "001" =>
                dummy <= ro1(15 downto 8);
            when "010" =>
                dummy <= ro2(15 downto 8);
            when "011" =>
                dummy <= ro3(15 downto 8);
            when "100" =>
                dummy <= ro4(15 downto 8);
            when "101" =>
                dummy <= ro5(15 downto 8);
            when "110" =>
                dummy <= ro6(15 downto 8);
            when "111" =>
                dummy <= ro7(15 downto 8);
            when others =>
                dummy <= "00000000";
				 end case;

elsif (PB_2_High = '0') then
case address(2 downto 0) is
            when "000" =>
                dummy <= ro0(7 downto 0);
            when "001" =>
                dummy <= ro1(7 downto 0);
            when "010" =>
                dummy <= ro2(7 downto 0);
            when "011" =>
                dummy <= ro3(7 downto 0);
            when "100" =>
                dummy <= ro4(7 downto 0);
            when "101" =>
                dummy <= ro5(7 downto 0);
            when "110" =>
                dummy <= ro6(7 downto 0);
            when "111" =>
                dummy <= ro7(7 downto 0);
            when others =>
                dummy <= "00000000";
				 end case;
		 end if;
		 
elsif(PB_4_R_M = '1') then
if (PB_2_high = '1') then
case address is
    when "0000" =>
        dummy <= m0(15 downto 8);
    when "0001" =>
        dummy <= m1(15 downto 8);
    when "0010" =>
        dummy <= m2(15 downto 8);
    when "0011" =>
        dummy <= m3(15 downto 8);
    when "0100" =>
        dummy <= m4(15 downto 8);
    when "0101" =>
        dummy <= m5(15 downto 8);
    when "0110" =>
        dummy <= m6(15 downto 8);
    when "0111" =>
        dummy <= m7(15 downto 8);
    when "1000" =>
        dummy <= m8(15 downto 8);
    when "1001" =>
        dummy <= m9(15 downto 8);
    when "1010" =>
        dummy <= m10(15 downto 8);
    when "1011" =>
        dummy <= m11(15 downto 8);
    when "1100" =>
        dummy <= m12(15 downto 8);
    when "1101" =>
        dummy <= m13(15 downto 8);
    when "1110" =>
        dummy <= m14(15 downto 8);
    when "1111" =>
        dummy <= m15(15 downto 8);
    when others =>
        dummy <= (others => '0'); 
end case;

elsif (PB_2_High = '0') then
case address is
    when "0000" =>
        dummy <= m0(7 downto 0);
    when "0001" =>
        dummy <= m1(7 downto 0);
    when "0010" =>
        dummy <= m2(7 downto 0);
    when "0011" =>
        dummy <= m3(7 downto 0);
    when "0100" =>
        dummy <= m4(7 downto 0);
    when "0101" =>
        dummy <= m5(7 downto 0);
    when "0110" =>
        dummy <= m6(7 downto 0);
    when "0111" =>
        dummy <= m7(7 downto 0);
    when "1000" =>
        dummy <= m8(7 downto 0);
    when "1001" =>
        dummy <= m9(7 downto 0);
    when "1010" =>
        dummy <= m10(7 downto 0);
    when "1011" =>
        dummy <= m11(7 downto 0);
    when "1100" =>
        dummy <= m12(7 downto 0);
    when "1101" =>
        dummy <= m13(7 downto 0);
    when "1110" =>
        dummy <= m14(7 downto 0);
    when "1111" =>
        dummy <= m15(7 downto 0);
    when others =>
        dummy <= (others => '0'); 
end case;
end if;
end if;

end process;

end main;
