library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Bit16Adder  is
  port (A, B: in std_logic_vector(15 downto 0); M: in std_logic;S: out std_logic_vector(15 downto 0));
end entity Bit16Adder;
architecture Struct of Bit16Adder is
  signal AX0, AX1, AX2, AX3, AX4, AX5, AX6, AX7, AX8, AX9, AX10, AX11, AX12, AX13, AX14, AX15, AX16, AX17, AX18, AX19, AX20, AX21, AX22, AX23, AX24, AX25, AX26, AX27, AX28, AX29, AX30, AX31, AX32 : std_logic;
  signal Cr0, Cr1, Cr2, Cr3, Cr4, Cr5, Cr6, Cr7, Cr8, Cr9, Cr10, Cr11, Cr12, Cr13, Cr14, Cr15, Cr16, Cr17, Cr18, Cr19, Cr20, Cr21, Cr22, Cr23, Cr24, Cr25, Cr26, Cr27, Cr28, Cr29, Cr30, Cr31, Cr32 : std_logic;
begin

  xor0: XOR_2 port map(A => M, B => A(0), Y => AX0);
  xor1: XOR_2 port map(A => M, B => A(1), Y => AX1);
  xor2: XOR_2 port map(A => M, B => A(2), Y => AX2);
  xor3: XOR_2 port map(A => M, B => A(3), Y => AX3);
  xor4: XOR_2 port map(A => M, B => A(4), Y => AX4);
  xor5: XOR_2 port map(A => M, B => A(5), Y => AX5);
  xor6: XOR_2 port map(A => M, B => A(6), Y => AX6);
  xor7: XOR_2 port map(A => M, B => A(7), Y => AX7);
  xor8: XOR_2 port map(A => M, B => A(8), Y => AX8);
  xor9: XOR_2 port map(A => M, B => A(9), Y => AX9);
  xor10: XOR_2 port map(A => M, B => A(10), Y => AX10);
  xor11: XOR_2 port map(A => M, B => A(11), Y => AX11);
  xor12: XOR_2 port map(A => M, B => A(12), Y => AX12);
  xor13: XOR_2 port map(A => M, B => A(13), Y => AX13);
  xor14: XOR_2 port map(A => M, B => A(14), Y => AX14);
  xor15: XOR_2 port map(A => M, B => A(15), Y => AX15);
--  xor32: XOR_2 port map(A => M, B => A(32), Y => AX32);
  fa0: F_Adder port map(A => AX0, B => B(0), Cin => M, Cout => Cr0, Sum => S(0));
  fa1: F_Adder port map(A => AX1, B => B(1), Cin => Cr0, Cout => Cr1, Sum => S(1));
  fa2: F_Adder port map(A => AX2, B => B(2), Cin => Cr1, Cout => Cr2, Sum => S(2));
  fa3: F_Adder port map(A => AX3, B => B(3), Cin => Cr2, Cout => Cr3, Sum => S(3));
  fa4: F_Adder port map(A => AX4, B => B(4), Cin => Cr3, Cout => Cr4, Sum => S(4));
  fa5: F_Adder port map(A => AX5, B => B(5), Cin => Cr4, Cout => Cr5, Sum => S(5));
  fa6: F_Adder port map(A => AX6, B => B(6), Cin => Cr5, Cout => Cr6, Sum => S(6));
  fa7: F_Adder port map(A => AX7, B => B(7), Cin => Cr6, Cout => Cr7, Sum => S(7));
  fa8: F_Adder port map(A => AX8, B => B(8), Cin => Cr7, Cout => Cr8, Sum => S(8));
  fa9: F_Adder port map(A => AX9, B => B(9), Cin => Cr8, Cout => Cr9, Sum => S(9));
  fa10: F_Adder port map(A => AX10, B => B(10), Cin => Cr9, Cout => Cr10, Sum => S(10));
  fa11: F_Adder port map(A => AX11, B => B(11), Cin => Cr10, Cout => Cr11, Sum => S(11));
  fa12: F_Adder port map(A => AX12, B => B(12), Cin => Cr11, Cout => Cr12, Sum => S(12));
  fa13: F_Adder port map(A => AX13, B => B(13), Cin => Cr12, Cout => Cr13, Sum => S(13));
  fa14: F_Adder port map(A => AX14, B => B(14), Cin => Cr13, Cout => Cr14, Sum => S(14));
  fa15: F_Adder port map(A => AX15, B => B(15), Cin => Cr14, Cout => Cr15, Sum => S(15));
--  fa32: F_Adder port map(A => AX32, B => B(32), Cin => Cr31, Cout => Cout, Sum => S(32));

end Struct;