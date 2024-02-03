library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.gates.all;

entity DataFlow_2 is
    port (state : in  std_logic_vector(3 downto 0); reset : in std_logic; Clock : in std_logic; 
	 A: in std_logic; B: in std_logic; C: in std_logic_vector(1 downto 0); 
	 D: in std_logic; E: in std_logic; F: in std_logic_vector(1 downto 0); 
	 G: in std_logic_vector(1 downto 0); H: in std_logic_vector(1 downto 0); I: in std_logic_vector(1 downto 0); J: in std_logic;
	 EnableW : in std_logic; EnableM: in std_logic; IR_for_FSM: out std_logic_vector(15 downto 0);ZeroFlag: out std_logic;
	 Ro0, Ro1, Ro2, Ro3, Ro4, Ro5, Ro6, Ro7: out std_logic_vector(15 downto 0);
	 m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15 : out STD_LOGIC_VECTOR (15 downto 0));

end DataFlow_2;

architecture tructural of DataFlow_2 is
    signal InnerIR, InnerIRl: std_logic_vector(15 downto 0);
    signal T1, delaywriteforreset, T2,IR,IPdelayed, T3, shiftoutp, IP_for_testbench,SEoutput, storeout, IR8, T5, T5delay1cycle, prevIPforbeq, a1, a0, amul, jmul, f0, f1, f2, f3, fmul, i0, i1, i2, i3, imul, alu_out, g0, g1, g2, g3, kmul, gmul, h0, h1, h2, h3, hmul,e0, lmul, e1, emul, nmul, RFD1store, RFD2store, statextend, prevstatextend, prevprevstatextend,  storeoutorIR8: std_logic_vector(15 downto 0);
	 signal d1, d0, c1, c2, c3, T4, c4, cmul, dmul, b0, b1, bmul: std_logic_vector(2 downto 0);
	 signal prevstate, prevprevstate: std_logic_vector(3 downto 0):="0000";
	 signal IRinerkey:std_logic:='0';
	 signal IRkey, IRkey2, IRkey8, resetdelayed, IPKey, Ipkeydelayed, notclock, s2s5s6s7s13, Z, initialcheck, key1010, L, M: std_logic; 
	 signal K: std_logic_vector(1 downto 0);
	 signal IP : std_logic_vector(15 downto 0) := "0000000000000000";
	 


begin
correction: desperate port map(storeout => IR, IRkey => IRinerkey, reset => '0', Output => InnerIRl);
correctionagain: mux21_16bit port map(
        A0 => InnerIRL, 
        A1 => IR, 
        S => initialcheck, 
        Op => InnerIR
    );
    Registerfileqa: Register_File port map(
        RF_A1 => dmul,  --
        RF_A2 => InnerIR(8 downto 6), --
        RF_A3 => bmul,  --
        clk => clock, --
        RF_D3 => delaywriteforreset,  --
        RF_D1 => RFD1store,  ---------
        RF_D2 => RFD2store,  ---------
        RF_RE1 => '1', ---
        RF_RE2 => '1', ---
        RF_WR3 =>  EnableW, ---
		  reset => reset,
		  ro0 => ro0,
		  ro1 => ro1,
		  ro2 => ro2,
		  ro3 => ro3,
		  ro4 => ro4,
		  ro5 => ro5,
		  ro6 => ro6,
		  ro7 => ro7
    );
	 Mmultiplexer: mux21_16bit port map(
        A0 => fmul, 
        A1 => "0000000000000000",  
        S => resetdelayed, 
        Op => delaywriteforreset
    );

    Dmultiplexer: mux21 port map(
        A0 => InnerIR(11 downto 9), 
        A1 => "111", 
        S => D, 
        Op => dmul
    );

    Cmultiplexer: mux41_3bit port map(
        A0 => InnerIR( 5 downto 3), 
        A1 => InnerIR(11 downto 9), 
        A2 => InnerIR(8 downto 6), 
        A3 => c3, 
        S => C, 
        Op => cmul
    );

    Bmultiplexer: mux21 port map(
        A0 => T4, 
        A1 => "111",  
        S => B, 
        Op => bmul
    );

    Fmultiplexer: mux41 port map(
        A0 => alu_out, 
        A1 => nmul, 
		  A2 => alu_out, 
        A3 => T3, 
        S => F, 
        Op => fmul
    );

    Gmultiplexer: mux41 port map(
        A0 => lmul, 
        A1 => T5, 
        A2 => g2, 
        A3 => T1, 
        S => G, 
        Op => gmul
    );

    Hmultiplexer: mux41 port map(
        A0 => SEoutput, 
        A1 => kmul, 
        A2 => T2, 
        A3 => h3, 
        S => H, 
        Op => hmul
    );

    Emultiplexer: mux21_16bit port map(
        A0 => RFD2store, 
        A1 => SEoutput, 
        S => E, 
        Op => emul
    );
    
    Amultiplexer: mux21_16bit port map(
        A0 => IP, 
        A1 => T3, 
        S => A,  
        Op => amul
    );
    
    Imultiplexer: mux41 port map(
        A0 => Alu_oUt, 
        A1 => shiftoutp, 
        A2 => storeout, 
        A3 => i3, 
        S => I, 
        Op => imul
    );
	 Jmultiplexer: mux21_16bit port map(
        A0 => RFD1store, 
        A1 => SEoutput, 
        S => J,  
        Op => jmul
    );
	 Kmultiplexer: mux41 port map(
        A0 => "0000000000000001", 
        A1 => SEoutput, 
		  A2 => RFD2store,
		  A3 => "0000000000000001",
        S => K, 
        Op => kmul
    );
	 Lmultiplexer: mux21_16bit port map(
        A0 => RFD1store, 
        A1 => "0000000000000000", 
        S => L, 
        Op => lmul
    );--For Beq function, absolutely not optimized but the only way I can think of right now
	 dleaymultiplexer: mux21_16bit port map(
        A0 => T5, 
        A1 => prevIpForbeq,  
        S => M, 
        Op => nmul
    );
	 storeprevT5: InstructionRegister port map(
       Input => T5,  
       clock => clock,
       Load => '1',
       Output => T5delay1cycle
    );
	 add1: Bit16Adder port map(A => T5delay1cycle, B => "0000000000000001", M => '0', S => prevIPForbeq);
	 
	 
	 lselecto: L <= NOT state(3) AND NOT state(2) AND NOT state(1) AND state(0) AND IR(15) AND IR(14) AND IR(13) AND IR(12);
	 kk: K(0) <= NOT state(3) AND NOT state(2) AND NOT state(1) AND state(0) AND IR(15) AND IR(14) AND NOT IR(13) AND IR(12);
	 kk2: K(1) <= L OR (NOT state(3) AND NOT state(2) AND NOT state(1) AND state(0) AND IR(15) AND IR(14) AND (NOT IR(13)) AND (NOT IR(12)));
	 Mselecto: M <= (state(3) AND state(2) AND state(1) AND (NOT state(0))) AND IR(15) AND IR(14) AND NOT IR(13) AND NOT IR(12);
	 isthestateinitial: Count3 port map(clock => clock, Y => initialcheck);
    IRk: IRkey <= ((NOT state(3)) AND (NOT state(2)) AND (NOT state(1)) AND state(0));
    IRink: IRinerkey <= ((NOT state(3)) AND (NOT state(2)) AND (NOT state(1)) AND state(0)) OR NOT initialcheck;             
	 Irk2: IRkey2 <= ((NOT state(3)) AND state(2) AND (NOT state(1)) AND (NOT state(0))) OR
						  (state(3) AND (NOT state(2)) AND (NOT state(1)) AND state(0)) OR
						  (state(3) AND (NOT state(2)) AND state(1) AND (NOT state(0))) OR
						  (state(3) AND state(2) AND (NOT state(1)) AND (NOT state(0))) OR
						  (state(3) AND state(2) AND state(1) AND state(0)) OR
						  (((NOT state(3)) AND (NOT state(2)) AND (NOT state(1)) AND state(0)) AND ( NOT initialcheck)) OR
						  reset;
						  
               
                  
    s2s5s6s7s13 <= (((NOT state(3)) AND (NOT state(2)) AND state(1) AND 
                     (NOT state(0))) OR
                    ((NOT state(3)) AND state(2) AND (NOT state(1)) AND  
                     state(0)) OR
                    ((NOT state(3)) AND state(2) AND state(1) AND  
                     (NOT state(0))) OR 
                    ((NOT state(3)) AND state(2) AND state(1) AND  
                     state(0)) OR
                    (state(3) AND state(2) AND (NOT state(1)) AND  
                     state(0)));
                     
    IRtostoreinstruction: desperate port map(storeout => storeoutorIR8, IRkey => IRkey2, reset => resetdelayed, Output => IR);
	 
	 -- Some lines after this to rectify next instruction in 1010
	 
	 IRk8: IRkey8 <= ((NOT prevstate(3)) AND prevstate(2) AND (prevstate(1)) AND prevstate(0));
	 IRtostoreinstructionwhenstate8: desperate port map(storeout => storeoutorIR8, IRkey => IRkey8, reset => '0', Output => IR8);
	 statextend <= "000000000000" & state;
	 extendstateto16bits: InstructionRegister port map( Input => statextend, 
        clock => clock, 
        Load => '1', 
        Output=> prevstatextend
    );
	 extendstateto16bitsagain: InstructionRegister port map( Input => prevstatextend, 
        clock => clock, 
        Load => '1', 
        Output=> prevprevstatextend
    );
	 
	 prevstate <= prevstatextend(3 downto 0);
	 prevprevstate <= prevprevstatextend(3 downto 0);
	 Keytocheck1010: Key1010 <= ((NOT prevprevstate(3)) AND prevprevstate(2) AND prevprevstate(1) AND prevprevstate(0));
	 asignIR: mux21_16bit port map(
	 A0 => storeout,
	 A1 => IR8,
	 S => key1010,
	 Op => storeoutorIR8
	 );
	 IR_FOR_FSM <= IR;---------------------------------------------------Done

    Temporaryregister1: InstructionRegister port map(
        Input => jmul, 
        clock => clock, 
        Load => '1', 
        Output => T1
    );

    Temporaryregister2: InstructionRegister port map(
       Input => emul,  
       clock => clock,
       Load => '1',
       Output => T2
    );
 
    Temporaryregister3: InstructionRegister port map (
	 Input => imul, 
	 clock => clock, 
	 Load => '1', 
	 Output => T3
	 );
	 
	 Temporaryregister4: InstructionRegister3bit port map (
	 Input => cmul, 
	 clock => clock, 
	 Load => '1', 
	 Output => T4
	 );
	 IPtotakeinr7: IPkey <= (dmul(1) AND dmul(0) AND dmul(2)) OR (NOT state(3) AND NOT state(2) AND NOT state(1) AND state(0) AND IR(15) AND IR(14) AND (NOT IR(13)) AND (NOT IR(12)));
	 IPtotakeinr7delay: dff_reset port map ( D => IPkey, clock => clock, reset => '0', Q => IPkeydelayed );
	 notclock <= not clock;
	 reset7delay: dff_reset port map ( D => reset, clock => notclock, reset => '0', Q => resetdelayed );
	 instructionpointer: desperate port map(storeout => alu_out, IRkey => IPkeydelayed, reset => '0', Output => IP);
	 
	 IP_for_testbench <= IP;
	 
	 Temporaryregister5: InstructionRegister port map (
	 Input => RFD1store, 
	 clock => clock, 
	 Load => IRkey, 
	 Output => T5
	 );
	 
	 ArithmeticLogical: ALU port map (
	 ALU_A => gmul,
	 ALU_B => hmul,
	 ALU_S => state,
	 ALU_IP => IP,
	 ALU_IR => IR(15 downto 0),
	 ALU_C => Alu_out,
	 Z => Zeroflag
	 );
	 
	 shifters: Shifter port map (
	 Input => InnerIR, 
	 opcode => InnerIR(15 downto 12),
	 Output => shiftoutp
	 );
	 
	 SE: SignExtender port map(
	 Input => InnerIR,
	 opcode => InnerIR(15 downto 12),
	 Output => SEoutput
	 );
	 
	 memory_rom : memory port map(
	 IP => amul,
	 Din => T1,
	 clk => clock,
	 reset => reset, 
	 WE => EnableM, Dout => storeout,
	 m0 => m0, m1 => m1, m2 => m2, m3 => m3, m4 => m4, m5 => m5, m6 => m6, m7 => m7, m8 => m8,
	 m9 => m9, m10 => m10, m11 => m11, m12 => m12, m13 => m13, m14 => m14, m15 => m15
	 );

end tructural;