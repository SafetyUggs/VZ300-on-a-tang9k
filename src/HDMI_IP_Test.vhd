
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 


 
 entity Main is
	Port(
	
		clkin_i    : in  std_logic; --27mhz on board xtal oscillator
        Button1 : in std_logic;
        LEDs : out  std_logic_vector(5 downto 0);

        SerialIn : in std_logic;
        SerialOut : out std_logic;

        BoardReset : in std_logic;

        SD_I : in std_logic;
		SD_O : out std_logic;
		SD_CS : out std_logic;
		SD_Clk : out std_logic;

        O_tmds_clk_p_o: out  std_logic;
        O_tmds_clk_n_o: out  std_logic;
        O_tmds_data_p_o: out   std_logic_vector(2 downto 0);
        O_tmds_data_n_o:  out std_logic_vector(2 downto 0)
				
	);
end entity Main;
 
architecture Behavioral of Main is




signal display_enable: std_logic;
signal vsync : std_logic;
signal hsync : std_logic;
signal clk250mhz: std_logic;
signal clk125mhz: std_logic;
signal clk25mhz: std_logic;

signal LedPrescaler : std_logic_vector (22 downto 0);



signal Red : std_logic_vector(7 downto 0);
signal Green : std_logic_vector(7 downto 0);
signal Blue : std_logic_vector(7 downto 0);

signal GenRed : std_logic_vector(7 downto 0);
signal GenGreen : std_logic_vector(7 downto 0);
signal GenBlue : std_logic_vector(7 downto 0);

signal HighClkPrescale : std_logic;

signal HDMIActiveArea : std_logic;

signal OSER10RESET : std_logic;

signal SD_Buffer : std_logic_vector(7 downto 0);
SIGNAL userFlashDout : std_logic_vector(31 downto 0);
signal VZROM_Data_Out : std_logic_vector(7 downto 0);
signal DOSRAM_Data_Out : std_logic_vector(7 downto 0);
signal VZDOS_Data_Out : std_logic_vector(7 downto 0);
signal VZVRAM_Data_Out : std_logic_vector(7 downto 0);
signal VZWRAM_Data_Out : std_logic_vector(7 downto 0);
signal cpu_clk : std_logic;
signal SDport_CE : std_logic;
signal VZROM_CE : std_logic;
signal DOSRAM_CE : std_logic;
signal VZDOS_CE : std_logic;
signal VZWRAM_CE : std_logic;
signal VZVRAM_CE : std_logic;
signal Keyboard_CE : std_logic;
signal KeyByteBuffer : std_logic_vector(5 downto 0):="111111";
signal VZROM_Address_In : std_logic_vector(13 downto 0);
signal IOCTRL_CE : std_logic;

signal CPU_Reset_n: std_logic;
signal CPU_CLK_n: std_logic;
signal CPU_CLKEN: std_logic;
signal CPU_WAIT_n: std_logic;
signal CPU_INT_n: std_logic;
signal CPU_NMI_n: std_logic;
signal CPU_BUSREQ_n: std_logic;
signal CPU_M1_n: std_logic;
signal CPU_MREQ_n: std_logic;
signal CPU_IOREQ_n: std_logic;
signal CPU_RD_n: std_logic;
signal CPU_WR_n: std_logic;
signal CPU_RFSH_n: std_logic;
signal CPU_HALT_n: std_logic;
signal CPU_BUSAK_n: std_logic;
signal CPU_A: std_logic_vector(15 downto 0);
signal CPU_DI: std_logic_vector(7 downto 0);
signal CPU_DO: std_logic_vector(7 downto 0);
signal clk_cpu : std_logic;
signal clk5mhz : std_logic;
signal SysReset : std_logic;


signal VideoGen_Address : std_logic_vector(10 downto 0);
signal VideoGen_Data : std_logic_vector(7 downto 0);
signal CHRROM_Address : std_logic_vector(11 downto 0);
signal CHRROM_Data : std_logic_vector(7 downto 0);

signal VDC_BackgroundBit : std_logic;
signal VDC_ModeBit : std_logic;
signal Cassette_LSB : std_logic;
signal Cassette_MSB : std_logic;
signal SpeakerABit : std_logic;
signal SpeakerBBit : std_logic;

signal AmoreAccurateClk : std_logic;
signal AmoreAccurateClkCounter : integer;

signal LED_Latch : std_logic_vector(7 downto 0);
signal LED_WR : std_logic;

--------SD card stuff
signal PortSDconfigOut : std_logic;
signal PortSDin : std_logic;
signal PortSDout : std_logic;
signal PortMapperOut : std_logic;
signal PortRAMmapOut : std_logic;

---------------SPI Signals
signal SPIinBuffer  : std_logic_vector (7 downto 0);

signal SPIoutBuffer : std_logic_vector (7 downto 0);
signal SPIBuffer		: std_logic_vector (7 downto 0);
signal SPIclkCount  : std_logic_vector (3 downto 0):="0000"; 
signal SPIclkEn	  : std_logic:='0';
signal SPISDcs		  : std_logic:='1';
signal SPI_bank_clk  : std_logic;
signal SPI_bank_Buff_clk : std_logic;
signal SPI_Readback_clk : std_logic;
signal SPItrigger : std_logic;
signal SPICLOCK : std_logic;
signal SPIclkSpeed : std_logic;
signal SD_Or : std_logic;
signal SPIAddressAccess : std_logic:='1';
signal State : std_logic_vector(1 downto 0);
signal CLKPreScale : std_logic_vector(7 downto 0);
signal Start : std_logic;

--------Constants

constant SDcfgPortNumber : integer := 56;
constant SDioPortNumber : integer := 57;

component Gowin_rPLL
    port (
        clkout: out std_logic;
        clkoutd: out std_logic;
        clkin: in std_logic
    );
end component;



component DVI_TX_Top
	port (
		I_rst_n: in std_logic;
		I_serial_clk: in std_logic;
		I_rgb_clk: in std_logic;
		I_rgb_vs: in std_logic;
		I_rgb_hs: in std_logic;
		I_rgb_de: in std_logic;
		I_rgb_r: in std_logic_vector(7 downto 0);
		I_rgb_g: in std_logic_vector(7 downto 0);
		I_rgb_b: in std_logic_vector(7 downto 0);
		O_tmds_clk_p: out std_logic;
		O_tmds_clk_n: out std_logic;
		O_tmds_data_p: out std_logic_vector(2 downto 0);
		O_tmds_data_n: out std_logic_vector(2 downto 0)
	);
end component;


component VZROM
    port (
        dout: out std_logic_vector(7 downto 0);
        clk: in std_logic;
        oce: in std_logic;
        ce: in std_logic;
        reset: in std_logic;
        ad: in std_logic_vector(13 downto 0)
    );
end component;

component CHRROM
    port (
        dout: out std_logic_vector(7 downto 0);
        clk: in std_logic;
        oce: in std_logic;
        ce: in std_logic;
        reset: in std_logic;
        ad: in std_logic_vector(11 downto 0)
    );
end component;


component VZ_VRAM
    port (
        douta: out std_logic_vector(7 downto 0);
        doutb: out std_logic_vector(7 downto 0);
        clka: in std_logic;
        ocea: in std_logic;
        cea: in std_logic;
        reseta: in std_logic;
        wrea: in std_logic;
        clkb: in std_logic;
        oceb: in std_logic;
        ceb: in std_logic;
        resetb: in std_logic;
        wreb: in std_logic;
        ada: in std_logic_vector(10 downto 0);
        dina: in std_logic_vector(7 downto 0);
        adb: in std_logic_vector(10 downto 0);
        dinb: in std_logic_vector(7 downto 0)
    );
end component;


Component T80se is
	generic(
		Mode : integer := 0;	-- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
		T2Write : integer := 0;	-- 0 => WR_n active in T3, /=0 => WR_n active in T2
		IOWait : integer := 1	-- 0 => Single cycle I/O, 1 => Std I/O cycle
	);
	port(
        RESET_n		: in std_logic;
		CLK_n		: in std_logic;
		CLKEN		: in std_logic;
		WAIT_n		: in std_logic;
		INT_n		: in std_logic;
		NMI_n		: in std_logic;
		BUSRQ_n		: in std_logic;
		M1_n		: out std_logic;
		MREQ_n		: out std_logic;
		IORQ_n		: out std_logic;
		RD_n		: out std_logic;
		WR_n		: out std_logic;
		RFSH_n		: out std_logic;
		HALT_n		: out std_logic;
		BUSAK_n		: out std_logic;
		A			: out std_logic_vector(15 downto 0);
		DI			: in std_logic_vector(7 downto 0);
		DO			: out std_logic_vector(7 downto 0)
	);
end component;

component VZ_WRAM
    port (
        dout: out std_logic_vector(7 downto 0);
        clk: in std_logic;
        oce: in std_logic;
        ce: in std_logic;
        reset: in std_logic;
        wre: in std_logic;
        ad: in std_logic_vector(13 downto 0);
        din: in std_logic_vector(7 downto 0)
    );
end component;

component VideoGen is
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
end component;


component Keyboard is

    port (
    --Inputs
        UART_Reset : in std_logic;
        VDP_Interrupt : in std_logic;
        CPU_Address : in std_logic_vector(15 downto 0);
        CLK25MHZ : in std_logic;

        Serial_RX : in std_logic;
    --Outputs\
        KeyData : out std_logic_vector(5 downto 0)
        
    );
end component;

component ROMs
    port (
        dout: out std_logic_vector(31 downto 0);
        xe: in std_logic;
        ye: in std_logic;
        se: in std_logic;
        prog: in std_logic;
        erase: in std_logic;
        nvstr: in std_logic;
        xadr: in std_logic_vector(8 downto 0);
        yadr: in std_logic_vector(5 downto 0);
        din: in std_logic_vector(31 downto 0)
    );
end component;
component DOSRAM
    port (
        dout: out std_logic_vector(7 downto 0);
        clk: in std_logic;
        oce: in std_logic;
        ce: in std_logic;
        reset: in std_logic;
        wre: in std_logic;
        ad: in std_logic_vector(11 downto 0);
        din: in std_logic_vector(7 downto 0)
    );
end component;





begin
SerialOut<=SerialIn;

SysReset<=BoardReset and Button1;

cpu_clk<=AmoreAccurateClk;--LedPrescaler(2); --CHANGE YOUR CPU CLOCK SPEED HERE. 


CPU: T80se
    port map(
        RESET_N=> SysReset,
        CLK_n=>cpu_clk,
        CLKEN=>'1',
        WAIT_n=>'1',
        INT_n=>CPU_INT_n,
        NMI_n=>'1',
        BUSRQ_n=>'1',
        M1_n=>CPU_M1_n,
        MREQ_n=>CPU_MREQ_n,
        IORQ_n=>CPU_IOREQ_n,
        RD_n=>CPU_RD_n,
        WR_n=>CPU_WR_n,
        RFSH_n=>CPU_RFSH_n,
        HALT_n=>CPU_HALT_n,
        BUSAK_n=>CPU_BUSAK_n,
        A=>CPU_A,
        DI=>CPU_DI,
        DO=>CPU_DO

    );


VZDOSandROM: ROMs
    port map (
        dout(31 downto 0) => userFlashDout,--VZDOS_Data_Out & VZROM_Data_Out,
        xe => '1',
        ye => '1',
        se => cpu_clk,
        prog => '0',
        erase => '0',
        nvstr => '0',
        xadr => '0'&CPU_A(13 downto 6),
        yadr => CPU_A(5 downto 0),
        din => X"00000000"
    );


DOS_RAM: DOSRAM
    port map (
        dout => DOSRAM_Data_Out,
        clk => cpu_clk,
        oce => not CPU_RD_n,
        ce => not DOSRAM_CE,
        reset => '0',
        wre => not CPU_WR_n,
        ad => CPU_A(11 downto 0),
        din => CPU_DO
    );
VZDOS_Data_Out<=userFlashDout(15 downto 8) ;
VZROM_Data_Out<=userFlashDout(7 downto 0);

CHRGENROM : CHRROM
    port map (
        dout => CHRROM_Data,
        clk => CLK25mhz,
        oce => '1',
        ce => '1',
        reset => not SysReset,
        ad => CHRROM_Address
    );

VZVRAM: VZ_VRAM
    port map (
        douta => VZVRAM_Data_Out,
        doutb => VideoGen_Data,
        clka => CPU_CLK,
        ocea => not CPU_RD_n,
        cea => not VZVRAM_CE,
        reseta => not SysReset,
        wrea => not CPU_WR_n,
        clkb => CLK25mhz,
        oceb => '1',
        ceb => '1',
        resetb => not SysReset,
        wreb => '0',
        ada => CPU_A(10 downto 0),
        dina => CPU_DO,
        adb => VideoGen_Address,
        dinb => "00000000"
    );



VZWRAM: VZ_WRAM
    port map (
        dout => VZWRAM_Data_Out,
        clk => CPU_CLK,
        oce => not CPU_RD_n,
        ce => not VZWRAM_CE,
        reset => not SysReset,
        wre => not CPU_WR_n,
        ad => CPU_A(13 downto 0),
        din => CPU_DO
    );

DOSRAM_CE<=NOT CPU_IOREQ_n when (CPU_A(15 downto 0) >= X"F000") and (CPU_A(15 downto 0) <= X"FFFF") else '1'; --f000 - ffff (ram for stack etc)
IOCTRL_CE<=NOT CPU_IOREQ_n when (CPU_A(15 downto 0) >= X"6800") and (CPU_A(15 downto 0) < X"7000") and CPU_WR_n='0' else '1'; --6800 to 6FFF
VZROM_CE<=NOT CPU_IOREQ_n when CPU_A(15 downto 0) < X"4000" else '1';
VZDOS_CE<=NOT CPU_IOREQ_n when (CPU_A(15 downto 0) >= X"4000") and (CPU_A(15 downto 0) < X"6800") else '1'; --4000 6800
VZWRAM_CE<=NOT CPU_IOREQ_n when (CPU_A(15 downto 0) >= X"7800") and (CPU_A(15 downto 0) < X"B800") else '1'; --7800 b800
VZVRAM_CE<=NOT CPU_IOREQ_n when (CPU_A(15 downto 0) >= X"7000") and (CPU_A(15 downto 0) < X"7800") else '1'; --7000 to 7800 
Keyboard_CE <= NOT CPU_IOREQ_n when (CPU_A(15 downto 11) = "01101")  else '1'; --7000 to 7800 
LED_WR<='0' when (CPU_A(7 downto 0) = X"80") and (CPU_WR_n='0') and CPU_IOREQ_n='0' else '1'; --Port 0x80 = LEDs

PortSDconfigOut <= '0' 	when CPU_IOREQ_n='0' and CPU_WR_n = '0' and CPU_A(7 downto 0) = SDcfgPortNumber else '1';
PortSDOut <= '0' 		when CPU_IOREQ_n='0' and CPU_WR_n = '0' and CPU_A(7 downto 0) = SDioPortNumber else '1';
PortSDIn <= '0' 		when CPU_IOREQ_n='0' and CPU_RD_n = '0' and CPU_A(7 downto 0) = SDioPortNumber else '1';

process (LED_WR)
begin
    if rising_edge(LED_WR) then
        LED_Latch<=CPU_DO;
    end if;
end process;
process (IOCTRL_CE,cpu_clk)
begin
    if rising_edge(cpu_clk) then
      if IOCTRL_CE='0' then
        VDC_BackgroundBit<=CPU_DO(4);
        VDC_ModeBit<=CPU_DO(3);
        SpeakerABit<=CPU_DO(0);
        SpeakerBBit<=CPU_DO(5);
        Cassette_MSB<=CPU_DO(2);
        Cassette_LSB<=CPU_DO(1);
      end if;
    end if;
end process;

process (PortSDconfigOut)
begin
	
	if rising_edge(PortSDconfigOut) then	
				SPIclkSpeed <= CPU_DO(0); -- Low or High speed clock mode for SPI
				SPIsdCS <= CPU_DO(1);
		end if;
end process;
  
process (PortSDOut,state)
begin
	if state>0 then Start<='0'; 
		else
			if rising_edge(PortSDout) then	
				SPIoutBuffer <= CPU_DO;
				Start<= '1';
		end if;
	end if;
end process;
  

LEDs<=LED_Latch(5 downto 0) xor "111111";

process (clk_cpu,CPU_MREQ_n,VZROM_CE,VZVRAM_CE,VZWRAM_CE,Keyboard_CE,VZWRAM_Data_Out,VZVRAM_Data_Out,VZDOS_CE,VZDOS_Data_Out,VZROM_Data_Out,CPU_RD_n,DOSRAM_CE,DOSRAM_Data_Out,CPU_INT_n,SPIinBuffer,PortSDIn,KeyByteBuffer)
begin
    if CPU_MREQ_n='0' and CPU_RD_n='0' then  
        if VZDOS_CE='0' then
            CPU_DI<=VZDOS_Data_Out;
        elsif DOSRAM_CE='0' then
            CPU_DI<=DOSRAM_Data_Out;
        elsif VZROM_CE='0' then
            CPU_DI<=VZROM_Data_Out;
        elsif VZVRAM_CE='0' then
            CPU_DI<=VZVRAM_Data_Out;
        elsif VZWRAM_CE='0' then
            CPU_DI<=VZWRAM_Data_Out;
        elsif VZWRAM_CE='0' then
            CPU_DI<=VZWRAM_Data_Out;
        elsif Keyboard_CE='0' then
            CPU_DI<=CPU_INT_n&'1'& KeyByteBuffer;
        else
            CPU_DI<="ZZZZZZZZ";
        end if;
    elsif PortSDIn='0' then 
        CPU_DI<=SPIinBuffer;
    else
        CPU_DI<="ZZZZZZZZ";
    end if;
end process;






-----------------------------------------------------------------------
-- Clock Generation
-----------------------------------------------------------------------
--All mappers common addresses


---------------------------
--SPI Code here:
---------------------------
SPIclock<=CLKprescale(7) when SPIclkSpeed='0' else cpu_clk; --Older MMC and early SD cards need a 400khz Initialisation clock. Haven't come across one yet that wont init at 1mhz
SD_Clk<=SPIclock when State="10" and (SpiClkCount > 2) else '0'; --Enable the SPI clock when we're in state 3
SD_CS <=  not SPIsdCS;

process (cpu_clk)--Clock prescaler for System Clock
begin
if rising_edge(cpu_clk) then
		ClkPrescale<=ClkPrescale+1;
end if;
end process;

--The basics of this SPI code is: A state machine with 3 states. State 1 is idle, when it gets a trigger it sets state 2. State 2 buffers the data to be sent,
--State 3 shifts out 8 bits, then it returns to idle state. Also while in state 3, we read back the spi data into anothe register.
process (SPIclock,SPIClkCount,SPIoutBuffer,state)
begin
	if (falling_edge(SPIclock)) then
		if State = "00" then
			if Start='1' then
				SPIclkCount<="0000";
				State<="01";
				end if;
			end if;
		if State="01" then 
			SPIbuffer <= SPIoutBuffer;
			spiclkcount<=spiclkcount+1;
			if spiclkcount="0001" then
				state<="10";
				end if;
			end if;
		if State= "10" then --State 1=running, 0=idle
			SPIclkCount <= SPIclkCount + 1;
			if SPIclkCount="1010" then 
				State<="00";
				end if;
			SD_O <= SPIBuffer(7);
			SPIBuffer(7 downto 1) <= SPIBuffer(6 downto 0);
			end if;
		end if;
end process;
 
 
process (SPIclock,SPIClkCount,SPIinBuffer,state)
begin
	if (rising_edge(SPIclock)) then
		if State= "10" then --State 1=running, 0=idle
			SPIinBuffer (7 downto 1) <= SPIinBuffer (6 downto 0);
			SPIinBuffer(0)<=SD_I;
		end if;
	end if;
end process;
 
   



VideoGenerator: VideoGen
    port map (
        CPU_CLK => CPU_CLK,
        PixelClock => CLK25mhz,
        CHRROMData => CHRROM_Data,
        VRAMData => VideoGen_Data,
        VDC_BackgroundBit => VDC_BackgroundBit,
        VDC_ModeBit => VDC_ModeBit,

    --Outputs\
        CHRROMAddress=>CHRROM_Address,
        VRAMAddress =>VideoGen_Address,

        RED => GenRed,
        GREEN => GenGreen,
        BLUE => GenBlue,

        Hsync=>Hsync,
        Vsync =>Vsync,
        DisplayEnable=>display_enable, 
        ActiveArea =>HDMIActiveArea,
        Interrupt =>CPU_INT_n
    );



SerialKeyboard : keyboard
   port map (

    --Inputs
        UART_Reset => SysReset,
        VDP_Interrupt => CPU_INT_n,
        CPU_Address => CPU_A,
        CLK25MHZ =>CLK25MHZ,
        Serial_RX => SerialIn,
    --Outputs\
        KeyData =>KeyByteBuffer
);




OSER10RESET<=Button1;

Red<=GenRed when HDMIActiveArea='1' else "00000000";
Green<=GenGreen when HDMIActiveArea='1' else "00000000";
Blue<=GenBlue when HDMIActiveArea='1' else "00000000";

HDMI0: DVI_TX_Top
	port map (
		I_rst_n =>  '1',
		I_serial_clk => HighClkPrescale,
		I_rgb_clk => clk25mhz,
		I_rgb_vs => vsync,
		I_rgb_hs => hsync,
		I_rgb_de => display_enable,
		I_rgb_r => Red,
		I_rgb_g => Green,
		I_rgb_b => Blue,
		O_tmds_clk_p => O_tmds_clk_p_o,
		O_tmds_clk_n => O_tmds_clk_n_o,
		O_tmds_data_p => O_tmds_data_p_o,
		O_tmds_data_n => O_tmds_data_n_o
	);


PLLClk: Gowin_rPLL --use the IP tool to set up the clock, 27mhz input, 250mhz output, 25mhz output.
    port map (
        clkout => clk250mhz,
        clkoutd => clk25mhz,
        clkin => clkin_i
    );


process(clk25mhz) --Very similar to VGA timings, front porch, back porch, video area. You can mess with the clock and resolution and push out up to a 720p signal with this chip
begin --

    if rising_edge(clk25mhz) then

    LedPrescaler<=LedPrescaler+1;

end if;
end process;


process (clk250mhz)
begin   
    if rising_edge(clk250mhz) then
        HighClkPrescale<=not HighClkPrescale; --This hdmi core needs  125mhz clk but the PLL couldn't get it on the dot, we we're using 250mhz /2
        AmoreAccurateClkCounter<=AmoreAccurateClkCounter+1;
        if AmoreAccurateClkCounter >=35 then AmoreAccurateClk<=not AmoreAccurateClk;AmoreAccurateClkCounter<=0; end if;
    end if;
end process;


		
end architecture Behavioral;


