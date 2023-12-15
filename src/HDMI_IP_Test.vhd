
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


signal VZROM_Data_Out : std_logic_vector(7 downto 0);
signal VZVRAM_Data_Out : std_logic_vector(7 downto 0);
signal VZWRAM_Data_Out : std_logic_vector(7 downto 0);
signal cpu_clk : std_logic;
signal VZROM_CE : std_logic;
signal VZWRAM_CE : std_logic;
signal VZVRAM_CE : std_logic;
signal Keyboard_CE : std_logic;
signal KeyByteBuffer : std_logic_vector(5 downto 0):="111111";
signal VZROM_Address_In : std_logic_vector(13 downto 0);


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

signal LED_Latch : std_logic_vector(7 downto 0);
signal LED_WR : std_logic;

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
        KeyData : out std_logic_vector(5 downto 0);
        Serial_TX : out std_logic
        
    );
end component;

component Gowin_Flash_Controller_Top
	port (
		wdata_i: in std_logic_vector(31 downto 0);
		wyaddr_i: in std_logic_vector(5 downto 0);
		wxaddr_i: in std_logic_vector(8 downto 0);
		erase_en_i: in std_logic;
		done_flag_o: out std_logic;
		start_flag_i: in std_logic;
		clk_i: in std_logic;
		nrst_i: in std_logic;
		rdata_o: out std_logic_vector(31 downto 0);
		wr_en_i: in std_logic
	);
end component;



begin
SerialOut<=SerialIn;

SysReset<=Button1;

cpu_clk<=LedPrescaler(2);


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


VZVROM: VZROM
   port map (
        dout => VZROM_Data_Out,
        clk => cpu_clk,
        oce => not VZROM_CE,
        ce => '1',
        reset => not SysReset,
        ad => CPU_A(13 downto 0)
    );


--ROM_in_flash: Gowin_Flash_Controller_Top  --This will work, but you need to parse the basic ROM to convert it to a .fi compatible file.
--	port map (
--		wdata_i => "00000000000000000000000000000000",
--		wyaddr_i => CPU_A(14 downto 9),
--		wxaddr_i => CPU_A(8 downto 0),
--		erase_en_i => '0',
--		done_flag_o => open,
--		start_flag_i => '0',
--		clk_i => cpu_clk,
--		nrst_i => '0',
--		rdata_o(7 downto 0) => VZROM_Data_Out,
--		wr_en_i => '0'
--	);




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


VZROM_CE<='0' when CPU_A(15 downto 0) < "0100000000000000" else '1';
VZWRAM_CE<='0' when (CPU_A(15 downto 0) >= "0111100000000000") and (CPU_A(15 downto 0) < "1011100000000000") else '1'; --7800 b800
VZVRAM_CE<='0' when (CPU_A(15 downto 0) >= "0111000000000000") and (CPU_A(15 downto 0) < "0111100000000000") else '1'; --7000 to 7800 

Keyboard_CE <= '0' when (CPU_A(15 downto 11) >= "01101")  else '1'; --7000 to 7800 

LED_WR<='0' when (CPU_A(7 downto 0) = "10000000") and (CPU_WR_n='0') and CPU_IOREQ_n='0' else '1'; --Port 0x80 = LEDs

process (LED_WR)
begin
    if rising_edge(LED_WR) then
        LED_Latch<=CPU_DO;
    end if;
end process;
LEDs<=LED_Latch(5 downto 0) xor "111111";

process (clk_cpu,CPU_MREQ_n,VZROM_CE,VZVRAM_CE,VZWRAM_CE,Keyboard_CE,VZWRAM_Data_Out,VZVRAM_Data_Out,VZROM_Data_Out)
begin
    if CPU_MREQ_n='0' and CPU_RD_n='0' then  
        if VZROM_CE='0' then
            CPU_DI<=VZROM_Data_Out;
        elsif VZVRAM_CE='0' then
            CPU_DI<=VZVRAM_Data_Out;
        elsif VZWRAM_CE='0' then
            CPU_DI<=VZWRAM_Data_Out;
        elsif VZWRAM_CE='0' then
            CPU_DI<=VZWRAM_Data_Out;
        elsif Keyboard_CE='0' then
            CPU_DI<="11"& KeyByteBuffer;
        else
            CPU_DI<="ZZZZZZZZ";
        end if;
    else
        CPU_DI<="ZZZZZZZZ";
    end if;
end process;




VideoGenerator: VideoGen
    port map (
        PixelClock => CLK25mhz,
        CHRROMData => CHRROM_Data,
        VRAMData => VideoGen_Data,

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
        KeyData =>KeyByteBuffer,
       Serial_TX => open
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
    end if;
end process;


		
end architecture Behavioral;


