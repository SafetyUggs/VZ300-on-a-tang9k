library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity VideoGen is
    port (
    --Inputs
        PixelClock : in std_logic;
        CHRROMData : in std_logic_vector(7 downto 0);
        VRAMData : in std_logic_vector(7 downto 0);

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

--Screen is made up of 256 x 128 pixels
--32 x 16 chrs
--ChrROM is made up of 512 chrs, 8 bytes each chr

signal CurrentChr : std_logic_vector(8 downto 0);
signal CurrentChrLine : std_logic_vector(2 downto 0);
signal PixelValue : std_logic;


begin
ActiveArea<=HDMIActiveAreaX and HDMIActiveAreaY;
VRAMAddress<='0'&ViewPortY(7 downto 3)   & ViewPortX(7 downto 3);
CurrentChr<=VRAMData & '0'; 
CurrentChrLine<=Ycounter(2 downto 0);
CHRROMAddress<=CurrentChr & CurrentChrLine;

Red<="00000000";
Green<=PixelValue & PixelValue & "000000";
Blue<="00000000";

Interrupt<='0' when  Ycounter=1 else '1' ;

process (PixelClock)
begin

    if rising_edge(PixelClock) then
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

end process;
        
process(PixelClock) -- These timings are mosty for the HDMI signal timing. You can change these for VGA, RGB etc.
begin --
    if rising_edge(PixelClock) then
        Xcounter<=Xcounter+1;
        if Xcounter=800 then 
            Xcounter<="0000000000";
            Ycounter<=Ycounter+1;
            ViewPortY<=ViewPortY+1;
            if Ycounter=525 then        
                Ycounter<="0000000000";
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
        if Xcounter>=80 and Xcounter <80+256 then
            HDMIActiveAreaX<='1';
            ViewPortX<=ViewPortX+1;
         else
            HDMIActiveAreaX<='0';
            ViewPortX<="00000111";
        end if;
        if  Ycounter>=24 and Ycounter<24+128 then
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
