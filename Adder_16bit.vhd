library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_16bit is
    Port (
        A, B : in  std_logic_vector(15 downto 0);
        Sum  : out std_logic_vector(15 downto 0);
        Cout : out std_logic
    );
end Adder_16bit;

architecture Behavioral of Adder_16bit is
    signal temp_sum : std_logic_vector(15 downto 0);
    signal carry : std_logic;
begin
    sum_process: process(A, B)
    begin
        temp_sum(0) <= A(0) xor B(0); -- First bit of sum

        for i in 1 to 15 loop
            temp_sum(i) <= (A(i) xor B(i) xor temp_sum(i - 1)); -- Calculate sum bit by bit
        end loop;

        carry <= (A(15) and B(15)) or (A(15) and temp_sum(14)) or (B(15) and temp_sum(14)); -- Calculate carry

        Sum <= temp_sum;
        Cout <= carry; 
    end process sum_process;
end Behavioral;
