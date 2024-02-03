library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter is
    port (Input : in  std_logic_vector(15 downto 0);opcode : in std_logic_vector(3 downto 0);Output : out std_logic_vector(15 downto 0));
end Shifter;

architecture Struct of Shifter is
    signal TempReg : std_logic_vector(15 downto 0):="0000000000000000";
begin
cl:process(Input, opcode)
    begin
            if (opcode = "1000") then
                TempReg(15 downto 7) <= Input(8 downto 0);
					 Tempreg(6 downto 0) <= "0000000";
            elsif (opcode = "1001") then
                TempReg(8 downto 0) <= Input(8 downto 0);
					 Tempreg(15 downto 9) <= "0000000";
        end if;
    end process;

    Output <= TempReg;
end Struct;
