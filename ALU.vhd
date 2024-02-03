library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port (ALU_A , ALU_B : in std_logic_vector(15 downto 0); ALU_IP: in std_logic_vector(15 downto 0); ALU_S : in std_logic_vector(3 downto 0);ALU_IR : in std_logic_vector(15 downto 0);ALU_C : out std_logic_vector(15 downto 0);Z : out std_logic);
end entity ALU;

architecture Structure_ALU of ALU is

	function Logical_OR(A : in std_logic_vector(15 downto 0);
						B : in std_logic_vector(15 downto 0))
	return std_logic_vector is
		variable result : std_logic_vector(15 downto 0) := (others => '0');
	begin
			L1 : for i in 0 to 15 loop
				result(i) := A(i) or B(i);
			end loop L1;
		return result;
	end function LOgical_OR;
--------------------------------------------------------------------------------------------------------------------------------	
	function ADD_16(A : in std_logic_vector(15 downto 0); B : in std_logic_vector(15 downto 0)) return std_logic_vector is
		variable C : std_logic_vector(16 downto 0) := (others => '0');
		variable S : std_logic_vector(15 downto 0);
	begin
		Loop1: for i in 0 to 15 loop
			S(i) := A(i) xor B(i) xor C(i);
			C(i+1) := ( A(i) and C(i) ) or ( ( A(i) xor C(i) ) and B(i) );
		end loop Loop1;
		return S;
	end function ADD_16;
	
---------------------------------------------------------------------------------------------------------------------------------	
	function ADD_16_6digit(A : in std_logic_vector(15 downto 0); B : in std_logic_vector(15 downto 0)) return std_logic_vector is
		variable C : std_logic_vector(16 downto 0) := (others => '0');
		variable S : std_logic_vector(15 downto 0);
		variable D : std_logic_vector(15 downto 0);
	begin
	
			D(5 downto 0) := B(5 downto 0);
			D(15 downto 6) := "0000000000";
		Loop1: for i in 0 to 15 loop
			S(i) := A(i) xor D(i) xor C(i);
			C(i+1) := ( A(i) and C(i) ) or ( ( A(i) xor C(i) ) and D(i) );
		end loop Loop1;
		return S;
	end function ADD_16_6digit;
---------------------------------------------------------------------------------------------------------------------------------
function Subtraction(A : in std_logic_vector; B : in std_logic_vector) return std_logic_vector is
        variable A_int, B_int, Result_int : integer;
    begin
        A_int := to_integer(unsigned(A));
        B_int := to_integer(unsigned(B));
        
        Result_int := A_int - B_int;
        
        return std_logic_vector(to_signed(Result_int, 16));
    end Subtraction;

------------------------------------------------------------------------------------------------	
	function Logical_and(A : in std_logic_vector(15 downto 0);
						B : in std_logic_vector(15 downto 0))
	return std_logic_vector is
		variable result : std_logic_vector(15 downto 0);
	begin
				result := A AND B;
		return result;
	end function Logical_and;
	
----------------------------------------------------------------------------------------	
	function Logical_implication(A : in std_logic_vector(15 downto 0);
						B : in std_logic_vector(15 downto 0))
	return std_logic_vector is
		variable result : std_logic_vector(15 downto 0) := (others => '0');
	begin
			L1 : for i in 0 to 15 loop
				result(i) := not(A(i)) or B(i);
			end loop L1;
		return result;
	end function Logical_implication;
	
	
------------------------------------------------------------------------------------------------	
function Multiply_4LSB(A, B: std_logic_vector(15 downto 0)) return std_logic_vector is
    variable result : std_logic_vector(15 downto 0) := (others => '0');
    variable temp_result : unsigned(7 downto 0);
begin
    temp_result := unsigned(A(3 downto 0)) * unsigned(B(3 downto 0));
    result(7 downto 0) := std_logic_vector(temp_result);
    return result;
end function Multiply_4LSB;

----------------------------------------------------------------------------------------
function LHI(A, B: std_logic_vector(15 downto 0)) return std_logic_vector is
    variable result : std_logic_vector(15 downto 0) := (others => '0');
begin
    result(15 downto 8) := B(7 downto 0);
    result(7 downto 0) := A(7 downto 0);
    return result;
end function LHI;


--------------------------------------------------------------------------------------


function LLI(A, B: std_logic_vector(15 downto 0)) return std_logic_vector is
    variable result : std_logic_vector(15 downto 0) := (others => '0');
begin
    result(15 downto 8) := A(7 downto 0);
    result(7 downto 0) := B(7 downto 0);
    return result;
end function LLI;
---------------------------------------------------------------------------------------

signal ALU_opcode : std_logic_vector(3 downto 0);

------------------------------------------------------------------------------------------
begin

		ALU_opcode <= ALU_IR(15 downto 12);
	ALU_Process : process(ALU_A, ALU_B, ALU_S, ALU_IR, ALU_opcode, ALU_IP)
	begin
		
	----------
		if ALU_S = "0001" then  ---state1
			ALU_C <= ADD_16(ALU_A, ALU_B);	
			Z <= '0';
			end if;
	-------------------------------------------------------------------
		if ALU_S = "0011" then ---state3
				if ALU_opcode = "0000"  or ALU_opcode = "0001" or ALU_opcode = "1010" or ALU_opcode = "1011" then 
							ALU_C <= ADD_16(ALU_A, ALU_B);	
							Z <= '0';
				elsif ALU_opcode = "0010" then
							ALU_C <= Subtraction(ALU_A, ALU_B);  
							Z <= '0';
				elsif ALU_opcode = "0011" then
							ALU_C <= Multiply_4LSB(Alu_A, ALU_B);
							Z <= '0';
				elsif ALU_opcode = "0100" then
							ALU_C <= Logical_and(ALU_A, ALU_B);
							Z <= '0';
				elsif ALU_opcode = "0101" then
							ALU_C <= Logical_or(ALU_A, ALU_B);
							Z <= '0';
				elsif ALU_opcode = "0110" then
							ALU_C <= Logical_implication(ALU_A, ALU_B);
							Z <= '0';
				elsif ALU_opcode = "1000" then
							ALU_C <= LHI(ALU_A, ALU_B);
							Z <= '0';
				elsif ALU_opcode = "1001" then
							ALU_C <= LLI(ALU_A, ALU_B);
							Z <= '0';
							end if;
							
							end if;
		 if ALU_opcode = "1100" then        ---BEQ
							
							if ALU_A = ALU_B then
							Z <= '1';  ---one on equality
							ALU_C <= ADD_16_6digit(ALU_IP,ALU_IR);
							else
							Z <= '0';
							ALU_C <= ADD_16(ALU_IP,"0000000000000001");
							end if;
	
			end if;


		if ALU_S = "1010" then ---state10
				ALU_C <= ADD_16(ALU_A, ALU_B);
				Z <= '0';
		end if;
	end process ALU_Process;
	
end architecture Structure_ALU;