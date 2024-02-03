library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
    port(
	   WE,clk,reset: in std_logic;
		IP,Din: in std_logic_vector(15 downto 0);
		Dout: out std_logic_vector(15 downto 0);
		m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15 : out STD_LOGIC_VECTOR (15 downto 0)
		);
end memory;
--16
architecture bhv of memory is
   signal IPforreset: std_logic_vector(15 downto 0);
	type mem_index is array(31 downto 0) of std_logic_vector(15 downto 0);
	signal mem: mem_index := (
	0 => "0000000001010000",
1 => "0000010001010000",
2 => "0010101010010000",
3 => "0011100101010000",
4 => "0100000001010000",
5 => "0101000001010000",
6 => "1010101011000001",
7 => "0110000001010000",
8 => "1011100011000001",
--9 => "0001000010000110",
--10=> "0001000010111010",
9 => "1100110000000010",
10=> "1001110000000010",
11=> "0001011010111110",
12=> "0001011010001110",
13=> "1101000000000011",
14=> "0000000000000000",
15=> "1100000001000001",
16=> "1001100000000001",
17=> "1100011100000011",
--15=> "1101000111111001",
19=> "0001000000000001",
20=> "1111001000000000",
23=> "0000000000000000",
24=> "1011001001001111",
25=> "1010010001001111",
26=> "0000010000010000",

--13=> "1100010000000011",
--14=> "1100010010000010",
--16=> "0001010010000001",
--17=> "1111110010010010",
--18=> "1101010111111111",
--19=> "1011010011011111",
--20=> "1010010011011111",
--21=> "0000010000001000",
others => "1101000000000000");
	
begin

  
memory_write: process(clk, WE, Din, IP)
    begin
        if(clk' event and clk = '1') then
            if (WE = '1') then
                mem(to_integer(unsigned(IP))) <= Din;
            else 
                null;
            end if;
        else
            null;
        end if;
    end process;

memory_read: process(clk, IP)
    begin
        if falling_edge(clk) then
		          if(reset='0') then
                Dout <= mem(to_integer(unsigned(IP)));
					 else
					 Dout <= mem(0);
					 end if;
        end if;
    end process;


m0 <= mem(0);
m1 <= mem(1);
m2 <= mem(2);
m3 <= mem(3);
m4 <= mem(4);
m5 <= mem(5);
m6 <= mem(6);
m7 <= mem(7);
m8 <= mem(8);
m9 <= mem(9);
m10 <= mem(10);
m11 <= mem(11);
m12 <= mem(12);
m13 <= mem(13);
m14 <= mem(14);
m15 <= mem(15);
	
end bhv;