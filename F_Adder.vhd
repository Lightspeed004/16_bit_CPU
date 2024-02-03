library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity F_Adder  is
  port (A, B, Cin: in std_logic;Cout, Sum: out std_logic);
end entity F_Adder;
architecture Struct of F_Adder is
  signal ABX, temp, tempo : std_logic;
begin
  -- component instances
  --ha: Half_Adder 
     --  port map (A => A, B => B, S => tS, C => tC);

  -- propagate carry.
  xor1: XOR_2 port map (A => A, B => B, Y => ABX);
  xor2: XOR_2  port map (A => ABX, B => Cin, Y => Sum);
  and1: AND_2  port map (A => ABX, B => Cin, Y => temp);
  and2: AND_2  port map (A => A, B => B, Y =>tempo);

  -- final sum.
  or1: OR_2 port map (A => temp, B => tempo, Y => Cout);
end Struct;