--
--Written by GowinSynthesis
--Product Version "V1.9.9 Beta-4 Education"
--Thu Dec 14 14:24:01 2023

--Source file index table:
--file0 "\C:/Gowin/Gowin_V1.9.9Beta-4_Education/IDE/ipcore/FlashController/data/gowin_flash_controller.v"
--file1 "\C:/Gowin/Gowin_V1.9.9Beta-4_Education/IDE/ipcore/FlashController/data/gowin_flash_controller_top.v"
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library gw1n;
use gw1n.components.all;

entity Gowin_Flash_Controller_Top is
port(
  wdata_i :  in std_logic_vector(31 downto 0);
  wyaddr_i :  in std_logic_vector(5 downto 0);
  wxaddr_i :  in std_logic_vector(8 downto 0);
  erase_en_i :  in std_logic;
  done_flag_o :  out std_logic;
  start_flag_i :  in std_logic;
  clk_i :  in std_logic;
  nrst_i :  in std_logic;
  rdata_o :  out std_logic_vector(31 downto 0);
  wr_en_i :  in std_logic);
end Gowin_Flash_Controller_Top;
architecture beh of Gowin_Flash_Controller_Top is
  signal u_Flash_Ctroller_608K_XE : std_logic ;
  signal u_Flash_Ctroller_608K_YE : std_logic ;
  signal u_Flash_Ctroller_608K_SE : std_logic ;
  signal u_Flash_Ctroller_608K_PROG : std_logic ;
  signal u_Flash_Ctroller_608K_ERASE : std_logic ;
  signal u_Flash_Ctroller_608K_NVSTR : std_logic ;
  signal u_Flash_Ctroller_608K_w_command : std_logic ;
  signal u_Flash_Ctroller_608K_r_command : std_logic ;
  signal u_Flash_Ctroller_608K_e_command : std_logic ;
  signal u_Flash_Ctroller_608K_w_busy_d0 : std_logic ;
  signal u_Flash_Ctroller_608K_r_busy_d0 : std_logic ;
  signal u_Flash_Ctroller_608K_e_busy_d0 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_xe : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_erase : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_nvstr : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_busy : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_w_xe : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_w_ye : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_w_prog : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_w_nvstr : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_w_busy : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_r_xe : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_r_se : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_as_cnt : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_pws_cnt : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_ah_cnt : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n55 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n55_16 : std_logic ;
  signal u_Flash_Ctroller_608K_n530 : std_logic ;
  signal u_Flash_Ctroller_608K_n308 : std_logic ;
  signal u_Flash_Ctroller_608K_n309 : std_logic ;
  signal u_Flash_Ctroller_608K_n310 : std_logic ;
  signal u_Flash_Ctroller_608K_n311 : std_logic ;
  signal u_Flash_Ctroller_608K_n312 : std_logic ;
  signal u_Flash_Ctroller_608K_n313 : std_logic ;
  signal u_Flash_Ctroller_608K_n314 : std_logic ;
  signal u_Flash_Ctroller_608K_n315 : std_logic ;
  signal u_Flash_Ctroller_608K_n316 : std_logic ;
  signal u_Flash_Ctroller_608K_n355 : std_logic ;
  signal u_Flash_Ctroller_608K_n360 : std_logic ;
  signal u_Flash_Ctroller_608K_n411 : std_logic ;
  signal u_Flash_Ctroller_608K_n413 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n233 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240 : std_logic ;
  signal u_Flash_Ctroller_608K_n412 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n53 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n237 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n279 : std_logic ;
  signal u_Flash_Ctroller_608K_n356 : std_logic ;
  signal u_Flash_Ctroller_608K_n322 : std_logic ;
  signal u_Flash_Ctroller_608K_n321 : std_logic ;
  signal u_Flash_Ctroller_608K_n320 : std_logic ;
  signal u_Flash_Ctroller_608K_n319 : std_logic ;
  signal u_Flash_Ctroller_608K_n318 : std_logic ;
  signal u_Flash_Ctroller_608K_n317 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n54 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n239 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n235 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n232 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n231 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n230 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n229 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n228 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n227 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n226 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n225 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n224 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n223 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n222 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n221 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n220 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n219 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n218 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n217 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n216 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n215 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n214 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n213 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n212 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n211 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n210 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n209 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n208 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n207 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n206 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n205 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n204 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n203 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n202 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n201 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n200 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n199 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n198 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n197 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n196 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n195 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n194 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n193 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n192 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n191 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n190 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n189 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n188 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n187 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n186 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n280 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n208 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n207 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n206 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n205 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n204 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n203 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n202 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n201 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n200 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n50 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n49 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n47 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n294 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n293 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n292 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n291 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n289 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n288 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n287 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n286 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n285 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n284 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n283 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n282 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n280 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n279 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n278 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n277 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n276 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n274 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n272 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n271 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n270 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n269 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n268 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n267 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n266 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n265 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n263 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n262 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n261 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n260 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n259 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n258 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n256 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n254 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n253 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n252 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n251 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n250 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n249 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n247 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n245 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n244 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n243 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n242 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n241 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n234 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n277 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n276 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n274 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n273 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n272 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n271 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n270 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n269 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n268 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n267 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n266 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n265 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n263 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n262 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n261 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n260 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n259 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n258 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n257 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n256 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n255 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n254 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n253 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n252 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n251 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n250 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n249 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n247 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n246 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n245 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n244 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n243 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n242 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n241 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n240 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n239 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n238 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n237 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n236 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n235 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n234 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n233 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n232 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n231 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n229 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n228 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n224 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n222 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n221 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n219 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n218 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n216 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n215 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n214 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n213 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n212 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n46 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n44 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n211 : std_logic ;
  signal u_Flash_Ctroller_608K_n363 : std_logic ;
  signal u_Flash_Ctroller_608K_n361 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n278 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n210 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n209 : std_logic ;
  signal u_Flash_Ctroller_608K_n414 : std_logic ;
  signal u_Flash_Ctroller_608K_state_UFM_1 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n281 : std_logic ;
  signal u_Flash_Ctroller_608K_n308_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n309_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n310_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n311_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n312_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n313_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n314_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n315_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n315_18 : std_logic ;
  signal u_Flash_Ctroller_608K_n316_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n355_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n411_17 : std_logic ;
  signal u_Flash_Ctroller_608K_n411_18 : std_logic ;
  signal u_Flash_Ctroller_608K_n411_19 : std_logic ;
  signal u_Flash_Ctroller_608K_n413_21 : std_logic ;
  signal u_Flash_Ctroller_608K_n413_22 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_31 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_32 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_33 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n295 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n53_20 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n53_21 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n237_33 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n237_34 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n237_35 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n237_36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n279_33 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n279_34 : std_logic ;
  signal u_Flash_Ctroller_608K_n356_16 : std_logic ;
  signal u_Flash_Ctroller_608K_n356_17 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n54_21 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_29 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_30 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_31 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n280_35 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n280_36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n208_28 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n294_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n290 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n286_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n281 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n277_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n273 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n269_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n264 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n260_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n255 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n251_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n246 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n242_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n234_12 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n274_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n272_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n269_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n266_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n264 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n260_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n258_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n256_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n252_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n250_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n248 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n246_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n244_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n242_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n241_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n239_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n237_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n235_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n232_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n231_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n230 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n228_12 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n227 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n225 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n221_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n217 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n213_9 : std_logic ;
  signal u_Flash_Ctroller_608K_n414_24 : std_logic ;
  signal u_Flash_Ctroller_608K_state_UFM_1_9 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_state_1 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_state_1_10 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n281_41 : std_logic ;
  signal u_Flash_Ctroller_608K_n315_19 : std_logic ;
  signal u_Flash_Ctroller_608K_n316_18 : std_logic ;
  signal u_Flash_Ctroller_608K_n316_19 : std_logic ;
  signal u_Flash_Ctroller_608K_n413_23 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n233_38 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_34 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_35 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_37 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_38 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_39 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n237_37 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n279_35 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n279_36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n239_32 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n238 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n238_30 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_33 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_34 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_35 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_37 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n280_37 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n234_13 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n234_14 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n258_10 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n258_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n237_10 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n232_10 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n230_10 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n233_39 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n233_40 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_40 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n240_41 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n279_37 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_39 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_40 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_41 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_42 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_43 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_44 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_45 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_46 : std_logic ;
  signal u_Flash_Ctroller_608K_wdata_31 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_e_state_1_12 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n212_14 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n230_12 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n234_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n243_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n248_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n251_13 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n259_13 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n268_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n271_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n265_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n282_48 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n48 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n250_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n259_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n268_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n285_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n215_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n217_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n220 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n223 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n225_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n254_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n262_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n264_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n51 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n248 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n239_34 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n238_32 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n244_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n246_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n253_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n255_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n262_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n264_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n271_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n273_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n276_12 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n279_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n281_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n288_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n290_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n249_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n233_42 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n233_44 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n295_71 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n238_36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n283_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n236 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n280_41 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n218_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n219_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n257 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n275 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n220_15 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n223_13 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n226 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n227_11 : std_logic ;
  signal u_Flash_Ctroller_608K_u_ER_UFM_n275 : std_logic ;
  signal u_Flash_Ctroller_608K_n362 : std_logic ;
  signal u_Flash_Ctroller_608K_n359 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n29 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n30 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n31 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n32 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n33 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n34 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n35 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n36 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n37 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n38 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n39 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n40 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n41 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n42 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n43 : std_logic ;
  signal u_Flash_Ctroller_608K_n147 : std_logic ;
  signal u_Flash_Ctroller_608K_n148 : std_logic ;
  signal u_Flash_Ctroller_608K_n149 : std_logic ;
  signal u_Flash_Ctroller_608K_n150 : std_logic ;
  signal u_Flash_Ctroller_608K_n151 : std_logic ;
  signal u_Flash_Ctroller_608K_n152 : std_logic ;
  signal u_Flash_Ctroller_608K_n153 : std_logic ;
  signal u_Flash_Ctroller_608K_n154 : std_logic ;
  signal u_Flash_Ctroller_608K_n155 : std_logic ;
  signal u_Flash_Ctroller_608K_n156 : std_logic ;
  signal u_Flash_Ctroller_608K_n157 : std_logic ;
  signal u_Flash_Ctroller_608K_n158 : std_logic ;
  signal u_Flash_Ctroller_608K_n159 : std_logic ;
  signal u_Flash_Ctroller_608K_n160 : std_logic ;
  signal u_Flash_Ctroller_608K_n161 : std_logic ;
  signal u_Flash_Ctroller_608K_n162 : std_logic ;
  signal u_Flash_Ctroller_608K_n163 : std_logic ;
  signal u_Flash_Ctroller_608K_n164 : std_logic ;
  signal u_Flash_Ctroller_608K_n165 : std_logic ;
  signal u_Flash_Ctroller_608K_n166 : std_logic ;
  signal u_Flash_Ctroller_608K_n167 : std_logic ;
  signal u_Flash_Ctroller_608K_n168 : std_logic ;
  signal u_Flash_Ctroller_608K_n169 : std_logic ;
  signal u_Flash_Ctroller_608K_n170 : std_logic ;
  signal u_Flash_Ctroller_608K_n171 : std_logic ;
  signal u_Flash_Ctroller_608K_n172 : std_logic ;
  signal u_Flash_Ctroller_608K_n173 : std_logic ;
  signal u_Flash_Ctroller_608K_n174 : std_logic ;
  signal u_Flash_Ctroller_608K_n175 : std_logic ;
  signal u_Flash_Ctroller_608K_n176 : std_logic ;
  signal u_Flash_Ctroller_608K_n177 : std_logic ;
  signal u_Flash_Ctroller_608K_n178 : std_logic ;
  signal u_Flash_Ctroller_608K_u_RD_UFM_n55_23 : std_logic ;
  signal u_Flash_Ctroller_608K_n360_26 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n248_13 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n257_13 : std_logic ;
  signal u_Flash_Ctroller_608K_u_WR_UFM_n275_13 : std_logic ;
  signal u_Flash_Ctroller_608K_n357 : std_logic ;
  signal u_Flash_Ctroller_608K_n358 : std_logic ;
  signal u_Flash_Ctroller_608K_n354 : std_logic ;
  signal u_Flash_Ctroller_608K_n353 : std_logic ;
  signal u_Flash_Ctroller_608K_n352 : std_logic ;
  signal u_Flash_Ctroller_608K_n351 : std_logic ;
  signal u_Flash_Ctroller_608K_n350 : std_logic ;
  signal u_Flash_Ctroller_608K_n349 : std_logic ;
  signal u_Flash_Ctroller_608K_n348 : std_logic ;
  signal u_Flash_Ctroller_608K_n347 : std_logic ;
  signal u_Flash_Ctroller_608K_n346 : std_logic ;
  signal u_Flash_Ctroller_608K_n345 : std_logic ;
  signal u_Flash_Ctroller_608K_n344 : std_logic ;
  signal u_Flash_Ctroller_608K_n343 : std_logic ;
  signal u_Flash_Ctroller_608K_n342 : std_logic ;
  signal u_Flash_Ctroller_608K_n341 : std_logic ;
  signal u_Flash_Ctroller_608K_n340 : std_logic ;
  signal u_Flash_Ctroller_608K_n339 : std_logic ;
  signal u_Flash_Ctroller_608K_n338 : std_logic ;
  signal u_Flash_Ctroller_608K_n337 : std_logic ;
  signal u_Flash_Ctroller_608K_n336 : std_logic ;
  signal u_Flash_Ctroller_608K_n335 : std_logic ;
  signal u_Flash_Ctroller_608K_n334 : std_logic ;
  signal u_Flash_Ctroller_608K_n333 : std_logic ;
  signal u_Flash_Ctroller_608K_n332 : std_logic ;
  signal u_Flash_Ctroller_608K_n331 : std_logic ;
  signal u_Flash_Ctroller_608K_n330 : std_logic ;
  signal u_Flash_Ctroller_608K_n329 : std_logic ;
  signal u_Flash_Ctroller_608K_n328 : std_logic ;
  signal u_Flash_Ctroller_608K_n327 : std_logic ;
  signal u_Flash_Ctroller_608K_n326 : std_logic ;
  signal u_Flash_Ctroller_608K_n325 : std_logic ;
  signal u_Flash_Ctroller_608K_n324 : std_logic ;
  signal u_Flash_Ctroller_608K_n323 : std_logic ;
  signal u_Flash_Ctroller_608K_n137 : std_logic ;
  signal GND_0 : std_logic ;
  signal VCC_0 : std_logic ;
  signal \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\ : std_logic_vector(31 downto 0);
  signal \u_Flash_Ctroller_608K/XADR\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/YADR\ : std_logic_vector(5 downto 0);
  signal \u_Flash_Ctroller_608K/DIN\ : std_logic_vector(31 downto 0);
  signal \u_Flash_Ctroller_608K/state_UFM\ : std_logic_vector(2 downto 0);
  signal \u_Flash_Ctroller_608K/wdata\ : std_logic_vector(31 downto 0);
  signal \u_Flash_Ctroller_608K/wxaddr\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/wyaddr\ : std_logic_vector(5 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/e_state\ : std_logic_vector(3 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\ : std_logic_vector(7 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\ : std_logic_vector(7 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\ : std_logic_vector(22 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\ : std_logic_vector(7 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\ : std_logic_vector(7 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\ : std_logic_vector(1 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\ : std_logic_vector(5 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/w_din\ : std_logic_vector(31 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/w_state\ : std_logic_vector(3 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\ : std_logic_vector(7 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\ : std_logic_vector(7 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\ : std_logic_vector(1 downto 0);
  signal \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\ : std_logic_vector(8 downto 0);
  signal \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\ : std_logic_vector(5 downto 0);
  signal \u_Flash_Ctroller_608K/u_RD_UFM/r_state\ : std_logic_vector(2 downto 0);
  signal \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\ : std_logic_vector(1 downto 0);
  signal NN : std_logic;
begin
\u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/flash_inst\: FLASH608K
port map (
  DOUT(31 downto 0) => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(31 downto 0),
  XADR(8 downto 0) => \u_Flash_Ctroller_608K/XADR\(8 downto 0),
  YADR(5 downto 0) => \u_Flash_Ctroller_608K/YADR\(5 downto 0),
  XE => u_Flash_Ctroller_608K_XE,
  YE => u_Flash_Ctroller_608K_YE,
  SE => u_Flash_Ctroller_608K_SE,
  ERASE => u_Flash_Ctroller_608K_ERASE,
  PROG => u_Flash_Ctroller_608K_PROG,
  NVSTR => u_Flash_Ctroller_608K_NVSTR,
  DIN(31 downto 0) => \u_Flash_Ctroller_608K/DIN\(31 downto 0));
\u_Flash_Ctroller_608K/XADR_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(7),
  D => u_Flash_Ctroller_608K_n309,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(6),
  D => u_Flash_Ctroller_608K_n310,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(5),
  D => u_Flash_Ctroller_608K_n311,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(4),
  D => u_Flash_Ctroller_608K_n312,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(3),
  D => u_Flash_Ctroller_608K_n313,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(2),
  D => u_Flash_Ctroller_608K_n314,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(1),
  D => u_Flash_Ctroller_608K_n315,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(0),
  D => u_Flash_Ctroller_608K_n316,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YADR_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/YADR\(5),
  D => u_Flash_Ctroller_608K_n317,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YADR_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/YADR\(4),
  D => u_Flash_Ctroller_608K_n318,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YADR_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/YADR\(3),
  D => u_Flash_Ctroller_608K_n319,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YADR_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/YADR\(2),
  D => u_Flash_Ctroller_608K_n320,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YADR_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/YADR\(1),
  D => u_Flash_Ctroller_608K_n321,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YADR_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/YADR\(0),
  D => u_Flash_Ctroller_608K_n322,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_31_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(31),
  D => u_Flash_Ctroller_608K_n323,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_30_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(30),
  D => u_Flash_Ctroller_608K_n324,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_29_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(29),
  D => u_Flash_Ctroller_608K_n325,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_28_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(28),
  D => u_Flash_Ctroller_608K_n326,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_27_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(27),
  D => u_Flash_Ctroller_608K_n327,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_26_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(26),
  D => u_Flash_Ctroller_608K_n328,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_25_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(25),
  D => u_Flash_Ctroller_608K_n329,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_24_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(24),
  D => u_Flash_Ctroller_608K_n330,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_23_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(23),
  D => u_Flash_Ctroller_608K_n331,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_22_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(22),
  D => u_Flash_Ctroller_608K_n332,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_21_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(21),
  D => u_Flash_Ctroller_608K_n333,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_20_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(20),
  D => u_Flash_Ctroller_608K_n334,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_19_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(19),
  D => u_Flash_Ctroller_608K_n335,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_18_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(18),
  D => u_Flash_Ctroller_608K_n336,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_17_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(17),
  D => u_Flash_Ctroller_608K_n337,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_16_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(16),
  D => u_Flash_Ctroller_608K_n338,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_15_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(15),
  D => u_Flash_Ctroller_608K_n339,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_14_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(14),
  D => u_Flash_Ctroller_608K_n340,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_13_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(13),
  D => u_Flash_Ctroller_608K_n341,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_12_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(12),
  D => u_Flash_Ctroller_608K_n342,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_11_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(11),
  D => u_Flash_Ctroller_608K_n343,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_10_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(10),
  D => u_Flash_Ctroller_608K_n344,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_9_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(9),
  D => u_Flash_Ctroller_608K_n345,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(8),
  D => u_Flash_Ctroller_608K_n346,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(7),
  D => u_Flash_Ctroller_608K_n347,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(6),
  D => u_Flash_Ctroller_608K_n348,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(5),
  D => u_Flash_Ctroller_608K_n349,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(4),
  D => u_Flash_Ctroller_608K_n350,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(3),
  D => u_Flash_Ctroller_608K_n351,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(2),
  D => u_Flash_Ctroller_608K_n352,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(1),
  D => u_Flash_Ctroller_608K_n353,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/DIN_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/DIN\(0),
  D => u_Flash_Ctroller_608K_n354,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XE_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_XE,
  D => u_Flash_Ctroller_608K_n355,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/YE_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_YE,
  D => u_Flash_Ctroller_608K_n356,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/SE_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_SE,
  D => u_Flash_Ctroller_608K_n357,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/PROG_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_PROG,
  D => u_Flash_Ctroller_608K_n358,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/ERASE_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_ERASE,
  D => u_Flash_Ctroller_608K_n359,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/NVSTR_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_NVSTR,
  D => u_Flash_Ctroller_608K_n360,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/state_UFM_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/state_UFM\(2),
  D => u_Flash_Ctroller_608K_n411,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/state_UFM_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/state_UFM\(0),
  D => u_Flash_Ctroller_608K_n413,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/w_command_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_w_command,
  D => u_Flash_Ctroller_608K_n361,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/r_command_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_r_command,
  D => u_Flash_Ctroller_608K_n362,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/e_command_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_e_command,
  D => u_Flash_Ctroller_608K_n363,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/w_busy_d0_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_w_busy_d0,
  D => u_Flash_Ctroller_608K_u_WR_UFM_w_busy,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/r_busy_d0_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_r_busy_d0,
  D => u_Flash_Ctroller_608K_u_RD_UFM_r_xe,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/e_busy_d0_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_e_busy_d0,
  D => u_Flash_Ctroller_608K_u_ER_UFM_e_busy,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_31_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(31),
  D => u_Flash_Ctroller_608K_n147,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_30_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(30),
  D => u_Flash_Ctroller_608K_n148,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_29_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(29),
  D => u_Flash_Ctroller_608K_n149,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_28_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(28),
  D => u_Flash_Ctroller_608K_n150,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_27_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(27),
  D => u_Flash_Ctroller_608K_n151,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_26_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(26),
  D => u_Flash_Ctroller_608K_n152,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_25_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(25),
  D => u_Flash_Ctroller_608K_n153,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_24_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(24),
  D => u_Flash_Ctroller_608K_n154,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_23_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(23),
  D => u_Flash_Ctroller_608K_n155,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_22_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(22),
  D => u_Flash_Ctroller_608K_n156,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_21_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(21),
  D => u_Flash_Ctroller_608K_n157,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_20_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(20),
  D => u_Flash_Ctroller_608K_n158,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_19_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(19),
  D => u_Flash_Ctroller_608K_n159,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_18_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(18),
  D => u_Flash_Ctroller_608K_n160,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_17_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(17),
  D => u_Flash_Ctroller_608K_n161,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_16_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(16),
  D => u_Flash_Ctroller_608K_n162,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_15_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(15),
  D => u_Flash_Ctroller_608K_n163,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_14_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(14),
  D => u_Flash_Ctroller_608K_n164,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_13_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(13),
  D => u_Flash_Ctroller_608K_n165,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_12_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(12),
  D => u_Flash_Ctroller_608K_n166,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_11_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(11),
  D => u_Flash_Ctroller_608K_n167,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_10_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(10),
  D => u_Flash_Ctroller_608K_n168,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_9_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(9),
  D => u_Flash_Ctroller_608K_n169,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_8_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(8),
  D => u_Flash_Ctroller_608K_n170,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_7_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(7),
  D => u_Flash_Ctroller_608K_n171,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_6_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(6),
  D => u_Flash_Ctroller_608K_n172,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_5_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(5),
  D => u_Flash_Ctroller_608K_n173,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_4_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(4),
  D => u_Flash_Ctroller_608K_n174,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_3_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(3),
  D => u_Flash_Ctroller_608K_n175,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_2_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(2),
  D => u_Flash_Ctroller_608K_n176,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_1_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(1),
  D => u_Flash_Ctroller_608K_n177,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wdata_0_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wdata\(0),
  D => u_Flash_Ctroller_608K_n178,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_8_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(8),
  D => wxaddr_i(8),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_7_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(7),
  D => wxaddr_i(7),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_6_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(6),
  D => wxaddr_i(6),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_5_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(5),
  D => wxaddr_i(5),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_4_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(4),
  D => wxaddr_i(4),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_3_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(3),
  D => wxaddr_i(3),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_2_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(2),
  D => wxaddr_i(2),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_1_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(1),
  D => wxaddr_i(1),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wxaddr_0_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wxaddr\(0),
  D => wxaddr_i(0),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wyaddr_5_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wyaddr\(5),
  D => wyaddr_i(5),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wyaddr_4_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wyaddr\(4),
  D => wyaddr_i(4),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wyaddr_3_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wyaddr\(3),
  D => wyaddr_i(3),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wyaddr_2_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wyaddr\(2),
  D => wyaddr_i(2),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wyaddr_1_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wyaddr\(1),
  D => wyaddr_i(1),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/wyaddr_0_s0\: DFFCE
port map (
  Q => \u_Flash_Ctroller_608K/wyaddr\(0),
  D => wyaddr_i(0),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_wdata_31,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_31_s0\: DFFCE
port map (
  Q => rdata_o(31),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(31),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_30_s0\: DFFCE
port map (
  Q => rdata_o(30),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(30),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_29_s0\: DFFCE
port map (
  Q => rdata_o(29),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(29),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_28_s0\: DFFCE
port map (
  Q => rdata_o(28),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(28),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_27_s0\: DFFCE
port map (
  Q => rdata_o(27),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(27),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_26_s0\: DFFCE
port map (
  Q => rdata_o(26),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(26),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_25_s0\: DFFCE
port map (
  Q => rdata_o(25),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(25),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_24_s0\: DFFCE
port map (
  Q => rdata_o(24),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(24),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_23_s0\: DFFCE
port map (
  Q => rdata_o(23),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(23),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_22_s0\: DFFCE
port map (
  Q => rdata_o(22),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(22),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_21_s0\: DFFCE
port map (
  Q => rdata_o(21),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(21),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_20_s0\: DFFCE
port map (
  Q => rdata_o(20),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(20),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_19_s0\: DFFCE
port map (
  Q => rdata_o(19),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(19),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_18_s0\: DFFCE
port map (
  Q => rdata_o(18),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(18),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_17_s0\: DFFCE
port map (
  Q => rdata_o(17),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(17),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_16_s0\: DFFCE
port map (
  Q => rdata_o(16),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(16),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_15_s0\: DFFCE
port map (
  Q => rdata_o(15),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(15),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_14_s0\: DFFCE
port map (
  Q => rdata_o(14),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(14),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_13_s0\: DFFCE
port map (
  Q => rdata_o(13),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(13),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_12_s0\: DFFCE
port map (
  Q => rdata_o(12),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(12),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_11_s0\: DFFCE
port map (
  Q => rdata_o(11),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(11),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_10_s0\: DFFCE
port map (
  Q => rdata_o(10),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(10),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_9_s0\: DFFCE
port map (
  Q => rdata_o(9),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(9),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_8_s0\: DFFCE
port map (
  Q => rdata_o(8),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(8),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_7_s0\: DFFCE
port map (
  Q => rdata_o(7),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(7),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_6_s0\: DFFCE
port map (
  Q => rdata_o(6),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(6),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_5_s0\: DFFCE
port map (
  Q => rdata_o(5),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(5),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_4_s0\: DFFCE
port map (
  Q => rdata_o(4),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(4),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_3_s0\: DFFCE
port map (
  Q => rdata_o(3),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(3),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_2_s0\: DFFCE
port map (
  Q => rdata_o(2),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(2),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_1_s0\: DFFCE
port map (
  Q => rdata_o(1),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(1),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/comp_data_0_s0\: DFFCE
port map (
  Q => rdata_o(0),
  D => \u_Flash_Ctroller_608K/u_GW_USER_FLASH_608K/DOUT\(0),
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n530,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/XADR_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/XADR\(8),
  D => u_Flash_Ctroller_608K_n308,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n201,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n202,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n203,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n204,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n205,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n206,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n207,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n208,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xe_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_ER_UFM_e_xe,
  D => u_Flash_Ctroller_608K_u_ER_UFM_n209,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_ER_UFM_e_erase,
  D => u_Flash_Ctroller_608K_u_ER_UFM_n210,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvstr_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_ER_UFM_e_nvstr,
  D => u_Flash_Ctroller_608K_u_ER_UFM_n211,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n279,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n280,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n282,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n212,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n213,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n214,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n215,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n216,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n217_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n218,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n219,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n220_15,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n221,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n222,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n223_13,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n224,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n225_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n226,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n227_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_22_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(22),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n228,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_21_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(21),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n229,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_20_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(20),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n230_12,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_19_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(19),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n231,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_18_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(18),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n232,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_17_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(17),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n233,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_16_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(16),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n234,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_15_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(15),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n235,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_14_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(14),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n236,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_13_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n237,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_12_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(12),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n238,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_11_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(11),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n239,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_10_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(10),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n240,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_9_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(9),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n241,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(8),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n242,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n243,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n244,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n245,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n246,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n247,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n248_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n249,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n250,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n251,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n252,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n253,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n254,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n255,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n256,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n257,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n258,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n259,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n260,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n261,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n262,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n263,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n264_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n265,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n266,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(8),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n267,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(7),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n268,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(6),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n269,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(5),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n270,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(4),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n271,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(3),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n272,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(2),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n273,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n274,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n275,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/end_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n276,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/end_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(0),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n277,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/e_busy_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_ER_UFM_e_busy,
  D => u_Flash_Ctroller_608K_u_ER_UFM_n278,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/xadr_tmp_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(8),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n200,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n187,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n188,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n189,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n190,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n191,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n192,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n193,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n194,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/yadr_tmp_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n195,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/yadr_tmp_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n196,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/yadr_tmp_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n197,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/yadr_tmp_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n198,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/yadr_tmp_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n199,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/yadr_tmp_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n200,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_31_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(31),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n201,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_30_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(30),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n202,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_29_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(29),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n203,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_28_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(28),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n204,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_27_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(27),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n205,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_26_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(26),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n206,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_25_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(25),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n207,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_24_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(24),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n208,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_23_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(23),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n209,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_22_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(22),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n210,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_21_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(21),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n211,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_20_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(20),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n212,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_19_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(19),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n213,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_18_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(18),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n214,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_17_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(17),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n215,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_16_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(16),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n216,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_15_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(15),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n217,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_14_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(14),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n218,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_13_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(13),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n219,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_12_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(12),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n220,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_11_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(11),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n221,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_10_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(10),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n222,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_9_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(9),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n223,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(8),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n224,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n225,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n226,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n227,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n228,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n229,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n230,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n231,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/din_tmp_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n232,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xe_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_WR_UFM_w_xe,
  D => u_Flash_Ctroller_608K_u_WR_UFM_n233,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/ye_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_WR_UFM_w_ye,
  D => u_Flash_Ctroller_608K_u_WR_UFM_n234,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_WR_UFM_w_prog,
  D => u_Flash_Ctroller_608K_u_WR_UFM_n235,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvstr_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_WR_UFM_w_nvstr,
  D => u_Flash_Ctroller_608K_u_WR_UFM_n236,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/w_state_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n237,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/w_state_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n238_32,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/w_state_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n239,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/w_state_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n240,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n241,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n242,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n243,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n244,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n245,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n246_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n247,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n248_13,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(8),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n249,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n250,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n251,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n252,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n253,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n254,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n255_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n256,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n257_13,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(8),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n258,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n259,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n260,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n261,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n262,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n263,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n264_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n265,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n266,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(8),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n267,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n268,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n269,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n270,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n271,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n272,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n273_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n274,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n275_13,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n276,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n277,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n278,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n279,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n280,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n281_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n282,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n283,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(8),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n284,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(7),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n285,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(6),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n286,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(5),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n287,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(4),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n288,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(3),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n289,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(2),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n290_11,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n291,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n292,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(1),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n293,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(0),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n294,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/w_busy_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_WR_UFM_w_busy,
  D => u_Flash_Ctroller_608K_u_WR_UFM_n295_71,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_WR_UFM/xadr_tmp_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(8),
  D => u_Flash_Ctroller_608K_u_WR_UFM_n186,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_7_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(7),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n30,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_6_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(6),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n31,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(5),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n32,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(4),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n33,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(3),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n34,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(2),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n35,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(1),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n36,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(0),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n37,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/yadr_tmp_5_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(5),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n38,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/yadr_tmp_4_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(4),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n39,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/yadr_tmp_3_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(3),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n40,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/yadr_tmp_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(2),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n41,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/yadr_tmp_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(1),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n42,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/yadr_tmp_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(0),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n43,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xe_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_RD_UFM_r_xe,
  D => u_Flash_Ctroller_608K_u_RD_UFM_n44,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/se_tmp_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_RD_UFM_r_se,
  D => u_Flash_Ctroller_608K_u_RD_UFM_n46,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/r_state_2_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n53,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/r_state_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n54,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/r_state_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n55_23,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/as_cnt_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_RD_UFM_as_cnt,
  D => u_Flash_Ctroller_608K_u_RD_UFM_n47,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/pws_cnt_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_RD_UFM_pws_cnt,
  D => u_Flash_Ctroller_608K_u_RD_UFM_n48,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/ah_cnt_s0\: DFFC
port map (
  Q => u_Flash_Ctroller_608K_u_RD_UFM_ah_cnt,
  D => u_Flash_Ctroller_608K_u_RD_UFM_n49,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/end_cnt_1_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(1),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n50,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/end_cnt_0_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(0),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n51,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/xadr_tmp_8_s0\: DFFC
port map (
  Q => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(8),
  D => u_Flash_Ctroller_608K_u_RD_UFM_n29,
  CLK => clk_i,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/Done_signal_reg_s1\: DFFCE
port map (
  Q => NN,
  D => u_Flash_Ctroller_608K_n414,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_n412,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/state_UFM_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_Flash_Ctroller_608K/state_UFM\(1),
  D => u_Flash_Ctroller_608K_n412,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_state_UFM_1,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  D => u_Flash_Ctroller_608K_u_ER_UFM_n281,
  CLK => clk_i,
  CE => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1_12,
  CLEAR => u_Flash_Ctroller_608K_n137);
\u_Flash_Ctroller_608K/u_RD_UFM/n55_s11\: LUT3
generic map (
  INIT => X"3A"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n55,
  I0 => u_Flash_Ctroller_608K_r_command,
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_as_cnt,
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0));
\u_Flash_Ctroller_608K/u_RD_UFM/n55_s12\: LUT3
generic map (
  INIT => X"3A"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n55_16,
  I0 => u_Flash_Ctroller_608K_u_RD_UFM_pws_cnt,
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_ah_cnt,
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0));
\u_Flash_Ctroller_608K/n530_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_n530,
  I0 => u_Flash_Ctroller_608K_u_RD_UFM_r_xe,
  I1 => u_Flash_Ctroller_608K_r_busy_d0);
\u_Flash_Ctroller_608K/n308_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n308,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(8),
  I2 => u_Flash_Ctroller_608K_n308_17);
\u_Flash_Ctroller_608K/n309_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n309,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(7),
  I2 => u_Flash_Ctroller_608K_n309_17);
\u_Flash_Ctroller_608K/n310_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n310,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(6),
  I2 => u_Flash_Ctroller_608K_n310_17);
\u_Flash_Ctroller_608K/n311_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n311,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(5),
  I2 => u_Flash_Ctroller_608K_n311_17);
\u_Flash_Ctroller_608K/n312_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n312,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(4),
  I2 => u_Flash_Ctroller_608K_n312_17);
\u_Flash_Ctroller_608K/n313_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n313,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(3),
  I2 => u_Flash_Ctroller_608K_n313_17);
\u_Flash_Ctroller_608K/n314_s10\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_Flash_Ctroller_608K_n314,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(2),
  I2 => u_Flash_Ctroller_608K_n314_17);
\u_Flash_Ctroller_608K/n315_s10\: LUT4
generic map (
  INIT => X"F111"
)
port map (
  F => u_Flash_Ctroller_608K_n315,
  I0 => u_Flash_Ctroller_608K_n315_17,
  I1 => u_Flash_Ctroller_608K_n315_18,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(1),
  I3 => u_Flash_Ctroller_608K_n363);
\u_Flash_Ctroller_608K/n316_s10\: LUT4
generic map (
  INIT => X"40FF"
)
port map (
  F => u_Flash_Ctroller_608K_n316,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I3 => u_Flash_Ctroller_608K_n316_17);
\u_Flash_Ctroller_608K/n355_s10\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_Flash_Ctroller_608K_n355,
  I0 => u_Flash_Ctroller_608K_n363,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_e_xe,
  I2 => u_Flash_Ctroller_608K_n355_17);
\u_Flash_Ctroller_608K/n360_s11\: LUT4
generic map (
  INIT => X"F888"
)
port map (
  F => u_Flash_Ctroller_608K_n360,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_e_nvstr,
  I1 => u_Flash_Ctroller_608K_n363,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_w_nvstr,
  I3 => u_Flash_Ctroller_608K_n360_26);
\u_Flash_Ctroller_608K/n411_s10\: LUT4
generic map (
  INIT => X"40FF"
)
port map (
  F => u_Flash_Ctroller_608K_n411,
  I0 => wr_en_i,
  I1 => u_Flash_Ctroller_608K_n411_17,
  I2 => u_Flash_Ctroller_608K_n411_18,
  I3 => u_Flash_Ctroller_608K_n411_19);
\u_Flash_Ctroller_608K/n413_s13\: LUT4
generic map (
  INIT => X"FFF8"
)
port map (
  F => u_Flash_Ctroller_608K_n413,
  I0 => u_Flash_Ctroller_608K_n362,
  I1 => u_Flash_Ctroller_608K_n530,
  I2 => u_Flash_Ctroller_608K_n413_21,
  I3 => u_Flash_Ctroller_608K_n413_22);
\u_Flash_Ctroller_608K/u_WR_UFM/n233_s25\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n233,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s23\: LUT4
generic map (
  INIT => X"40FF"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n240_31,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n236,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n240_32,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n240_33);
\u_Flash_Ctroller_608K/n414_s14\: LUT3
generic map (
  INIT => X"4F"
)
port map (
  F => u_Flash_Ctroller_608K_n412,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n53_s12\: LUT4
generic map (
  INIT => X"FF70"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n53,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(0),
  I2 => u_Flash_Ctroller_608K_u_RD_UFM_n53_20,
  I3 => u_Flash_Ctroller_608K_u_RD_UFM_n53_21);
\u_Flash_Ctroller_608K/u_WR_UFM/n237_s23\: LUT4
generic map (
  INIT => X"FF80"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n237,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n237_33,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n237_34,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n237_35,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n237_36);
\u_Flash_Ctroller_608K/u_ER_UFM/n279_s23\: LUT4
generic map (
  INIT => X"FF70"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n279,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(0),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n279_33,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n279_34);
\u_Flash_Ctroller_608K/n356_s10\: LUT4
generic map (
  INIT => X"C0A0"
)
port map (
  F => u_Flash_Ctroller_608K_n356,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_w_ye,
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_r_xe,
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n322_s10\: LUT4
generic map (
  INIT => X"A0C0"
)
port map (
  F => u_Flash_Ctroller_608K_n322,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(0),
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n321_s10\: LUT4
generic map (
  INIT => X"A0C0"
)
port map (
  F => u_Flash_Ctroller_608K_n321,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(1),
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n320_s10\: LUT4
generic map (
  INIT => X"A0C0"
)
port map (
  F => u_Flash_Ctroller_608K_n320,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(2),
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n319_s10\: LUT4
generic map (
  INIT => X"A0C0"
)
port map (
  F => u_Flash_Ctroller_608K_n319,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(3),
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n318_s10\: LUT4
generic map (
  INIT => X"A0C0"
)
port map (
  F => u_Flash_Ctroller_608K_n318,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(4),
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n317_s12\: LUT4
generic map (
  INIT => X"A0C0"
)
port map (
  F => u_Flash_Ctroller_608K_n317,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_yadr\(5),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_yadr\(5),
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/u_RD_UFM/n54_s13\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n54,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_n54_21);
\u_Flash_Ctroller_608K/u_WR_UFM/n239_s22\: LUT4
generic map (
  INIT => X"0C0E"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n239,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n236,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n239_34,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n295,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n235_s24\: LUT4
generic map (
  INIT => X"FFB0"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n235,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n240_31,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n237_33,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n238_36);
\u_Flash_Ctroller_608K/u_WR_UFM/n232_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n232,
  I0 => \u_Flash_Ctroller_608K/wdata\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n231_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n231,
  I0 => \u_Flash_Ctroller_608K/wdata\(1),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n230_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n230,
  I0 => \u_Flash_Ctroller_608K/wdata\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n229_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n229,
  I0 => \u_Flash_Ctroller_608K/wdata\(3),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n228_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n228,
  I0 => \u_Flash_Ctroller_608K/wdata\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n227_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n227,
  I0 => \u_Flash_Ctroller_608K/wdata\(5),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n226_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n226,
  I0 => \u_Flash_Ctroller_608K/wdata\(6),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n225_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n225,
  I0 => \u_Flash_Ctroller_608K/wdata\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n224_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n224,
  I0 => \u_Flash_Ctroller_608K/wdata\(8),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n223_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n223,
  I0 => \u_Flash_Ctroller_608K/wdata\(9),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n222_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n222,
  I0 => \u_Flash_Ctroller_608K/wdata\(10),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n221_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n221,
  I0 => \u_Flash_Ctroller_608K/wdata\(11),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n220_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n220,
  I0 => \u_Flash_Ctroller_608K/wdata\(12),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n219_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n219,
  I0 => \u_Flash_Ctroller_608K/wdata\(13),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n218_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n218,
  I0 => \u_Flash_Ctroller_608K/wdata\(14),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n217_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n217,
  I0 => \u_Flash_Ctroller_608K/wdata\(15),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n216_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n216,
  I0 => \u_Flash_Ctroller_608K/wdata\(16),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n215_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n215,
  I0 => \u_Flash_Ctroller_608K/wdata\(17),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n214_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n214,
  I0 => \u_Flash_Ctroller_608K/wdata\(18),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n213_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n213,
  I0 => \u_Flash_Ctroller_608K/wdata\(19),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n212_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n212,
  I0 => \u_Flash_Ctroller_608K/wdata\(20),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n211_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n211,
  I0 => \u_Flash_Ctroller_608K/wdata\(21),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n210_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n210,
  I0 => \u_Flash_Ctroller_608K/wdata\(22),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n209_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n209,
  I0 => \u_Flash_Ctroller_608K/wdata\(23),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n208_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n208,
  I0 => \u_Flash_Ctroller_608K/wdata\(24),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n207_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n207,
  I0 => \u_Flash_Ctroller_608K/wdata\(25),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n206_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n206,
  I0 => \u_Flash_Ctroller_608K/wdata\(26),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n205_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n205,
  I0 => \u_Flash_Ctroller_608K/wdata\(27),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n204_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n204,
  I0 => \u_Flash_Ctroller_608K/wdata\(28),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n203_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n203,
  I0 => \u_Flash_Ctroller_608K/wdata\(29),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n202_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n202,
  I0 => \u_Flash_Ctroller_608K/wdata\(30),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n201_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n201,
  I0 => \u_Flash_Ctroller_608K/wdata\(31),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n200_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n200,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n199_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n199,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(1),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n198_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n198,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n197_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n197,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(3),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n196_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n196,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n195_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n195,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(5),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n194_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n194,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n193_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n193,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(1),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n192_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n192,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n191_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n191,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(3),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n190_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n190,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n189_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n189,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(5),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n188_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n188,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(6),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n187_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n187,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_WR_UFM/n186_s20\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n186,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(8),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_44);
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s22\: LUT4
generic map (
  INIT => X"FEFF"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_30,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n282_31,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_48);
\u_Flash_Ctroller_608K/u_ER_UFM/n280_s24\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n280,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n280_36);
\u_Flash_Ctroller_608K/u_ER_UFM/n208_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n208,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(0),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n207_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n207,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n206_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n206,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(2),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n205_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n205,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(3),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n204_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n204,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(4),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n203_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n203,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(5),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n202_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n202,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(6),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n201_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n201,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(7),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_ER_UFM/n200_s21\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n200,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/wxaddr\(8),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n208_28);
\u_Flash_Ctroller_608K/u_RD_UFM/n50_s5\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n50,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_RD_UFM_n53_20);
\u_Flash_Ctroller_608K/u_RD_UFM/n49_s5\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n49,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_ah_cnt,
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1));
\u_Flash_Ctroller_608K/u_RD_UFM/n47_s6\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n47,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I2 => u_Flash_Ctroller_608K_u_RD_UFM_as_cnt,
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0));
\u_Flash_Ctroller_608K/u_WR_UFM/n294_s3\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n294,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n294_9);
\u_Flash_Ctroller_608K/u_WR_UFM/n293_s5\: LUT4
generic map (
  INIT => X"6000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n293,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(1),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n294_9);
\u_Flash_Ctroller_608K/u_WR_UFM/n292_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n292,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n291_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n291,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n289_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n289,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n290,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n288_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n288,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n288_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n287_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n287,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n288_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n286_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n286,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n286_9,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n288_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n285_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n285,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n285_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n284_s6\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n284,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n285_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(8),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_WR_UFM/n283_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n283,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n282_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n282,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n280_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n280,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n281,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n279_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n279,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n279_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n278_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n278,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n279_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n277_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n277,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n277_9,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n279_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n276_s4\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n276,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n276_12,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n274_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n274,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n272_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n272,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n273,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n271_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n271,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n271_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n270_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n270,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n271_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n269_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n269,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n269_9,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n271_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n268_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n268,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n268_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n267_s5\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n267,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n268_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(8),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n266_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n266,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n265_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n265,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n263_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n263,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n264,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n262_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n262,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n262_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n261_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n261,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n262_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n260_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n260,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n262_11,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n260_9,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n259_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n259,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n259_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n258_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n258,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n259_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(8),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n256_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n256,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n254_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n254,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n255,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n253_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n253,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n253_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n252_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n252,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n253_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n251_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n251,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n251_9,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n253_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n250_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n250,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n250_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n249_s6\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n249,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n250_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(8),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n247_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n247,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n248);
\u_Flash_Ctroller_608K/u_WR_UFM/n245_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n245,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n246,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n248);
\u_Flash_Ctroller_608K/u_WR_UFM/n244_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n244,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n244_11,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n248);
\u_Flash_Ctroller_608K/u_WR_UFM/n243_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n243,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n244_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n248);
\u_Flash_Ctroller_608K/u_WR_UFM/n242_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n242,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(6),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n242_9,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n248);
\u_Flash_Ctroller_608K/u_WR_UFM/n241_s5\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n241,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(6),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n242_9,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(7),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n248);
\u_Flash_Ctroller_608K/u_WR_UFM/n234_s6\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n234,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n234_12,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n237_33,
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0));
\u_Flash_Ctroller_608K/u_ER_UFM/n277_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n277,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n279_33);
\u_Flash_Ctroller_608K/u_ER_UFM/n276_s6\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n276,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/end_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n279_33);
\u_Flash_Ctroller_608K/u_ER_UFM/n274_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n274,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n274_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n273_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n273,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(2),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29);
\u_Flash_Ctroller_608K/u_ER_UFM/n272_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n272,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(3),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n272_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n274_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n271_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n271,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n271_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29);
\u_Flash_Ctroller_608K/u_ER_UFM/n270_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n270,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n271_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29);
\u_Flash_Ctroller_608K/u_ER_UFM/n269_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n269,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n269_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n271_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29);
\u_Flash_Ctroller_608K/u_ER_UFM/n268_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n268,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n268_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29);
\u_Flash_Ctroller_608K/u_ER_UFM/n267_s4\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n267,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n268_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(8),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_29);
\u_Flash_Ctroller_608K/u_ER_UFM/n266_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n266,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n265_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n265,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n265_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n263_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n263,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n264,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n262_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n262,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n262_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n265_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n261_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n261,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n262_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n260_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n260,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n262_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n260_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n259_s5\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n259,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n262_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n259_13,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(7),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n258_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n258,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n257_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n257,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n256_s3\: LUT4
generic map (
  INIT => X"6000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n256,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n256_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n211,
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0));
\u_Flash_Ctroller_608K/u_ER_UFM/n255_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n255,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n256_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n254_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n254,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n254_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n253_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n253,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n254_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n252_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n252,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n252_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n254_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n251_s5\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n251,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n254_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n251_13,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(7),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n250_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n250,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n249_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n249,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n247_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n247,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n248,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n246_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n246,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n245_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n245,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n244_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n244,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n244_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n243_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n243,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n243_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n242_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n242,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n242_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(8),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n241_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n241,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(9),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n241_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n240_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n240,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(9),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n241_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(10),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n239_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n239,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(11),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n239_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n238_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n238,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(11),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n239_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(12),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n237_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n237,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n236_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n236,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(14),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n235_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n235,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n235_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(15),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n234_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n234,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(16),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n234_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n233_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n233,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(16),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n234_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(17),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n232_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n232,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n232_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(18),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n231_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n231,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n231_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n229_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n229,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(20),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n230,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(21),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n228_s6\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n228,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(22),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n228_12,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n224_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n224,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n225,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n227);
\u_Flash_Ctroller_608K/u_ER_UFM/n222_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n222,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n223,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n227);
\u_Flash_Ctroller_608K/u_ER_UFM/n221_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n221,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n221_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n223,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n227);
\u_Flash_Ctroller_608K/u_ER_UFM/n219_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n219,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n219_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n218_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n218,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n218_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n216_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n216,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(2),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n217,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(3),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n219_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n215_s3\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n215,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n215_11,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n218_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n214_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n214,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n215_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n219_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n213_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n213,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n215_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n213_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(6),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n219_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n212_s6\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n212,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n215_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n212_14,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(7),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n219_11);
\u_Flash_Ctroller_608K/u_RD_UFM/n46_s24\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n46,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1));
\u_Flash_Ctroller_608K/u_RD_UFM/n44_s23\: LUT3
generic map (
  INIT => X"0E"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n44,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_ER_UFM/n211_s24\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n211,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2));
\u_Flash_Ctroller_608K/n363_s23\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_n363,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(0));
\u_Flash_Ctroller_608K/n361_s24\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_n361,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n278_s47\: LUT4
generic map (
  INIT => X"00FE"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n278,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n210_s48\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n210,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41);
\u_Flash_Ctroller_608K/u_ER_UFM/n209_s48\: LUT4
generic map (
  INIT => X"070C"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n209,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/n414_s15\: LUT4
generic map (
  INIT => X"E8FF"
)
port map (
  F => u_Flash_Ctroller_608K_n414,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I2 => NN,
  I3 => u_Flash_Ctroller_608K_n414_24);
\u_Flash_Ctroller_608K/state_UFM_1_s3\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_Flash_Ctroller_608K_state_UFM_1,
  I0 => u_Flash_Ctroller_608K_state_UFM_1_9,
  I1 => u_Flash_Ctroller_608K_n414_24);
\u_Flash_Ctroller_608K/u_ER_UFM/n281_s30\: LUT4
generic map (
  INIT => X"F444"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n281,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n281_41,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n280_36,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1_10,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1);
\u_Flash_Ctroller_608K/n308_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n308_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(8),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(8),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n309_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n309_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(7),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(7),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n310_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n310_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(6),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(6),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n311_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n311_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(5),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(5),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n312_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n312_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(4),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(4),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n313_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n313_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(3),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(3),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n314_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n314_17,
  I0 => u_Flash_Ctroller_608K_n360_26,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(2),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(2),
  I3 => u_Flash_Ctroller_608K_n362);
\u_Flash_Ctroller_608K/n315_s11\: LUT4
generic map (
  INIT => X"FA3F"
)
port map (
  F => u_Flash_Ctroller_608K_n315_17,
  I0 => u_Flash_Ctroller_608K_n315_19,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(1),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/n315_s12\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_n315_18,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0));
\u_Flash_Ctroller_608K/n316_s11\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_Flash_Ctroller_608K_n316_17,
  I0 => u_Flash_Ctroller_608K_n316_18,
  I1 => u_Flash_Ctroller_608K_n316_19,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_xadr\(0),
  I3 => u_Flash_Ctroller_608K_n363);
\u_Flash_Ctroller_608K/n355_s11\: LUT4
generic map (
  INIT => X"C0A0"
)
port map (
  F => u_Flash_Ctroller_608K_n355_17,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_w_xe,
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_r_xe,
  I2 => u_Flash_Ctroller_608K_n356_16,
  I3 => u_Flash_Ctroller_608K_n356_17);
\u_Flash_Ctroller_608K/n411_s11\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_n411_17,
  I0 => erase_en_i,
  I1 => start_flag_i);
\u_Flash_Ctroller_608K/n411_s12\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_n411_18,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n411_s13\: LUT4
generic map (
  INIT => X"BBF0"
)
port map (
  F => u_Flash_Ctroller_608K_n411_19,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => u_Flash_Ctroller_608K_n414_24,
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n413_s14\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_n413_21,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_w_busy,
  I1 => u_Flash_Ctroller_608K_w_busy_d0,
  I2 => u_Flash_Ctroller_608K_n361);
\u_Flash_Ctroller_608K/n413_s15\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_n413_22,
  I0 => u_Flash_Ctroller_608K_n414_24,
  I1 => u_Flash_Ctroller_608K_n413_23);
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s24\: LUT4
generic map (
  INIT => X"BF00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_31,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n240_34,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n240_35,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n240_36);
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s25\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_32,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n234_12,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n240_37);
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s26\: LUT4
generic map (
  INIT => X"B0BB"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_33,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n240_38,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n240_39,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n233_38,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n237_36);
\u_Flash_Ctroller_608K/u_WR_UFM/n295_s49\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n295,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1));
\u_Flash_Ctroller_608K/u_RD_UFM/n53_s13\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n53_20,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n53_s14\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n53_21,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => u_Flash_Ctroller_608K_u_RD_UFM_ah_cnt);
\u_Flash_Ctroller_608K/u_WR_UFM/n237_s24\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n237_33,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n237_s25\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n237_34,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(7),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n277_9,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n237_37);
\u_Flash_Ctroller_608K/u_WR_UFM/n237_s26\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n237_35,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n237_s27\: LUT4
generic map (
  INIT => X"7F00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n237_36,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/wait_cnt\(1),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n294_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n279_s24\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n279_33,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n279_s25\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n279_34,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n279_35,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n279_36);
\u_Flash_Ctroller_608K/n356_s11\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_Flash_Ctroller_608K_n356_16,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/n356_s12\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_n356_17,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n54_s14\: LUT4
generic map (
  INIT => X"C05F"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n54_21,
  I0 => u_Flash_Ctroller_608K_u_RD_UFM_as_cnt,
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_ah_cnt,
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s23\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_29,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n279_36,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n279_35,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n274_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s24\: LUT4
generic map (
  INIT => X"0700"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_30,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_33,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n282_34,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_35);
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s25\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_31,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_36,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n232_9,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_37);
\u_Flash_Ctroller_608K/u_ER_UFM/n280_s26\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(7),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n221_9,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n280_37);
\u_Flash_Ctroller_608K/u_ER_UFM/n280_s27\: LUT4
generic map (
  INIT => X"0700"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n280_36,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n279_36,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n279_35,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2));
\u_Flash_Ctroller_608K/u_ER_UFM/n208_s22\: LUT3
generic map (
  INIT => X"7E"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n208_28,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n294_s4\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n294_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n290_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n290,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n286_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n286_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n281_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n281,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n277_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n277_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n273_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n273,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n269_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n269_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n264_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n264,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n260_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n260_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n255_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n255,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n251_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n251_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n246_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n246,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n242_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n242_9,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(5),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n244_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n234_s7\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n234_12,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n234_13,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n234_14);
\u_Flash_Ctroller_608K/u_ER_UFM/n274_s4\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n274_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2));
\u_Flash_Ctroller_608K/u_ER_UFM/n272_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n272_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(2));
\u_Flash_Ctroller_608K/u_ER_UFM/n269_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n269_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n266_s4\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n266_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2));
\u_Flash_Ctroller_608K/u_ER_UFM/n264_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n264,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n260_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n260_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n258_s4\: LUT4
generic map (
  INIT => X"7000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n258_9,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n258_10,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n258_11,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n211);
\u_Flash_Ctroller_608K/u_ER_UFM/n256_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n256_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n252_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n252_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n250_s4\: LUT4
generic map (
  INIT => X"7F00"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n250_9,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_36,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n232_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n282_37,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n248_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n248,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n246_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(2),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n244_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n244_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n242_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n242_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(5),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(6),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(7));
\u_Flash_Ctroller_608K/u_ER_UFM/n241_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n241_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(8),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n242_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n239_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n239_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(9),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(10),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n241_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n237_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(8),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n242_9,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n237_10);
\u_Flash_Ctroller_608K/u_ER_UFM/n235_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n235_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(14));
\u_Flash_Ctroller_608K/u_ER_UFM/n232_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n232_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n232_10);
\u_Flash_Ctroller_608K/u_ER_UFM/n231_s4\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n231_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(18),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n232_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(19));
\u_Flash_Ctroller_608K/u_ER_UFM/n230_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n230,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n230_10);
\u_Flash_Ctroller_608K/u_ER_UFM/n228_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n228_12,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(20),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(21),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n230_10);
\u_Flash_Ctroller_608K/u_ER_UFM/n227_s4\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n227,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41);
\u_Flash_Ctroller_608K/u_ER_UFM/n225_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n225,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n221_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n221_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n217_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n217,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n213_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n213_9,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(5));
\u_Flash_Ctroller_608K/n414_s16\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_Flash_Ctroller_608K_n414_24,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_e_busy,
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => u_Flash_Ctroller_608K_e_busy_d0,
  I3 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/state_UFM_1_s4\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_state_UFM_1_9,
  I0 => erase_en_i,
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => wr_en_i,
  I3 => start_flag_i);
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_1_s4\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_1_s5\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1_10,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n281_s31\: LUT3
generic map (
  INIT => X"0B"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n281_41,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/n315_s13\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_n315_19,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(1));
\u_Flash_Ctroller_608K/n316_s12\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_Flash_Ctroller_608K_n316_18,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_xadr\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_xadr\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(0));
\u_Flash_Ctroller_608K/n316_s13\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_n316_19,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/n413_s16\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_Flash_Ctroller_608K_n413_23,
  I0 => erase_en_i,
  I1 => start_flag_i,
  I2 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n233_s28\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n233_38,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n233_39,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n233_40,
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0));
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s27\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_34,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(6),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(7),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(8));
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s28\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_35,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s29\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_36,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s30\: LUT4
generic map (
  INIT => X"BF00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_37,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n240_40,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n240_41,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n295);
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s31\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_38,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n238,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n238_30);
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s32\: LUT4
generic map (
  INIT => X"F400"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_39,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => u_Flash_Ctroller_608K_w_command,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n239_32);
\u_Flash_Ctroller_608K/u_WR_UFM/n237_s28\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n237_37,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(1),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n279_s26\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n279_35,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(7),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(8));
\u_Flash_Ctroller_608K/u_ER_UFM/n279_s27\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n279_36,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n279_37,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_33);
\u_Flash_Ctroller_608K/u_WR_UFM/n239_s24\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n239_32,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n238_s22\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n238,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(1),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n238_s23\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n238_30,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(5),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(6),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(7));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s27\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_33,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s28\: LUT4
generic map (
  INIT => X"0700"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_34,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_39,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_40,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s29\: LUT4
generic map (
  INIT => X"F400"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_35,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => u_Flash_Ctroller_608K_e_command,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1);
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s30\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_36,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(7),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(8),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(9),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(6));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s31\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_37,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_41,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_42,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n282_43,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n282_44);
\u_Flash_Ctroller_608K/u_ER_UFM/n280_s28\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n280_37,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(1),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n234_s8\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n234_13,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(2),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n234_s9\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n234_14,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(6),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(7),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(8));
\u_Flash_Ctroller_608K/u_ER_UFM/n258_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n258_10,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(5),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(6),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(7));
\u_Flash_Ctroller_608K/u_ER_UFM/n258_s6\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n258_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(1),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n237_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n237_10,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(9),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(10),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(11),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(12));
\u_Flash_Ctroller_608K/u_ER_UFM/n232_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n232_10,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(14),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(15),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(16),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(17));
\u_Flash_Ctroller_608K/u_ER_UFM/n230_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n230_10,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(18),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(19),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n232_10);
\u_Flash_Ctroller_608K/u_WR_UFM/n233_s29\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n233_39,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(6),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(7),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(8));
\u_Flash_Ctroller_608K/u_WR_UFM/n233_s30\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n233_40,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s33\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_40,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n240_s34\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n240_41,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(6),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(7),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(8));
\u_Flash_Ctroller_608K/u_ER_UFM/n279_s28\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n279_37,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(3),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s33\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_39,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(3),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s34\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_40,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(5),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(6),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(7));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s35\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_41,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s36\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_42,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(19),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(21),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(20),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(22));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s37\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_43,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s38\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_44,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(12),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(18),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(10),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(11));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s39\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_45,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(1),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(3),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0));
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s40\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_46,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(4),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(5),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(6),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(7));
\u_Flash_Ctroller_608K/wdata_31_s2\: LUT4
generic map (
  INIT => X"0004"
)
port map (
  F => u_Flash_Ctroller_608K_wdata_31,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I1 => start_flag_i,
  I2 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/e_state_1_s6\: LUT4
generic map (
  INIT => X"BFFB"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1_12,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_e_state_1,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n212_s8\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n212_14,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n230_s6\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n230_12,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(20),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n230_10,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n250_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n234_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n234_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(15),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n237_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(13),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(14));
\u_Flash_Ctroller_608K/u_ER_UFM/n243_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n243_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(6),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n246_9,
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n248_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n248_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/erase_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n249_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n251_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n251_13,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n259_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n259_13,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(5));
\u_Flash_Ctroller_608K/u_ER_UFM/n268_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n268_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n271_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n271_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n271_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(3),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(1),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(2));
\u_Flash_Ctroller_608K/u_ER_UFM/n265_s5\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n265_11,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_45,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_46,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_ER_UFM/n282_s41\: LUT4
generic map (
  INIT => X"007F"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n282_48,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_45,
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n282_46,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n258_9);
\u_Flash_Ctroller_608K/u_RD_UFM/n48_s6\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n48,
  I0 => u_Flash_Ctroller_608K_u_RD_UFM_pws_cnt,
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n250_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n250_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n253_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n259_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n259_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(6),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n262_11,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(4),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(5));
\u_Flash_Ctroller_608K/u_WR_UFM/n268_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n268_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n271_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n285_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n285_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n288_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n215_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n215_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n217_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n217_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/cps_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n219_11);
\u_Flash_Ctroller_608K/u_ER_UFM/n220_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n220,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n223);
\u_Flash_Ctroller_608K/u_ER_UFM/n223_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n223,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n225_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n225_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n227);
\u_Flash_Ctroller_608K/u_ER_UFM/n254_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n254_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/nhv_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n262_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n262_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(1));
\u_Flash_Ctroller_608K/u_ER_UFM/n264_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n264_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/whd_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n266_9);
\u_Flash_Ctroller_608K/u_RD_UFM/n51_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n51,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/end_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n248_s5\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n248,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n238,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n238_30,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n238_36);
\u_Flash_Ctroller_608K/u_WR_UFM/n239_s25\: LUT4
generic map (
  INIT => X"7F00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n239_34,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n238,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n238_30,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n237_35,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n239_32);
\u_Flash_Ctroller_608K/u_WR_UFM/n238_s24\: LUT4
generic map (
  INIT => X"FF80"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n238_32,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n238,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n238_30,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n238_36,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n236);
\u_Flash_Ctroller_608K/u_WR_UFM/n244_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n244_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n246_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n246_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n238_36);
\u_Flash_Ctroller_608K/u_WR_UFM/n253_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n253_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n255_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n255_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n257);
\u_Flash_Ctroller_608K/u_WR_UFM/n262_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n262_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n264_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n264_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/prog_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n234);
\u_Flash_Ctroller_608K/u_WR_UFM/n271_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n271_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n273_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n273_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n275);
\u_Flash_Ctroller_608K/u_WR_UFM/n276_s6\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n276_12,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(6),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(4),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(5),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n279_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n279_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n279_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n281_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n281_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/nvh_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n283_11);
\u_Flash_Ctroller_608K/u_WR_UFM/n288_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n288_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n290_s5\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n290_11,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/whd_cnt\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n233_42);
\u_Flash_Ctroller_608K/u_ER_UFM/n249_s5\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n249_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n233_s31\: LUT4
generic map (
  INIT => X"0200"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n233_42,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n233_38,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n233_s32\: LUT4
generic map (
  INIT => X"00FE"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n233_44,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n295_s50\: LUT4
generic map (
  INIT => X"01FE"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n295_71,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n238_s26\: LUT4
generic map (
  INIT => X"0008"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n238_36,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n283_s5\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n283_11,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n237_34,
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n237_33,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n236_s24\: LUT4
generic map (
  INIT => X"7F00"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n236,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n237_34,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(0),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(1),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n237_33);
\u_Flash_Ctroller_608K/u_ER_UFM/n280_s30\: LUT4
generic map (
  INIT => X"0008"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n280_41,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n218_s5\: LUT3
generic map (
  INIT => X"02"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n218_11,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_n282_34,
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3));
\u_Flash_Ctroller_608K/u_ER_UFM/n219_s5\: LUT4
generic map (
  INIT => X"0004"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n219_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(2),
  I3 => \u_Flash_Ctroller_608K/u_ER_UFM/e_state\(3));
\u_Flash_Ctroller_608K/u_WR_UFM/n257_s5\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n257,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_n240_37,
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n275_s5\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n275,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n240_31);
\u_Flash_Ctroller_608K/u_ER_UFM/n220_s8\: LUT4
generic map (
  INIT => X"0600"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n220_15,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(7),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n220,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41);
\u_Flash_Ctroller_608K/u_ER_UFM/n223_s6\: LUT4
generic map (
  INIT => X"0600"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n223_13,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(4),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n223,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41);
\u_Flash_Ctroller_608K/u_ER_UFM/n226_s4\: LUT4
generic map (
  INIT => X"0600"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n226,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(1),
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41);
\u_Flash_Ctroller_608K/u_ER_UFM/n227_s5\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n227_11,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/nvs_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n280_35,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n280_41);
\u_Flash_Ctroller_608K/u_ER_UFM/n275_s4\: LUT4
generic map (
  INIT => X"1500"
)
port map (
  F => u_Flash_Ctroller_608K_u_ER_UFM_n275,
  I0 => \u_Flash_Ctroller_608K/u_ER_UFM/rcv_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_ER_UFM_n279_36,
  I2 => u_Flash_Ctroller_608K_u_ER_UFM_n279_35,
  I3 => u_Flash_Ctroller_608K_u_ER_UFM_n274_9);
\u_Flash_Ctroller_608K/n362_s25\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_Flash_Ctroller_608K_n362,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/n359_s6\: LUT4
generic map (
  INIT => X"0200"
)
port map (
  F => u_Flash_Ctroller_608K_n359,
  I0 => u_Flash_Ctroller_608K_u_ER_UFM_e_erase,
  I1 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(0));
\u_Flash_Ctroller_608K/u_RD_UFM/n29_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n29,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(8),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n30_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n30,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(7),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n31_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n31,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(6),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n32_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n32,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(5),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n33_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n33,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(4),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n34_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n34,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(3),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n35_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n35,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(2),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n36_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n36,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(1),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n37_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n37,
  I0 => \u_Flash_Ctroller_608K/wxaddr\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n38_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n38,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(5),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n39_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n39,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(4),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n40_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n40,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(3),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n41_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n41,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(2),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n42_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n42,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(1),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/u_RD_UFM/n43_s12\: LUT4
generic map (
  INIT => X"00A8"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n43,
  I0 => \u_Flash_Ctroller_608K/wyaddr\(0),
  I1 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1),
  I2 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(0),
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2));
\u_Flash_Ctroller_608K/n147_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n147,
  I0 => wdata_i(31),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n148_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n148,
  I0 => wdata_i(30),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n149_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n149,
  I0 => wdata_i(29),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n150_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n150,
  I0 => wdata_i(28),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n151_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n151,
  I0 => wdata_i(27),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n152_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n152,
  I0 => wdata_i(26),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n153_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n153,
  I0 => wdata_i(25),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n154_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n154,
  I0 => wdata_i(24),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n155_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n155,
  I0 => wdata_i(23),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n156_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n156,
  I0 => wdata_i(22),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n157_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n157,
  I0 => wdata_i(21),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n158_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n158,
  I0 => wdata_i(20),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n159_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n159,
  I0 => wdata_i(19),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n160_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n160,
  I0 => wdata_i(18),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n161_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n161,
  I0 => wdata_i(17),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n162_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n162,
  I0 => wdata_i(16),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n163_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n163,
  I0 => wdata_i(15),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n164_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n164,
  I0 => wdata_i(14),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n165_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n165,
  I0 => wdata_i(13),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n166_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n166,
  I0 => wdata_i(12),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n167_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n167,
  I0 => wdata_i(11),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n168_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n168,
  I0 => wdata_i(10),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n169_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n169,
  I0 => wdata_i(9),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n170_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n170,
  I0 => wdata_i(8),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n171_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n171,
  I0 => wdata_i(7),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n172_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n172,
  I0 => wdata_i(6),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n173_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n173,
  I0 => wdata_i(5),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n174_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n174,
  I0 => wdata_i(4),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n175_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n175,
  I0 => wdata_i(3),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n176_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n176,
  I0 => wdata_i(2),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n177_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n177,
  I0 => wdata_i(1),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/n178_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_Flash_Ctroller_608K_n178,
  I0 => wdata_i(0),
  I1 => erase_en_i,
  I2 => start_flag_i);
\u_Flash_Ctroller_608K/u_RD_UFM/n55_s16\: LUT4
generic map (
  INIT => X"5044"
)
port map (
  F => u_Flash_Ctroller_608K_u_RD_UFM_n55_23,
  I0 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(2),
  I1 => u_Flash_Ctroller_608K_u_RD_UFM_n55,
  I2 => u_Flash_Ctroller_608K_u_RD_UFM_n55_16,
  I3 => \u_Flash_Ctroller_608K/u_RD_UFM/r_state\(1));
\u_Flash_Ctroller_608K/n360_s15\: LUT3
generic map (
  INIT => X"38"
)
port map (
  F => u_Flash_Ctroller_608K_n360_26,
  I0 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/u_WR_UFM/n248_s6\: LUT4
generic map (
  INIT => X"1500"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n248_13,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/nvs_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n238,
  I2 => u_Flash_Ctroller_608K_u_WR_UFM_n238_30,
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n238_36);
\u_Flash_Ctroller_608K/u_WR_UFM/n257_s6\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n257_13,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgs_cnt\(0),
  I1 => u_Flash_Ctroller_608K_u_WR_UFM_n240_37,
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I3 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2));
\u_Flash_Ctroller_608K/u_WR_UFM/n275_s6\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_Flash_Ctroller_608K_u_WR_UFM_n275_13,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/pgh_cnt\(0),
  I1 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(3),
  I2 => \u_Flash_Ctroller_608K/u_WR_UFM/w_state\(2),
  I3 => u_Flash_Ctroller_608K_u_WR_UFM_n240_31);
\u_Flash_Ctroller_608K/n357_s6\: LUT4
generic map (
  INIT => X"0200"
)
port map (
  F => u_Flash_Ctroller_608K_n357,
  I0 => u_Flash_Ctroller_608K_u_RD_UFM_r_se,
  I1 => \u_Flash_Ctroller_608K/state_UFM\(1),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(2));
\u_Flash_Ctroller_608K/n358_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n358,
  I0 => u_Flash_Ctroller_608K_u_WR_UFM_w_prog,
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n354_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n354,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(0),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n353_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n353,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(1),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n352_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n352,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(2),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n351_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n351,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(3),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n350_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n350,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(4),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n349_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n349,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(5),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n348_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n348,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(6),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n347_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n347,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(7),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n346_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n346,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(8),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n345_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n345,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(9),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n344_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n344,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(10),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n343_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n343,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(11),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n342_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n342,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(12),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n341_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n341,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(13),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n340_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n340,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(14),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n339_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n339,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(15),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n338_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n338,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(16),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n337_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n337,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(17),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n336_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n336,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(18),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n335_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n335,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(19),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n334_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n334,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(20),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n333_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n333,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(21),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n332_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n332,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(22),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n331_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n331,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(23),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n330_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n330,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(24),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n329_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n329,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(25),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n328_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n328,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(26),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n327_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n327,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(27),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n326_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n326,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(28),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n325_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n325,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(29),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n324_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n324,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(30),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n323_s13\: LUT4
generic map (
  INIT => X"0A80"
)
port map (
  F => u_Flash_Ctroller_608K_n323,
  I0 => \u_Flash_Ctroller_608K/u_WR_UFM/w_din\(31),
  I1 => \u_Flash_Ctroller_608K/state_UFM\(0),
  I2 => \u_Flash_Ctroller_608K/state_UFM\(2),
  I3 => \u_Flash_Ctroller_608K/state_UFM\(1));
\u_Flash_Ctroller_608K/n137_s2\: INV
port map (
  O => u_Flash_Ctroller_608K_n137,
  I => nrst_i);
GND_s3: GND
port map (
  G => GND_0);
VCC_s3: VCC
port map (
  V => VCC_0);
GSR_0: GSR
port map (
  GSRI => VCC_0);
  done_flag_o <= NN;
end beh;
