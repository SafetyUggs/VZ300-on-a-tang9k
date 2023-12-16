library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
 entity SD_Interface is
	Port( --Here we define all Inputs and outputs to the FPGA
		CLK     : in  std_logic; --Z80 clock, we use this to clock the SD card and power the SPI shift register
		Address        : in  std_logic_vector(7 downto 0); --Address bus
		Din        : in  std_logic_vector(7 downto 0);--Data bus - InOut means it is bidirectional.
        Dout        :out std_logic_vector(7 downto 0);
		RD_N     : in  std_logic;
		WR_N     : in  std_logic;
		IOREQ		: in std_logic;
		MEMREQ		: in std_logic;

		SD_I : in std_logic;
		SD_O : out std_logic;
		SD_CS : out std_logic;
		SD_CLK : out std_logic
	);
end entity SD_Interface;
 
architecture Behavioral of SD_Interface is  --Here we create Signals. These can be considered as wires joining logic together. Signals can also be latches.


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




begin

----------
---Port Decoding
----------------


PortSDconfigOut <= '0' 	when IOREQ='0' and WR_N = '0' and Address(7 downto 0) = SDcfgPortNumber else '1';
PortSDOut <= '0' 		when IOREQ='0' and WR_N = '0' and Address(7 downto 0) = SDioPortNumber else '1';
PortSDIn <= '0' 		when IOREQ='0' and RD_N = '0' and Address(7 downto 0) = SDioPortNumber else '1';



-----------------------------------------------------------------------
-- Clock Generation
-----------------------------------------------------------------------
--All mappers common addresses

process (PortSDin)
begin
	if PortSDin='0' then
		Dout<=SPIinBuffer;
	else
	Dout<="ZZZZZZZZ"; --Setting a InOut port to Z means high impedance input. Anything else would set it as an output.
	end if;
end process;


process (PortSDconfigOut)
begin
	
	if rising_edge(PortSDconfigOut) then	
				SPIclkSpeed <= Din(0); -- Low or High speed clock mode for SPI
				SPIsdCS <= Din(1);
		end if;
end process;
  
process (PortSDOut,state)
begin
	if state>0 then Start<='0'; 
		else
			if rising_edge(PortSDout) then	
				SPIoutBuffer <= Din;
				Start<= '1';
		end if;
	end if;
end process;
  
---------------------------
--SPI Code here:
---------------------------
SPIclock<=CLKprescale(7) when SPIclkSpeed='0' else clk; --Older MMC and early SD cards need a 400khz Initialisation clock. Haven't come across one yet that wont init at 1mhz
SD_Clk<=SPIclock when State="10" and (SpiClkCount > 2) else '0'; --Enable the SPI clock when we're in state 3
SD_CS <=  not SPIsdCS;

process (clk)--Clock prescaler for System Clock
begin
if rising_edge(clk) then
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
 
   
 
 
end architecture Behavioral;