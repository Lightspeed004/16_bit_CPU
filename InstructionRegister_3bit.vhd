library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionRegister3bit is
    Port (
        Input : in  std_logic_vector(2 downto 0);
        Clock : in std_logic;
        Load : in std_logic;
        Output : out std_logic_vector(2 downto 0)
    );
end InstructionRegister3bit;

architecture Behavioral of InstructionRegister3bit is
    signal TempReg : std_logic_vector(2 downto 0);
begin
    process(Clock)
    begin
        if rising_edge(Clock) then
            if Load = '1' then
                TempReg <= Input;
            end if;
        end if;
    end process;

    Output <= TempReg;
end Behavioral;
