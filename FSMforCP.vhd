library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.All;
entity FSMforCP is
port(IP:in std_logic_vector(15 downto 0); Z: in std_logic;reset,clock:in std_logic;outpstate: out std_logic_vector(3 downto 0); Aselector: out std_logic; Bselector: out std_logic; Cselector: out std_logic_vector(1 downto 0); Dselector: out std_logic; Eselector: out std_logic; Fselector: out std_logic_vector(1 downto 0); Gselector: out std_logic_vector(1 downto 0); Hselector: out std_logic_vector(1 downto 0); Iselector: out std_logic_vector( 1 downto 0); Jselector: out std_logic; EnableWr: out std_logic; EnableWrMem: out std_logic);
end FSMforCP;
architecture bhv of FSMforCP is
---------------Define state type here-----------------------------
type state is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15); -- Fill other states here
---------------Define signals of state type-----------------------
signal A: INTEGER:=1;
signal Zprev: std_logic:='0';
signal y_present: state:=s0;
signal y_next: state:=s0;
begin
previousZ: dff_reset port map(D => Z, clock => clock, reset => '0', Q => Zprev);
clock_proc:process(clock,reset,y_present)
begin
	if(clock='1' and clock' event) then
	  if(reset='1') then
	  y_present <= s1;
	  else
	  y_present <= y_next;
	  end if;
	end if;
end process;
state_transition_proc:process(y_present, reset,IP)
begin
if(reset='0') then
	case y_present is
		when s1 =>
			if((IP(15 downto 12)="0000") OR (IP(15 downto 12)="0010") OR (IP(15 downto 12)="0011") OR (IP(15 downto 12)="0100") OR (IP(15 downto 12)="0110") OR (IP(15 downto 12)="0101"))then --s has been detected
			y_next <= s2; 	--- Fill the code here
			elsif((IP(15 downto 12)="0001")) then
			y_next <= s6;
			elsif((IP(15 downto 12))="1010" OR (IP(15 downto 12)="1011")) then
			y_next <= s7;
			elsif((IP(15 downto 12)="1000") OR (IP(15 downto 12)="1001")) then
			y_next <= s5;
			elsif((IP(15 downto 12)="1101") OR (IP(15 downto 12)="1111")) then
			y_next <= s13;
			elsif((IP(15 downto 12)="1100")) then
			y_next <= s14;
			elsif((IP(15 downto 12)="0111")) then
			y_next <= s15;
			else
         null;
			end if;
		when s2 =>
			y_next <= s3; 
		when s3 =>
			if((IP(15 downto 12)="0000") OR (IP(15 downto 12)="0001") OR (IP(15 downto 12)="0010") OR (IP(15 downto 12)="0011") OR (IP(15 downto 12)="0100") OR (IP(15 downto 12)="0110") OR (IP(15 downto 12)="0101")) then
			y_next <= s4; 
			elsif(IP(15 downto 12)="1010") then
			y_next <= s8;
			elsif(IP(15 downto 12)="1011") then
			y_next <= s9;
			elsif(IP(15 downto 12)="1100") then
			y_next <= s14;
			else
         null;
			end if;
		when s4 =>
			y_next <= s1;
		when s5 => 
			y_next <= s4;
		when s6 =>
			y_next <= s3;
		when s7 =>
			y_next <= s3;
		when s8 =>
			y_next <= s4;
		when s9 => 
			y_next <= s1;
		when s10 => 
			y_next <= s1;
		when s11 => 
			if((IP(15 downto 12)="1101")) then
			y_next <= s15;
			elsif((IP(15 downto 12)="1111")) then
			y_next <= s15;
			else
         null;
			end if;
		when s12 =>
			y_next <= s1;
		when s13 =>
			y_next <= s11;
		when s14 =>
			y_next <= s15;
		when s15 =>
			y_next <= s1;
		when s0 =>
			y_next <= s1;
	end case;
elsif(reset= '1') then
y_next <= s1;
else
null;
end if;
end process;
Select_check_proc:process(y_next, y_present, IP)
begin
if ((y_present = s8) OR (y_present = s9)) then --(selects T3 to go to memory)
Aselector <= '1';
else                  --(seleects IP to go to memory)
Aselector <='0';
end if;



if (y_present = s2) then --(IR 5-3)
Cselector <= "00";
elsif((y_present = s5) OR (y_present = s13) OR (y_present = s7) OR ((y_present = s1) AND (IP(15 downto 12)="1100"))) then --(IR 11-9)
Cselector <= "01";
elsif(y_present = s6) then --(IR 8-6)
Cselector <= "10";
else
null;
end if;

if (y_present = s1 AND NOT (IP(15 downto 12)="1100")) then --(select '111' which is addres of IP in A1)
Dselector <= '1';
else               --(Select IR 9-11 in A1)
Dselector <= '0';
end if;

if (y_present = s6) then --(select Imm)
Eselector <= '1';
else               --(D2 selected in T2)
Eselector <= '0';
end if;

if ((y_present = s1) OR (y_present = s10)) then --(ALU-C slected into D3)
Fselector <= "00";
elsif((y_present = s11) OR ((y_present = s14) AND (IP(15 downto 12)="1100"))) then --(T5 selected in D3)
Fselector <= "01";
elsif(y_present = s12) then --(D2 selected into D3)
Fselector <= "10";
elsif(y_present = s4) then --(T3 selected into D3)
Fselector <= "11";
end if;

if ((y_present = s1) AND NOT (IP(15 downto 12)="1100")) then --(D1(or IP) slected into ALU-A)
Gselector <= "00";
elsif((y_present = s10)) then
Gselector <="01";          --(T5 selected in ALU-A)
else
Gselector <= "11";       --(T1 selected into ALU-A)
end if;

if ((y_present = s10)) then --(Imm slected into ALU-B)
Hselector <= "00";
elsif((y_present = s1)) then --(+1 selected in ALU-B)
Hselector <= "01";
elsif(y_present = s3) then  --(T2 selected in ALU-B)
Hselector <="10";
else
null;
end if;

if (y_present = s3) then --(ALU -C selected in T3)
Iselector <= "00";
elsif(y_present = s5) then --(Shifter output selected in T3)
Iselector <= "01";
elsif(y_present = s8) then --(Storageoutput selected in T3)
Iselector <= "10";
else
null;
end if;

if ((y_present = s1) OR (y_present = s10) OR (y_present = s12)) then --('111' Addres of IP selected at A3)
Bselector <= '1';
else               --(T4 selected at A3)
Bselector <= '0';
end if;

if(y_present = s7) then --(Immqoo selected in T1)
Jselector <= '1';
elsif((y_present = s2)  OR (y_present = s6) OR (y_present = s9) or (y_present = s3)) then
Jselector <='0'; --(D1 selected in T1)
end if;

if((y_present = s1) OR (y_present = s4) OR (y_present = s10) OR (y_present = s11) OR (y_present = s12) OR ((y_present = s14) AND (IP(15 downto 12)="1100") AND Zprev='1')) then
EnableWr <= '1';
else
EnableWr <='0'; 
end if;

if((y_present = s9)) then
EnableWrmem <= '1';
else
EnableWrmem <='0'; 
end if;

if(y_present = s1) then
outpstate <= "0001";
elsif(y_present = s2) then
outpstate <= "0010";
elsif(y_present = s3) then
outpstate <= "0011";
elsif(y_present = s4) then
outpstate <= "0100";
elsif(y_present = s5) then
outpstate <= "0101";
elsif(y_present = s6) then
outpstate <= "0110";
elsif(y_present = s7) then
outpstate <= "0111";
elsif(y_present = s8) then
outpstate <= "1000";
elsif(y_present = s9) then
outpstate <= "1001";
elsif(y_present = s10) then
outpstate <= "1010";
elsif(y_present = s11) then
outpstate <= "1011";
elsif(y_present = s12) then
outpstate <= "1100";
elsif(y_present = s13) then
outpstate <= "1101";
elsif(y_present = s14) then
outpstate <= "1110";
elsif(y_present = s15) then
outpstate <= "1111";
else
null;

end if;


end process;
end bhv;