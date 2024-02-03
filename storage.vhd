library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity storageofsignals is
    port(WE, clk: in std_logic;
		   IP, Din: in std_logic_vector(15 downto 0);
		   Dout: out std_logic_vector(15 downto 0));
end storageofsignals;
--65535
architecture bhv of storageofsignals is
	signal s0: std_logic_vector(15 downto 0):="0000000000000000";
	signal s1: std_logic_vector(15 downto 0):="0000000000000000";
	signal s2: std_logic_vector(15 downto 0):="0000000000000000";
	signal s3: std_logic_vector(15 downto 0):="0000000000000000";
	signal s4: std_logic_vector(15 downto 0):="0000000000000000";
	signal s5: std_logic_vector(15 downto 0):="0000000000000000";
	signal s6: std_logic_vector(15 downto 0):="0000000000000000";
	signal s7: std_logic_vector(15 downto 0):="0000000000000000";
	signal s8: std_logic_vector(15 downto 0):="0000000000000000";
	signal s9: std_logic_vector(15 downto 0):="0000000000000000";
	signal s10: std_logic_vector(15 downto 0):="0000000000000000";
	signal s11: std_logic_vector(15 downto 0):="0000000000000000";
	signal s12: std_logic_vector(15 downto 0):="0000000000000000";
	signal s13: std_logic_vector(15 downto 0):="0000000000000000";
	signal s14: std_logic_vector(15 downto 0):="0000000000000000";
	signal s15: std_logic_vector(15 downto 0):="0000000000000000";
	
begin
anyname:process(IP)
begin
    if(to_integer(unsigned(IP))=0) then
	   if(WE = '1') then
		s0 <= Din;
      else
		Dout <= s0;
		end if;
	 elsif(to_integer(unsigned(IP))=1) then
	   if(WE = '1') then
		s1 <= Din;
      else
		Dout <= s1;
		end if;
	 elsif(to_integer(unsigned(IP))=2) then
	   if(WE = '1') then
		s2 <= Din;
      else
		Dout <= s2;
		end if;
	elsif(to_integer(unsigned(IP))=3) then
	   if(WE = '1') then
      s3 <= Din;
      else
      Dout <= s3;
      end if;
   elsif(to_integer(unsigned(IP))=4) then
      if(WE = '1') then
      s4 <= Din;
      else
      Dout <= s4;
      end if;
	elsif(to_integer(unsigned(IP))=5) then
		 if(WE = '1') then
		 s5 <= Din;
		 else
		 Dout <= s5;
		 end if;
	elsif(to_integer(unsigned(IP))=6) then
		 if(WE = '1') then
			  s6 <= Din;
		 else
			  Dout <= s6;
		 end if;
	elsif(to_integer(unsigned(IP))=7) then
		 if(WE = '1') then
		 s7 <= Din;
		 else
		 Dout <= s7;
		 end if;
	elsif(to_integer(unsigned(IP))=8) then
		 if(WE = '1') then
		 s8 <= Din;
		 else
		 Dout <= s8;
		 end if;
	elsif(to_integer(unsigned(IP))=9) then
		 if(WE = '1') then
		 s9 <= Din;
		 else
		 Dout <= s9;
		 end if;
	elsif(to_integer(unsigned(IP))=10) then
		 if(WE = '1') then
		 s10 <= Din;
		 else
		 Dout <= s10;
		 end if;
	elsif(to_integer(unsigned(IP))=11) then
		 if(WE = '1') then
		 s11 <= Din;
		 else
	    Dout <= s11;
		 end if;
	elsif(to_integer(unsigned(IP))=12) then
		 if(WE = '1') then
		 s12 <= Din;
		 else
		 Dout <= s12;
		 end if;
	elsif(to_integer(unsigned(IP))=13) then
		 if(WE = '1') then
		 s13 <= Din;
		 else
		 Dout <= s13;
		 end if;
	elsif(to_integer(unsigned(IP))=14) then
		 if(WE = '1') then
		 s14 <= Din;
		 else
		 Dout <= s14;
		 end if;
	elsif(to_integer(unsigned(IP))=15) then
		 if(WE = '1') then
		 s15 <= Din;
		 else
		 Dout <= s15;
		 end if;
	end if;

end process;
	
end bhv;