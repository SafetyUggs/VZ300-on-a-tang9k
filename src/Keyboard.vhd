library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity Keyboard is
    port (
    --Inputs
        UART_Reset : in std_logic;
        VDP_Interrupt : in std_logic;
        CPU_Address : in std_logic_vector(15 downto 0);
        CLK25MHZ : in std_logic;

        Serial_RX : in std_logic;
    --Outputs\
        KeyData : out std_logic_vector(5 downto 0);
        Serial_TX : out std_logic
        
    );

end entity Keyboard;

architecture Behavioral of Keyboard is


signal ByteBuffer : std_logic_vector(7 downto 0);
signal KeyBuffer : std_logic_vector(5 downto 0);
signal RX_Strobe : std_logic;
signal TypeRateCounter : integer;
                                                       --5  4   3   2       1   0   <-BIT POSITIONS
signal regFE : std_logic_vector(5 downto 0):="000000"; --R  Q   E           W   T
signal regFD : std_logic_vector(5 downto 0):="000000"; --F  A   D   ctrl    S   G
signal regFB : std_logic_vector(5 downto 0):="000000"; --V  Z   C   shft    X   B
signal regF7 : std_logic_vector(5 downto 0):="000000"; --4  1   3           2   5
signal regEF : std_logic_vector(5 downto 0):="000000"; --M  spc ,           .   N
signal regDF : std_logic_vector(5 downto 0):="000000"; --7  0   8   -       9   6 
signal regBF : std_logic_vector(5 downto 0):="000000"; --U  P   I   retn    O   Y
signal reg7F : std_logic_vector(5 downto 0):="000000"; --J  ;   K   :       L   H
component UART_MASTER_Top
	port (
    i_Clk       : in  std_logic;
    i_RX_Serial : in  std_logic;
    o_RX_DV     : out std_logic;
    o_RX_Byte   : out std_logic_vector(7 downto 0)
    );
end component;
begin
process (RX_Strobe,VDP_Interrupt)
begin
    if RX_Strobe='1' then
        TypeRateCounter<=0;
        if ByteBuffer=X"03" then regFD(2)<='1'; regDF(2)<='1'; end if; -- 'BREAK' = ctrl + -
        if ByteBuffer=X"7F" then regFD(2)<='1'; regEF(5)<='1'; end if; -- 'Backspace' = ctrl + M
        if ByteBuffer=X"22" then regFB(2)<='1'; regF7(1)<='1'; end if; -- '"' = SHIFT + 2
        if ByteBuffer=X"24" then regFB(2)<='1'; regF7(5)<='1'; end if; -- '$' = SHIFT + 4

        if ByteBuffer=X"3D" then regFB(2)<='1'; regDF(2)<='1'; end if; -- '=' shift -
        if ByteBuffer=X"28" then regFB(2)<='1'; regDF(3)<='1'; end if; -- '(' shift 8
        if ByteBuffer=X"29" then regFB(2)<='1'; regDF(1)<='1'; end if; -- ')' shift 9
        if ByteBuffer=X"2C" then regEF(3)<='1'; end if; -- ','
        if ByteBuffer=X"2D" then regDF(2)<='1'; end if; -- '-'
        if ByteBuffer=X"3B" then reg7F(4)<='1'; end if; -- ';'
        if ByteBuffer=X"2B" then regFB(2)<='1'; reg7F(4)<='1'; end if; -- '+' SHIFT AND ;


        if ByteBuffer=X"30" then regDF(4)<='1'; end if; -- '0'
        if ByteBuffer=X"31" then regF7(4)<='1'; end if; -- '1'
        if ByteBuffer=X"32" then regF7(1)<='1'; end if; -- '2'
        if ByteBuffer=X"33" then regF7(3)<='1'; end if; -- '3'
        if ByteBuffer=X"34" then regF7(5)<='1'; end if; -- '4'
        if ByteBuffer=X"35" then regF7(0)<='1'; end if; -- '5'
        if ByteBuffer=X"36" then regDF(0)<='1'; end if; -- '6'
        if ByteBuffer=X"37" then regDF(5)<='1'; end if; -- '7'
        if ByteBuffer=X"38" then regDF(3)<='1'; end if; -- '8'
        if ByteBuffer=X"39" then regDF(1)<='1'; end if; -- '9'


        if ByteBuffer=X"41" then regFD(4)<='1'; end if; -- 'A'
        if ByteBuffer=X"42" then regFB(0)<='1'; end if; -- 'B'
        if ByteBuffer=X"43" then regFB(3)<='1'; end if; -- 'C'
        if ByteBuffer=X"44" then regFD(3)<='1'; end if; -- 'D'
        if ByteBuffer=X"45" then regFE(3)<='1'; end if; -- 'E'
        if ByteBuffer=X"46" then regFD(5)<='1'; end if; -- 'F'
        if ByteBuffer=X"47" then regFD(0)<='1'; end if; -- 'G'
        if ByteBuffer=X"48" then reg7F(0)<='1'; end if; -- 'H'
        if ByteBuffer=X"49" then regBF(3)<='1'; end if; -- 'I'
        if ByteBuffer=X"4A" then reg7F(5)<='1'; end if; -- 'J'
        if ByteBuffer=X"4B" then reg7F(3)<='1'; end if; -- 'K'
        if ByteBuffer=X"4C" then reg7F(1)<='1'; end if; -- 'L'
        if ByteBuffer=X"4D" then regEF(5)<='1'; end if; -- 'M'
        if ByteBuffer=X"4E" then regEF(0)<='1'; end if; -- 'N'
        if ByteBuffer=X"4F" then regBF(1)<='1'; end if; -- 'O'
        if ByteBuffer=X"50" then regBF(4)<='1'; end if; -- 'P'
        if ByteBuffer=X"51" then regFE(4)<='1'; end if; -- 'Q'
        if ByteBuffer=X"52" then regFE(5)<='1'; end if; -- 'R'
        if ByteBuffer=X"53" then regFD(1)<='1'; end if; -- 'S'
        if ByteBuffer=X"54" then regFE(0)<='1'; end if; -- 'T'
        if ByteBuffer=X"55" then regBF(5)<='1'; end if; -- 'U'
        if ByteBuffer=X"56" then regFB(5)<='1'; end if; -- 'V'
        if ByteBuffer=X"57" then regFE(1)<='1'; end if; -- 'W'
        if ByteBuffer=X"58" then regFB(1)<='1'; end if; -- 'X'
        if ByteBuffer=X"59" then regBF(0)<='1'; end if; -- 'Y'
        if ByteBuffer=X"5A" then regFB(4)<='1'; end if; -- 'Z'

        if ByteBuffer=X"20" then regEF(4)<='1'; end if; -- ' ' SPACE
        if ByteBuffer=X"0D" then regBF(2)<='1'; end if; -- ' ' RETURN

    else
        if falling_edge(VDP_Interrupt) and TypeRateCounter < 1000 then
            TypeRateCounter<=TypeRateCounter+1;
            if TypeRateCounter=3 then --CLR THE KEYBOARD BUFFER AFTER 5 V-BLANK FRAMES
                regFE<="000000";
                regFD<="000000";
                regFB<="000000";
                regF7<="000000";
                regEF<="000000";
                regDF<="000000";
                regBF<="000000";
                reg7F<="000000";
            end if;
        end if;
    end if;
end process;


KeyData<=KeyBuffer xor "111111" when TypeRateCounter < 3 else "111111" ; --HOLD THE DATA VALID FOR 3 VBLANK FRAMES

process (RX_Strobe, CPU_Address)
begin
    if CPU_Address(7 downto 0)=X"FE" then
        KeyBuffer<=RegFE;
    elsif CPU_Address(7 downto 0)=X"FD" then
        KeyBuffer<=RegFD;
    elsif CPU_Address(7 downto 0)=X"FB" then
        KeyBuffer<=RegFB;
    elsif CPU_Address(7 downto 0)=X"F7" then
        KeyBuffer<=RegF7;
    elsif CPU_Address(7 downto 0)=X"EF" then
        KeyBuffer<=RegEF;
    elsif CPU_Address(7 downto 0)=X"DF" then
        KeyBuffer<=RegDF;
    elsif CPU_Address(7 downto 0)=X"BF" then
        KeyBuffer<=RegBF;
    elsif CPU_Address(7 downto 0)=X"7F" then
        KeyBuffer<=Reg7F;
    else
        KeyBuffer<="111111";
    end if;

end process;




SerialUART: UART_MASTER_Top
	port map (
		I_CLK => CLK25MHZ,
		i_RX_Serial => Serial_RX,
		o_RX_DV => RX_Strobe,
		o_RX_Byte => ByteBuffer
	);
end Behavioral; --
