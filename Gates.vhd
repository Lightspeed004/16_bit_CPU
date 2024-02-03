library ieee;
use ieee.std_logic_1164.all;

--A package declaration is used to store a set of common declarations, such as components.
--These declarations can then be imported into other design units using a use clause.

package Gates is
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  component AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component AND_2;

  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND_2;

  component OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component OR_2;

  component NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NOR_2;

  component XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XOR_2;

  component XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XNOR_2;
  
  component Majority_2 is
   port (A, B, C: in std_logic; Y: out std_logic);
  end component Majority_2;
  
  component HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
  end component HALF_ADDER;
  
  component encoder422  is
   port (A, B, C, D :in std_logic;Y2, Y1, Y: out std_logic);
  end component encoder422;
  
  component PE83  is
   port (A :in std_logic_vector(7 downto 0);Y: out std_logic_vector(3 downto 0));
  end component PE83;
  
  component plex  is
   port (A, B, L:in std_logic; Y: out std_logic);
  end component plex;
  
  component plex3  is
   port (A:in std_logic_vector(10 downto 0); Y: out std_logic);
  end component plex3;
  
  component PE16_4  is
   port (A :in std_logic_vector(63 downto 0);Y: out std_logic_vector(5 downto 0));
  end  component PE16_4;
  
  component F_Adder  is
   port (A, B, Cin: in std_logic;Cout, Sum: out std_logic);
  end component F_Adder;
  
  component Hf  is
   port (A :in std_logic_vector(2 downto 0); Y: out std_logic_vector(31 downto 0));
  end  component Hf;
  
  component Capsigma0  is
   port (A :in std_logic_vector(31 downto 0);Y: out std_logic_vector(31 downto 0));
  end component Capsigma0;
  
  component Capsigma1  is
   port (A :in std_logic_vector(31 downto 0);Y: out std_logic_vector(31 downto 0));
  end component Capsigma1;
  
  component sigma0  is
   port (A :in std_logic_vector(31 downto 0);Y: out std_logic_vector(31 downto 0));
  end component sigma0;
  
  component sigma1  is
   port (A :in std_logic_vector(31 downto 0);Y: out std_logic_vector(31 downto 0));
  end component sigma1;
  
  component MajorityFunction is
	  port(A: in std_logic_vector(31 downto 0);B: in std_logic_vector(31 downto 0);C: in std_logic_vector(31 downto 0);Y : out std_logic_vector(31 downto 0));
  end component MajorityFunction;
  
  component ChooseFunction is
   port (L, A, B:in std_logic_vector(31 downto 0);Y: out std_logic_vector(31 downto 0));
  end component ChooseFunction;
  
  component kf  is
  port (A :in std_logic_vector(5 downto 0);Y: out std_logic_vector(31 downto 0));
  end component kf;
  
  component largeplex  is
   port (A, B:in std_logic_vector(31 downto 0);L: in std_logic; Y: out std_logic_vector(31 downto 0));
  end component largeplex;
  
  component dff_reset is
   port(D,clock,reset:in std_logic;Q:out std_logic);
  end component dff_reset;
  
  component Registo is 
   port(A: in std_logic_vector(31 downto 0); clock,reset:in std_logic; Q:out std_logic_vector(31 downto 0));
  end component Registo;
  
  component BitCOuntersix is
   port (A, B: in std_logic_vector(5 downto 0); M: in std_logic;S: out std_logic_vector(5 downto 0));
  end component BitCOuntersix;
  
  component BitCOunter is
   port (A, B: in std_logic_vector(31 downto 0); M: in std_logic;S: out std_logic_vector(31 downto 0));
  end component BitCOunter;
  
  component Count is 
   port(clock:in std_logic;Y:out std_logic_vector(4 downto 0));
  end component Count;
  
  component desperate is
   port (storeout: in  std_logic_vector(15 downto 0);IRkey : in std_logic;reset : in std_logic;Output : out std_logic_vector(15 downto 0));
  end component desperate;
  
  component Count000 is 
   port(clock:in std_logic;Y:out std_logic_vector(4 downto 0));
  end component Count000;
  
  component Count3 is 
   port(clock:in std_logic;Y:out std_logic);
  end component Count3;
  
  component Count64 is 
   port(clock:in std_logic;Y:out std_logic_vector(6 downto 0));
  end component Count64;
  
  component Countforcompression is 
   port(clock:in std_logic;Y:out std_logic_vector(5 downto 0));
  end component Countforcompression;
  
  component WFunction is
   port (Wt7, Wt2, Wt15, Wt16, Rt : in STD_LOGIC_VECTOR(31 downto 0);clock:in std_logic;Wt : out STD_LOGIC_VECTOR(31 downto 0));
  end component WFunction;
  
  component Compress is
   port (ai, bi, ci, di, ei, fi, gi, hi, Wt : in STD_LOGIC_VECTOR(31 downto 0);clock:in std_logic;a, b, c, d, e, f, g, h : out STD_LOGIC_VECTOR(31 downto 0));  
  end component COmpress;
  
  component Data is 
   port(A: in std_logic_vector(31 downto 0); clock,reset:in std_logic; Wt2, Wt7, Wt16, Wt15:out std_logic_vector(31 downto 0));
  end component Data;
  
  component Count2 is 
   port(clock:in std_logic;Y:out std_logic_vector(4 downto 0));
  end component Count2;
  
  component abcData is 
   port(ai, bi, ci, di, ei, fi, gi, hi: in std_logic_vector(31 downto 0); clock:in std_logic; a, b, c, d, e, f, g, h:out std_logic_vector(31 downto 0));
  end component abcData;
  
  component Blocks12 is
   port (A : in STD_LOGIC_VECTOR(31 downto 0);clock:in std_logic;Y : out STD_LOGIC_VECTOR(31 downto 0));
  end component Blocks12;
  
  component Bit16Adder  is
   port (A, B: in std_logic_vector(15 downto 0); M: in std_logic;S: out std_logic_vector(15 downto 0));
  end component Bit16Adder;
  
  component Register_File is
    port(
	   RF_A1: in std_logic_vector(2 downto 0);
		RF_A2: in std_logic_vector(2 downto 0);
		RF_A3: in std_logic_vector(2 downto 0);
		RF_D1: out std_logic_vector(15 downto 0);
		RF_D2: out std_logic_vector(15 downto 0);
		RF_D3: in std_logic_vector(15 downto 0);
		RF_RE1, RF_RE2, RF_WR3,clk, reset: in std_logic;
		Ro0, Ro1, Ro2, Ro3, Ro4, Ro5, Ro6, Ro7: out std_logic_vector(15 downto 0)
		);
  end component Register_File;
  
  component mux162 is
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
  end component mux162;
  
  component mux81 is
    port (
        A0: in std_logic_vector(15 downto 0);
        A1: in std_logic_vector(15 downto 0);
		  A2: in std_logic_vector(15 downto 0);
		  A3: in std_logic_vector(15 downto 0);
		  A4: in std_logic_vector(15 downto 0);
		  A5: in std_logic_vector(15 downto 0);
		  A6: in std_logic_vector(15 downto 0);
		  A7: in std_logic_vector(15 downto 0);
        S: in std_logic_vector(2 downto 0);
        Op: out std_logic_vector(15 downto 0)) ;
  end component mux81;
  
  component mux41 is
    port (
        A0: in std_logic_vector(15 downto 0);
        A1: in std_logic_vector(15 downto 0);
		  A2: in std_logic_vector(15 downto 0);
		  A3: in std_logic_vector(15 downto 0);
        S: in std_logic_vector(1 downto 0);
        Op: out std_logic_vector(15 downto 0)) ;
  end component mux41;
  
  component mux21 is
    port (
        A0: in std_logic_vector(2 downto 0);
        A1: in std_logic_vector(2 downto 0);
        S: in std_logic;
        Op: out std_logic_vector(2 downto 0)) ;
  end component mux21;
  
    component mux41_3bit is
    port (
        A0: in std_logic_vector(2 downto 0);
        A1: in std_logic_vector(2 downto 0);
		  A2: in std_logic_vector(2 downto 0);
		  A3: in std_logic_vector(2 downto 0);
        S: in std_logic_vector(1 downto 0);
        Op: out std_logic_vector(2 downto 0)) ;
  end component mux41_3bit;
  
  component mux21_16bit is
    port (
        A0: in std_logic_vector(15 downto 0);
        A1: in std_logic_vector(15 downto 0);
        S: in std_logic;
        Op: out std_logic_vector(15 downto 0)) ;
  end component mux21_16bit;
  
  component InstructionRegister is
   port (Input : in  std_logic_vector(15 downto 0);
        Clock : in std_logic;
        Load : in std_logic;
        Output : out std_logic_vector(15 downto 0));
  end component InstructionRegister;
  
  component MemRegister is
    Port (
	     Initial: in std_logic_vector(15 downto 0);Input : in  std_logic_vector(15 downto 0);
        Clock : in std_logic;Load : in std_logic;Output : out std_logic_vector(15 downto 0));
  end component MemRegister;
  
  component InstructionRegister3bit is
   port (Input : in  std_logic_vector(2 downto 0);
        Clock : in std_logic;
        Load : in std_logic;
        Output : out std_logic_vector(2 downto 0));
  end component InstructionRegister3bit;
  
  component ALU is
	port (ALU_A , ALU_B : in std_logic_vector(15 downto 0); ALU_IP: in std_logic_vector(15 downto 0); ALU_S : in std_logic_vector(3 downto 0);ALU_IR : in std_logic_vector(15 downto 0);ALU_C : out std_logic_vector(15 downto 0);Z : out std_logic);
  end component ALU;
  
  component Shifter is
   port (Input : in  std_logic_vector(15 downto 0);opcode : in std_logic_vector(3 downto 0);Output : out std_logic_vector(15 downto 0));
  end component Shifter;
  
  component SignExtender is
   port (Input : in  std_logic_vector(15 downto 0);opcode : in std_logic_vector(3 downto 0);Output : out std_logic_vector(15 downto 0));
  end component SignExtender;
  
  component memory is
    port(WE,clk,reset: in std_logic;
		   IP,Din: in std_logic_vector(15 downto 0);
		   Dout: out std_logic_vector(15 downto 0);
			m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15 : out STD_LOGIC_VECTOR (15 downto 0));

  end component memory;
  
  component storageofsignals is
    port(WE,clk: in std_logic;
		   IP,Din: in std_logic_vector(15 downto 0);
		   Dout: out std_logic_vector(15 downto 0));
  end component storageofsignals;
  
end package Gates;


library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
   port (A: in std_logic; Y: out std_logic);
end entity INVERTER;

architecture Equations of INVERTER is
begin
   Y <= not A;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity AND_2;

architecture Equations of AND_2 is
begin
   Y <= A and B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NAND_2;

architecture Equations of NAND_2 is
begin
   Y <= not (A and B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity OR_2;

architecture Equations of OR_2 is
begin
   Y <= A or B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NOR_2;

architecture Equations of NOR_2 is
begin
   Y <= not (A or B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XOR_2;

architecture Equations of XOR_2 is
begin
   Y <= A xor B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XNOR_2;

architecture Equations of XNOR_2 is
begin
   Y <= not (A xor B);
end Equations;

library ieee;
use ieee.std_logic_1164.all;
entity Majority_2 is
   port (A, B, C: in std_logic; Y: out std_logic);
end entity Majority_2;

architecture Equations of Majority_2 is
begin
   Y <= ((A AND B) OR (A AND C) OR (B AND C));
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
end entity HALF_ADDER;

architecture Equations of HALF_ADDER is
begin
   S <= (A xor B);
   C <= (A and B);
end Equations;

library ieee;
use ieee.std_logic_1164.all;
entity dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end entity dff_reset;
architecture behav of dff_reset is
begin
dff_reset_proc: process (clock,reset)
begin
if(reset='1')then -- reset implies flip flip output logic low
Q <= '0'; -- write the flip flop output when reset
elsif (clock'event and (clock='1')) then
Q <= D; -- write flip flop output when not reset
end if ;
end process dff_reset_proc;
end behav;