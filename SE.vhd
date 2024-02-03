library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtender is
    port (Input : in  std_logic_vector(15 downto 0);opcode : in std_logic_vector(3 downto 0);Output : out std_logic_vector(15 downto 0));
end SignExtender;

architecture Struct of SignExtender is
    signal TempReg : std_logic_vector(15 downto 0):="0000000000000000";
begin
    process(Input, opcode)
    begin
            if ((opcode = "0001") OR (opcode = "1010") OR (opcode = "1011")OR (opcode = "1100")) then
                TempReg(15 downto 6) <= "0000000000";
					 Tempreg(5 downto 0) <= Input(5 downto 0);
            elsif (opcode = "1101") then
                TempReg(15 downto 9) <= "0000000";
					 Tempreg(8 downto 0) <= Input(8 downto 0);
        end if;
    end process;

    Output <= TempReg;
end Struct;
