--Copyright (C)2014-2023 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.9 Beta-4 Education
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Fri Dec 15 09:26:51 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component UART_MASTER_Top
	port (
		I_CLK: in std_logic;
		I_RESETN: in std_logic;
		I_TX_EN: in std_logic;
		I_WADDR: in std_logic_vector(2 downto 0);
		I_WDATA: in std_logic_vector(7 downto 0);
		I_RX_EN: in std_logic;
		I_RADDR: in std_logic_vector(2 downto 0);
		O_RDATA: out std_logic_vector(7 downto 0);
		SIN: in std_logic;
		RxRDYn: out std_logic;
		SOUT: out std_logic;
		TxRDYn: out std_logic;
		DDIS: out std_logic;
		INTR: out std_logic;
		DCDn: in std_logic;
		CTSn: in std_logic;
		DSRn: in std_logic;
		RIn: in std_logic;
		DTRn: out std_logic;
		RTSn: out std_logic
	);
end component;

your_instance_name: UART_MASTER_Top
	port map (
		I_CLK => I_CLK_i,
		I_RESETN => I_RESETN_i,
		I_TX_EN => I_TX_EN_i,
		I_WADDR => I_WADDR_i,
		I_WDATA => I_WDATA_i,
		I_RX_EN => I_RX_EN_i,
		I_RADDR => I_RADDR_i,
		O_RDATA => O_RDATA_o,
		SIN => SIN_i,
		RxRDYn => RxRDYn_o,
		SOUT => SOUT_o,
		TxRDYn => TxRDYn_o,
		DDIS => DDIS_o,
		INTR => INTR_o,
		DCDn => DCDn_i,
		CTSn => CTSn_i,
		DSRn => DSRn_i,
		RIn => RIn_i,
		DTRn => DTRn_o,
		RTSn => RTSn_o
	);

----------Copy end-------------------
