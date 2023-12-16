--Copyright (C)2014-2023 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.9 Beta-4 Education
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Sat Dec 16 17:02:38 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

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

your_instance_name: ROMs
    port map (
        dout => dout_o,
        xe => xe_i,
        ye => ye_i,
        se => se_i,
        prog => prog_i,
        erase => erase_i,
        nvstr => nvstr_i,
        xadr => xadr_i,
        yadr => yadr_i,
        din => din_i
    );

----------Copy end-------------------
