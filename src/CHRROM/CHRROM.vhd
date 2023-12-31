--Copyright (C)2014-2023 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--GOWIN Version: V1.9.9 Beta-4 Education
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Thu Dec 14 11:18:51 2023

library IEEE;
use IEEE.std_logic_1164.all;

entity CHRROM is
    port (
        dout: out std_logic_vector(7 downto 0);
        clk: in std_logic;
        oce: in std_logic;
        ce: in std_logic;
        reset: in std_logic;
        ad: in std_logic_vector(11 downto 0)
    );
end CHRROM;

architecture Behavioral of CHRROM is

    signal prom_inst_0_dout_w: std_logic_vector(27 downto 0);
    signal prom_inst_1_dout_w: std_logic_vector(27 downto 0);
    signal gw_gnd: std_logic;
    signal prom_inst_0_AD_i: std_logic_vector(13 downto 0);
    signal prom_inst_0_DO_o: std_logic_vector(31 downto 0);
    signal prom_inst_1_AD_i: std_logic_vector(13 downto 0);
    signal prom_inst_1_DO_o: std_logic_vector(31 downto 0);

    --component declaration
    component pROM
        generic (
            READ_MODE: in bit :='0';
            BIT_WIDTH: in integer := 9;
            RESET_MODE: in string := "SYNC";
            INIT_RAM_00: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_01: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_02: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_03: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_04: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_05: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_06: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_07: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_08: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_09: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_10: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_11: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_12: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_13: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_14: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_15: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_16: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_17: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_18: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_19: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_20: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_21: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_22: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_23: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_24: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_25: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_26: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_27: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_28: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_29: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_30: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_31: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_32: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_33: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_34: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_35: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_36: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_37: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_38: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_39: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
        );
        port (
            DO: out std_logic_vector(31 downto 0);
            CLK: in std_logic;
            OCE: in std_logic;
            CE: in std_logic;
            RESET: in std_logic;
            AD: in std_logic_vector(13 downto 0)
        );
    end component;

begin
    gw_gnd <= '0';

    prom_inst_0_AD_i <= ad(11 downto 0) & gw_gnd & gw_gnd;
    dout(3 downto 0) <= prom_inst_0_DO_o(3 downto 0) ;
    prom_inst_0_dout_w(27 downto 0) <= prom_inst_0_DO_o(31 downto 4) ;
    prom_inst_1_AD_i <= ad(11 downto 0) & gw_gnd & gw_gnd;
    dout(7 downto 4) <= prom_inst_1_DO_o(3 downto 0) ;
    prom_inst_1_dout_w(27 downto 0) <= prom_inst_1_DO_o(31 downto 4) ;

    prom_inst_0: pROM
        generic map (
            READ_MODE => '0',
            BIT_WIDTH => 4,
            RESET_MODE => "SYNC",
            INIT_RAM_00 => X"00000000C22222C000000000E44C44E00000000022E2248000000000C22C02C0",
            INIT_RAM_01 => X"00000000C22222C000000000222E22E000000000E22E22E000000000E44444E0",
            INIT_RAM_02 => X"0000000022A6A22000000000C220000000000000C88888C000000000222E2220",
            INIT_RAM_03 => X"00000000E22222E000000000222A622000000000222AE62000000000E2222220",
            INIT_RAM_04 => X"00000000C20842C00000000022AE22E000000000C2A222C000000000222E22E0",
            INIT_RAM_05 => X"0000000026EA2220000000008844222000000000C222222000000000888888E0",
            INIT_RAM_06 => X"00000000C44444C000000000E24800E000000000888842200000000022484220",
            INIT_RAM_07 => X"00000000084E4800000000008888AC8000000000C00000C00000000000084200",
            INIT_RAM_08 => X"0000000044E4E440000000000000044000000000808888800000000000000000",
            INIT_RAM_09 => X"000000000000088000000000C2A4AA400000000022480660000000008E0C2C80",
            INIT_RAM_0A => X"00000000088E88000000000008CEC80000000000480008400000000008444800",
            INIT_RAM_0B => X"000000000248000000000000CC00000000000000000E0000000000048CC00000",
            INIT_RAM_0C => X"00000000C20C02C000000000E22C02C000000000C8888C8000000000C22222C0",
            INIT_RAM_0D => X"00000000224800E000000000C22E22C000000000C200E2E000000000000E4800",
            INIT_RAM_0E => X"000000048CC0CC00000000000CC0CC0000000000C00C22C000000000C22C22C0",
            INIT_RAM_0F => X"00000000808002C000000000480008400000000000E0E0000000000000848000",
            INIT_RAM_10 => X"0000FFFF3DDDDD3F0000FFFF1BB3BB1F0000FFFFDD1DDB7F0000FFFF3DD3FD3F",
            INIT_RAM_11 => X"0000FFFF3DDDDD3F0000FFFFDDD1DD1F0000FFFF1DD1DD1F0000FFFF1BBBBB1F",
            INIT_RAM_12 => X"0000FFFFDD595DDF0000FFFF3DDFFFFF0000FFFF3777773F0000FFFFDDD1DDDF",
            INIT_RAM_13 => X"0000FFFF1DDDDD1F0000FFFFDDD59DDF0000FFFFDDD519DF0000FFFF1DDDDDDF",
            INIT_RAM_14 => X"0000FFFF3DF7BD3F0000FFFFDD51DD1F0000FFFF3D5DDD3F0000FFFFDDD1DD1F",
            INIT_RAM_15 => X"0000FFFFD915DDDF0000FFFF77BBDDDF0000FFFF3DDDDDDF0000FFFF7777771F",
            INIT_RAM_16 => X"0000FFFF3BBBBB3F0000FFFF1DB7FF1F0000FFFF7777BDDF0000FFFFDDB7BDDF",
            INIT_RAM_17 => X"0000FFFFF7B1B7FF0000FFFF7777537F0000FFFF3FFFFF3F0000FFFFFFF7BDFF",
            INIT_RAM_18 => X"0000FFFFBB1B1BBF0000FFFFFFFFFBBF0000FFFF7F77777F0000FFFFFFFFFFFF",
            INIT_RAM_19 => X"0000FFFFFFFFF77F0000FFFF3D5B55BF0000FFFFDDB7F99F0000FFFF71F3D37F",
            INIT_RAM_1A => X"0000FFFFF77177FF0000FFFFF73137FF0000FFFFB7FFF7BF0000FFFFF7BBB7FF",
            INIT_RAM_1B => X"0000FFFFFDB7FFFF0000FFFF33FFFFFF0000FFFFFFF1FFFF0000FFFB733FFFFF",
            INIT_RAM_1C => X"0000FFFF3DF3FD3F0000FFFF1DD3FD3F0000FFFF3777737F0000FFFF3DDDDD3F",
            INIT_RAM_1D => X"0000FFFFDDB7FF1F0000FFFF3DD1DD3F0000FFFF3DFF1D1F0000FFFFFFF1B7FF",
            INIT_RAM_1E => X"0000FFFB733F33FF0000FFFFF33F33FF0000FFFF3FF3DD3F0000FFFF3DD3DD3F",
            INIT_RAM_1F => X"0000FFFF7F7FFD3F0000FFFFB7FFF7BF0000FFFFFF1F1FFF0000FFFFFF7B7FFF",
            INIT_RAM_20 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_21 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_22 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_23 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_24 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_25 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_26 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_27 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_28 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_29 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_2A => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_2B => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_2C => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_2D => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_2E => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_2F => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_30 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_31 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_32 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_33 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_34 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_35 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_36 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_37 => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_38 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_39 => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_3A => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_3B => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_3C => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_3D => X"0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000",
            INIT_RAM_3E => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF",
            INIT_RAM_3F => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000000000FFFFFF0000000000FFFFFF"
        )
        port map (
            DO => prom_inst_0_DO_o,
            CLK => clk,
            OCE => oce,
            CE => ce,
            RESET => reset,
            AD => prom_inst_0_AD_i
        );

    prom_inst_1: pROM
        generic map (
            READ_MODE => '0',
            BIT_WIDTH => 4,
            RESET_MODE => "SYNC",
            INIT_RAM_00 => X"0000000012000210000000001221221000000000223221000000000013322210",
            INIT_RAM_01 => X"0000000032230030000000000001003000000000300000300000000012222210",
            INIT_RAM_02 => X"0000000021000120000000001222222000000000100000100000000022232220",
            INIT_RAM_03 => X"0000000032222230000000002232222000000000222233200000000030000000",
            INIT_RAM_04 => X"0000000012100210000000002101221000000000212222100000000000012210",
            INIT_RAM_05 => X"0000000023322220000000000011222000000000122222200000000000000030",
            INIT_RAM_06 => X"0000000010000010000000003000123000000000000012200000000022101220",
            INIT_RAM_07 => X"0000000000030000000000000000210000000000111111100000000002100000",
            INIT_RAM_08 => X"0000000011313110000000000000011000000000000000000000000000000000",
            INIT_RAM_09 => X"0000000000000000000000002120000000000000330012200000000001210300",
            INIT_RAM_0A => X"0000000000030000000000000013100000000000001110000000000010000010",
            INIT_RAM_0B => X"0000000000001200000000000000000000000000000300000000000000000000",
            INIT_RAM_0C => X"0000000012212210000000003001221000000000100000000000000001111100",
            INIT_RAM_0D => X"0000000000001230000000001221001000000000122210300000000011131110",
            INIT_RAM_0E => X"0000000000000000000000000000000000000000122322100000000012212210",
            INIT_RAM_0F => X"0000000000012210000000000012100000000000003030000000000021000120",
            INIT_RAM_10 => X"0000FFFFEDFFFDEF0000FFFFEDDEDDEF0000FFFFDDCDDEFF0000FFFFECCDDDEF",
            INIT_RAM_11 => X"0000FFFFCDDCFFCF0000FFFFFFFEFFCF0000FFFFCFFFFFCF0000FFFFEDDDDDEF",
            INIT_RAM_12 => X"0000FFFFDEFFFEDF0000FFFFEDDDDDDF0000FFFFEFFFFFEF0000FFFFDDDCDDDF",
            INIT_RAM_13 => X"0000FFFFCDDDDDCF0000FFFFDDCDDDDF0000FFFFDDDDCCDF0000FFFFCFFFFFFF",
            INIT_RAM_14 => X"0000FFFFEDEFFDEF0000FFFFDEFEDDEF0000FFFFDEDDDDEF0000FFFFFFFEDDEF",
            INIT_RAM_15 => X"0000FFFFDCCDDDDF0000FFFFFFEEDDDF0000FFFFEDDDDDDF0000FFFFFFFFFFCF",
            INIT_RAM_16 => X"0000FFFFEFFFFFEF0000FFFFCFFFEDCF0000FFFFFFFFEDDF0000FFFFDDEFEDDF",
            INIT_RAM_17 => X"0000FFFFFFFCFFFF0000FFFFFFFFDEFF0000FFFFEEEEEEEF0000FFFFFDEFFFFF",
            INIT_RAM_18 => X"0000FFFFEECECEEF0000FFFFFFFFFEEF0000FFFFFFFFFFFF0000FFFFFFFFFFFF",
            INIT_RAM_19 => X"0000FFFFFFFFFFFF0000FFFFDEDFFFFF0000FFFFCCFFEDDF0000FFFFFEDEFCFF",
            INIT_RAM_1A => X"0000FFFFFFFCFFFF0000FFFFFFECEFFF0000FFFFFFEEEFFF0000FFFFEFFFFFEF",
            INIT_RAM_1B => X"0000FFFFFFFFEDFF0000FFFFFFFFFFFF0000FFFFFFFCFFFF0000FFFFFFFFFFFF",
            INIT_RAM_1C => X"0000FFFFEDDEDDEF0000FFFFCFFEDDEF0000FFFFEFFFFFFF0000FFFFFEEEEEFF",
            INIT_RAM_1D => X"0000FFFFFFFFEDCF0000FFFFEDDEFFEF0000FFFFEDDDEFCF0000FFFFEEECEEEF",
            INIT_RAM_1E => X"0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFEDDCDDEF0000FFFFEDDEDDEF",
            INIT_RAM_1F => X"0000FFFFFFFEDDEF0000FFFFFFEDEFFF0000FFFFFFCFCFFF0000FFFFDEFFFEDF",
            INIT_RAM_20 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_21 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_22 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_23 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_24 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_25 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_26 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_27 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_28 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_29 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_2A => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_2B => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_2C => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_2D => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_2E => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_2F => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_30 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_31 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_32 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_33 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_34 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_35 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_36 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_37 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_38 => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_39 => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_3A => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_3B => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_3C => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_3D => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF",
            INIT_RAM_3E => X"0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000",
            INIT_RAM_3F => X"0000FFFFFFFFFFFF0000000000FFFFFF0000FFFFFFFFFFFF0000000000FFFFFF"
        )
        port map (
            DO => prom_inst_1_DO_o,
            CLK => clk,
            OCE => oce,
            CE => ce,
            RESET => reset,
            AD => prom_inst_1_AD_i
        );

end Behavioral; --CHRROM
