library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity desperate is
    port (storeout: in  std_logic_vector(15 downto 0);IRkey : in std_logic;reset : in std_logic;Output : out std_logic_vector(15 downto 0));
end desperate;

architecture Struct of desperate is
    signal TempReg : std_logic_vector(15 downto 0):="0000000000000000";
begin
    process(IRkey, reset)
    begin
             if (IRkey='1') then
                TempReg(15 downto 0) <= storeout;
				  else
				  null;
				  end if;
    end process;

    Output <= TempReg;
end Struct;