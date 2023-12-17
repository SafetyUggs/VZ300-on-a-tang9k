library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity VideoGen is
    port (
    --Inputs
        CPU_CLK : in std_logic;
        PixelClock : in std_logic;
        CHRROMData : in std_logic_vector(7 downto 0);
        VRAMData : in std_logic_vector(7 downto 0);
        VDC_BackgroundBit : in std_logic;
        VDC_ModeBit : in std_logic;

    --Outputs\
        CHRROMAddress : out std_logic_vector(11 downto 0);
        VRAMAddress: out std_logic_vector(10 downto 0);

        RED : out std_logic_vector(7 downto 0);
        GREEN : out std_logic_vector(7 downto 0);
        BLUE : out std_logic_vector(7 downto 0);

        Hsync : out std_logic;
        Vsync : out std_logic;
        DisplayEnable : out std_logic;
        ActiveArea : out std_logic;
        Interrupt : out std_logic
        
    );

end entity VideoGen;



architecture Behavioral of VideoGen is
signal HDMIActiveAreaX : std_logic;
signal HDMIActiveAreaY : std_logic;
signal Xcounter : std_logic_vector (9 downto 0); --for hdmi generation
signal Ycounter : std_logic_vector (9 downto 0);
signal ViewPortX : std_logic_vector(7 downto 0);
signal ViewPortY : std_logic_vector(7 downto 0):="00000000"; --actual pixel location on the active few port (256 x 128)
signal XSubpixelCounter : std_logic_vector(2 downto 0);
signal ChrLineBuffer : std_logic_vector(7 downto 0);
signal GFXLineBuffer : std_logic_vector(7 downto 0);
signal BackGroundColor : std_logic_vector(23 downto 0);

signal GFXbackgroundColor : std_logic_vector(23 downto 0);
signal GFXColor00 : std_logic_vector(23 downto 0);
signal GFXColor01 : std_logic_vector(23 downto 0);
signal GFXColor10 : std_logic_vector(23 downto 0);
signal GFXColor11 : std_logic_vector(23 downto 0);
signal GFXpixelColor : std_logic_vector(1 downto 0);


--Screen is made up of 256 x 128 pixels
--32 x 16 chrs
--ChrROM is made up of 512 chrs, 8 bytes each chr

signal CurrentChr : std_logic_vector(8 downto 0);
signal CurrentChrLine : std_logic_vector(2 downto 0);
signal PixelValue : std_logic;

signal ScalingCounterY : std_logic;
signal ScalingCounterX : std_logic;


begin
ActiveArea<=HDMIActiveAreaX and HDMIActiveAreaY;
VRAMAddress<='0'&ViewPortY(7 downto 3)   & ViewPortX(7 downto 3) when VDC_ModeBit='0' else ViewPortY(6 downto 1) & ViewPortX(7 downto 3);  --in gfx mode, 128 pixel are drawn, from 32 bytes of vram per line. ;
CurrentChr<=VRAMData & '0'; 
CurrentChrLine<=ViewPortY(2 downto 0);
CHRROMAddress<=CurrentChr & CurrentChrLine;  

BackGroundColor<=X"00" & X"FF" & X"00" when VDC_BackgroundBit='0' else X"FF" & X"C4" & X"18"; -- R G B components of the background color in text mode FFC418 is Guy's VZEM color for 'orange'. The real buff is said to be DA A0 6D

--GFX mode color palletes
GFXColor00<=X"00FF00" when VDC_BackgroundBit='0' else X"DAA06D"; -- Green / Buff
GFXColor01<=X"FFFF00" when VDC_BackgroundBit='0' else X"00FFFF"; -- Yellow / Cyan
GFXColor10<=X"0000FF" when VDC_BackgroundBit='0' else X"FFA500"; -- Blue / Orange
GFXColor11<=X"FF0000" when VDC_BackgroundBit='0' else X"FF00FF"; -- Red / Magenta

process (PixelClock,VDC_ModeBit,GFXBackGroundColor,GFXpixelColor)
begin
  IF falling_edge(PixelClock) then
    if VDC_ModeBit='0' then --low res text
        if PixelValue='1' then
            Red<=BackGroundColor(23 downto 16);
            Green<=BackGroundColor(15 downto 8);
            Blue<=BackGroundColor(7 downto 0);
        else
            Red<="00000000";
            Green<="00000000";
            Blue<="00000000";
        end if;
    else
        if GFXpixelColor="00" then
            Red<=GFXColor00(23 downto 16);
            Green<=GFXColor00(15 downto 8);
            Blue<=GFXColor00(7 downto 0);
        elsif GFXpixelColor="01" then
            Red<=GFXColor01(23 downto 16);
            Green<=GFXColor01(15 downto 8);
            Blue<=GFXColor01(7 downto 0);
        elsif GFXpixelColor="10" then
            Red<=GFXColor10(23 downto 16);
            Green<=GFXColor10(15 downto 8);
            Blue<=GFXColor10(7 downto 0);
        else 
            Red<=GFXColor11(23 downto 16);
            Green<=GFXColor11(15 downto 8);
            Blue<=GFXColor11(7 downto 0);
        end if;
    end if;
  end if;
end process;


--GFX generator - read byte of vram, draw 4 pixels, increment byte of vram
process (PixelClock)
begin
    if rising_edge(PixelClock) then
        if ViewPortX(2 downto 1)=0 then
            GFXpixelColor<=GFXLineBuffer(7 downto 6);
        elsif ViewPortX(2 downto 1)="01" then
            GFXpixelColor<=GFXLineBuffer(5 downto 4);
        elsif ViewPortX(2 downto 1)="10" then
            GFXpixelColor<=GFXLineBuffer(3 downto 2);
        elsif ViewPortX(2 downto 1)="11" then
            GFXpixelColor<=GFXLineBuffer(1 downto 0);
        end if;
    end if;

end process;

process (PixelClock)
begin
    if falling_edge(PixelClock) then
      if Xcounter=0 then GFXLineBuffer<="00000000";else
        if ViewPortX(2 downto 0)="000" then
            GFXLineBuffer<=VRAMData;
        end if;
    end if;
end if;
end process;



process (PixelClock)
begin

    if rising_edge(PixelClock) then
      if Xcounter=0 then ChrLineBuffer<="00000000";else
        
         if ViewPortX(2 downto 0)=0 then
            ChrLineBuffer<=CHRROMData;
            PixelValue<=ChrLineBuffer(0);
        elsif ViewPortX(2 downto 0)="001" then
            PixelValue<=ChrLineBuffer(1);
        elsif ViewPortX(2 downto 0)="010" then
            PixelValue<=ChrLineBuffer(2);
        elsif ViewPortX(2 downto 0)="011" then
            PixelValue<=ChrLineBuffer(3);
        elsif ViewPortX(2 downto 0)="100" then
            PixelValue<=ChrLineBuffer(4);
        elsif ViewPortX(2 downto 0)="101" then
            PixelValue<=ChrLineBuffer(5);
        elsif ViewPortX(2 downto 0)="110" then
            PixelValue<=ChrLineBuffer(6);
        elsif ViewPortX(2 downto 0)="111" then
            PixelValue<=ChrLineBuffer(7);
        end if;
    end if;
end if;
end process;
        
process (CPU_CLK)
begin
    if rising_edge(cpu_clk) then
            if Ycounter=1 then Interrupt<='0'; else Interrupt<='1';end if;
     end if;
end process;

process(PixelClock) -- These timings are mosty for the HDMI signal timing. You can change these for VGA, RGB etc.
begin --
    if rising_edge(PixelClock) then
        Xcounter<=Xcounter+1;
        if Xcounter=800 then 
            Xcounter<="0000000000";
            Ycounter<=Ycounter+1;
            ScalingCounterY<=not ScalingCounterY;
            if ScalingCounterY='1' then ViewPortY<=ViewPortY+1;end if;
        
            if Ycounter=525 then        
                Ycounter<="0000000000";
                ScalingCounterY<='0';
            end if;

        end if;
        if Xcounter>=656 and Xcounter <752 then
            Hsync<='1';
        else        
            Hsync<='0';
        end if;
        if Ycounter>=490 and Ycounter <492 then
            Vsync<='1';
        else        
            Vsync<='0';
        end if;
        if Xcounter>=80 and Xcounter <80+258 then
            HDMIActiveAreaX<='1';
            ViewPortX<=ViewPortX+1;
         else
            HDMIActiveAreaX<='0';
            if VDC_ModeBit='0' then ViewPortX<="00000111"; else ViewPortX<="00000110"; end if;
        end if;
        if  Ycounter>=24 and Ycounter<24+(128*2) then --x2 is scaling
            HDMIActiveAreaY<='1';
         else
            HDMIActiveAreaY<='0';
            ViewPortY<="00000000";
        end if;
        if Xcounter<640 and Ycounter<480 then
            DisplayEnable<='1';
         else
            DisplayEnable<='0';
        end if;
end if;
end process;
end Behavioral; --
