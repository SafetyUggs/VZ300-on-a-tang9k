--Copyright (C)2014-2023 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.9 Beta-4 Education
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Thu Dec 14 14:24:01 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

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

your_instance_name: Gowin_Flash_Controller_Top
	port map (
		wdata_i => wdata_i_i,
		wyaddr_i => wyaddr_i_i,
		wxaddr_i => wxaddr_i_i,
		erase_en_i => erase_en_i_i,
		done_flag_o => done_flag_o_o,
		start_flag_i => start_flag_i_i,
		clk_i => clk_i_i,
		nrst_i => nrst_i_i,
		rdata_o => rdata_o_o,
		wr_en_i => wr_en_i_i
	);

----------Copy end-------------------
