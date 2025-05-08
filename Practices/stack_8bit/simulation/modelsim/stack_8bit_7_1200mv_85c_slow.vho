-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/06/2025 14:52:51"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	stack_8bit IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	push : IN std_logic;
	pop : IN std_logic;
	peek : IN std_logic;
	data_in : IN std_logic_vector(7 DOWNTO 0);
	data_out : OUT std_logic_vector(7 DOWNTO 0);
	full : OUT std_logic;
	empty : OUT std_logic
	);
END stack_8bit;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[1]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[2]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[3]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[4]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[5]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[7]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- full	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- empty	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- push	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pop	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- peek	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF stack_8bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_push : std_logic;
SIGNAL ww_pop : std_logic;
SIGNAL ww_peek : std_logic;
SIGNAL ww_data_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_out : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_full : std_logic;
SIGNAL ww_empty : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_out[0]~output_o\ : std_logic;
SIGNAL \data_out[1]~output_o\ : std_logic;
SIGNAL \data_out[2]~output_o\ : std_logic;
SIGNAL \data_out[3]~output_o\ : std_logic;
SIGNAL \data_out[4]~output_o\ : std_logic;
SIGNAL \data_out[5]~output_o\ : std_logic;
SIGNAL \data_out[6]~output_o\ : std_logic;
SIGNAL \data_out[7]~output_o\ : std_logic;
SIGNAL \full~output_o\ : std_logic;
SIGNAL \empty~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \push~input_o\ : std_logic;
SIGNAL \pop~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \pointer[2]~3_combout\ : std_logic;
SIGNAL \pointer[2]~4_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \pointer[1]~7_combout\ : std_logic;
SIGNAL \Decoder0~4_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \pointer~2_combout\ : std_logic;
SIGNAL \pointer[3]~5_combout\ : std_logic;
SIGNAL \pointer[3]~6_combout\ : std_logic;
SIGNAL \Add1~3_combout\ : std_logic;
SIGNAL \Decoder0~25_combout\ : std_logic;
SIGNAL \stack[0][0]~q\ : std_logic;
SIGNAL \Add1~1_combout\ : std_logic;
SIGNAL \Decoder0~22_combout\ : std_logic;
SIGNAL \stack[4][0]~q\ : std_logic;
SIGNAL \stack[2][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~6_combout\ : std_logic;
SIGNAL \Decoder0~23_combout\ : std_logic;
SIGNAL \stack[2][0]~q\ : std_logic;
SIGNAL \Decoder0~24_combout\ : std_logic;
SIGNAL \stack[6][0]~q\ : std_logic;
SIGNAL \data_out~7_combout\ : std_logic;
SIGNAL \data_out~8_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \stack[3][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~7_combout\ : std_logic;
SIGNAL \stack[3][0]~q\ : std_logic;
SIGNAL \stack[1][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~11_combout\ : std_logic;
SIGNAL \Decoder0~5_combout\ : std_logic;
SIGNAL \Decoder0~12_combout\ : std_logic;
SIGNAL \stack[1][0]~q\ : std_logic;
SIGNAL \Decoder0~8_combout\ : std_logic;
SIGNAL \Decoder0~9_combout\ : std_logic;
SIGNAL \stack[5][0]~q\ : std_logic;
SIGNAL \Decoder0~10_combout\ : std_logic;
SIGNAL \stack[7][0]~q\ : std_logic;
SIGNAL \data_out~0_combout\ : std_logic;
SIGNAL \data_out~1_combout\ : std_logic;
SIGNAL \stack[9][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~19_combout\ : std_logic;
SIGNAL \Decoder0~20_combout\ : std_logic;
SIGNAL \stack[9][0]~q\ : std_logic;
SIGNAL \stack[11][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~18_combout\ : std_logic;
SIGNAL \Decoder0~26_combout\ : std_logic;
SIGNAL \stack[11][0]~q\ : std_logic;
SIGNAL \data_out~4_combout\ : std_logic;
SIGNAL \stack[13][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~21_combout\ : std_logic;
SIGNAL \Decoder0~27_combout\ : std_logic;
SIGNAL \stack[13][0]~q\ : std_logic;
SIGNAL \data_out~5_combout\ : std_logic;
SIGNAL \stack[8][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~17_combout\ : std_logic;
SIGNAL \stack[8][0]~q\ : std_logic;
SIGNAL \Decoder0~13_combout\ : std_logic;
SIGNAL \Decoder0~14_combout\ : std_logic;
SIGNAL \stack[10][0]~q\ : std_logic;
SIGNAL \Decoder0~15_combout\ : std_logic;
SIGNAL \stack[12][0]~q\ : std_logic;
SIGNAL \Decoder0~16_combout\ : std_logic;
SIGNAL \stack[14][0]~q\ : std_logic;
SIGNAL \data_out~2_combout\ : std_logic;
SIGNAL \data_out~3_combout\ : std_logic;
SIGNAL \data_out~6_combout\ : std_logic;
SIGNAL \data_out~9_combout\ : std_logic;
SIGNAL \peek~input_o\ : std_logic;
SIGNAL \data_out[0]~10_combout\ : std_logic;
SIGNAL \data_out[0]~reg0_q\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \stack[2][1]~q\ : std_logic;
SIGNAL \stack[0][1]~feeder_combout\ : std_logic;
SIGNAL \stack[0][1]~q\ : std_logic;
SIGNAL \stack[8][1]~feeder_combout\ : std_logic;
SIGNAL \stack[8][1]~q\ : std_logic;
SIGNAL \stack[10][1]~q\ : std_logic;
SIGNAL \data_out~18_combout\ : std_logic;
SIGNAL \data_out~19_combout\ : std_logic;
SIGNAL \stack[1][1]~feeder_combout\ : std_logic;
SIGNAL \stack[1][1]~q\ : std_logic;
SIGNAL \stack[3][1]~q\ : std_logic;
SIGNAL \stack[11][1]~feeder_combout\ : std_logic;
SIGNAL \stack[11][1]~q\ : std_logic;
SIGNAL \stack[9][1]~q\ : std_logic;
SIGNAL \data_out~11_combout\ : std_logic;
SIGNAL \data_out~12_combout\ : std_logic;
SIGNAL \stack[13][1]~feeder_combout\ : std_logic;
SIGNAL \stack[13][1]~q\ : std_logic;
SIGNAL \stack[5][1]~q\ : std_logic;
SIGNAL \stack[7][1]~q\ : std_logic;
SIGNAL \data_out~15_combout\ : std_logic;
SIGNAL \data_out~16_combout\ : std_logic;
SIGNAL \stack[4][1]~feeder_combout\ : std_logic;
SIGNAL \stack[4][1]~q\ : std_logic;
SIGNAL \stack[6][1]~feeder_combout\ : std_logic;
SIGNAL \stack[6][1]~q\ : std_logic;
SIGNAL \stack[12][1]~feeder_combout\ : std_logic;
SIGNAL \stack[12][1]~q\ : std_logic;
SIGNAL \stack[14][1]~q\ : std_logic;
SIGNAL \data_out~13_combout\ : std_logic;
SIGNAL \data_out~14_combout\ : std_logic;
SIGNAL \data_out~17_combout\ : std_logic;
SIGNAL \data_out~20_combout\ : std_logic;
SIGNAL \data_out[1]~reg0_q\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \stack[8][2]~q\ : std_logic;
SIGNAL \stack[0][2]~q\ : std_logic;
SIGNAL \stack[4][2]~feeder_combout\ : std_logic;
SIGNAL \stack[4][2]~q\ : std_logic;
SIGNAL \stack[12][2]~q\ : std_logic;
SIGNAL \data_out~28_combout\ : std_logic;
SIGNAL \data_out~29_combout\ : std_logic;
SIGNAL \stack[11][2]~q\ : std_logic;
SIGNAL \stack[3][2]~feeder_combout\ : std_logic;
SIGNAL \stack[3][2]~q\ : std_logic;
SIGNAL \stack[7][2]~feeder_combout\ : std_logic;
SIGNAL \stack[7][2]~q\ : std_logic;
SIGNAL \data_out~23_combout\ : std_logic;
SIGNAL \data_out~24_combout\ : std_logic;
SIGNAL \stack[6][2]~q\ : std_logic;
SIGNAL \stack[2][2]~q\ : std_logic;
SIGNAL \stack[14][2]~feeder_combout\ : std_logic;
SIGNAL \stack[14][2]~q\ : std_logic;
SIGNAL \stack[10][2]~feeder_combout\ : std_logic;
SIGNAL \stack[10][2]~q\ : std_logic;
SIGNAL \data_out~25_combout\ : std_logic;
SIGNAL \data_out~26_combout\ : std_logic;
SIGNAL \data_out~27_combout\ : std_logic;
SIGNAL \stack[9][2]~feeder_combout\ : std_logic;
SIGNAL \stack[9][2]~q\ : std_logic;
SIGNAL \stack[1][2]~q\ : std_logic;
SIGNAL \stack[5][2]~feeder_combout\ : std_logic;
SIGNAL \stack[5][2]~q\ : std_logic;
SIGNAL \stack[13][2]~q\ : std_logic;
SIGNAL \data_out~21_combout\ : std_logic;
SIGNAL \data_out~22_combout\ : std_logic;
SIGNAL \data_out~30_combout\ : std_logic;
SIGNAL \data_out[2]~reg0_q\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \stack[2][3]~q\ : std_logic;
SIGNAL \stack[0][3]~q\ : std_logic;
SIGNAL \stack[4][3]~q\ : std_logic;
SIGNAL \stack[6][3]~q\ : std_logic;
SIGNAL \data_out~38_combout\ : std_logic;
SIGNAL \data_out~39_combout\ : std_logic;
SIGNAL \stack[8][3]~feeder_combout\ : std_logic;
SIGNAL \stack[8][3]~q\ : std_logic;
SIGNAL \stack[12][3]~q\ : std_logic;
SIGNAL \stack[10][3]~q\ : std_logic;
SIGNAL \stack[14][3]~q\ : std_logic;
SIGNAL \data_out~31_combout\ : std_logic;
SIGNAL \data_out~32_combout\ : std_logic;
SIGNAL \stack[1][3]~feeder_combout\ : std_logic;
SIGNAL \stack[1][3]~q\ : std_logic;
SIGNAL \stack[5][3]~q\ : std_logic;
SIGNAL \stack[3][3]~feeder_combout\ : std_logic;
SIGNAL \stack[3][3]~q\ : std_logic;
SIGNAL \stack[7][3]~q\ : std_logic;
SIGNAL \data_out~33_combout\ : std_logic;
SIGNAL \data_out~34_combout\ : std_logic;
SIGNAL \stack[13][3]~q\ : std_logic;
SIGNAL \stack[11][3]~feeder_combout\ : std_logic;
SIGNAL \stack[11][3]~q\ : std_logic;
SIGNAL \stack[9][3]~q\ : std_logic;
SIGNAL \data_out~35_combout\ : std_logic;
SIGNAL \data_out~36_combout\ : std_logic;
SIGNAL \data_out~37_combout\ : std_logic;
SIGNAL \data_out~40_combout\ : std_logic;
SIGNAL \data_out[3]~reg0_q\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \stack[4][4]~feeder_combout\ : std_logic;
SIGNAL \stack[4][4]~q\ : std_logic;
SIGNAL \stack[6][4]~q\ : std_logic;
SIGNAL \stack[12][4]~q\ : std_logic;
SIGNAL \stack[14][4]~q\ : std_logic;
SIGNAL \data_out~41_combout\ : std_logic;
SIGNAL \data_out~42_combout\ : std_logic;
SIGNAL \stack[13][4]~q\ : std_logic;
SIGNAL \stack[7][4]~q\ : std_logic;
SIGNAL \stack[5][4]~q\ : std_logic;
SIGNAL \data_out~45_combout\ : std_logic;
SIGNAL \data_out~46_combout\ : std_logic;
SIGNAL \stack[1][4]~feeder_combout\ : std_logic;
SIGNAL \stack[1][4]~q\ : std_logic;
SIGNAL \stack[3][4]~feeder_combout\ : std_logic;
SIGNAL \stack[3][4]~q\ : std_logic;
SIGNAL \stack[11][4]~feeder_combout\ : std_logic;
SIGNAL \stack[11][4]~q\ : std_logic;
SIGNAL \stack[9][4]~feeder_combout\ : std_logic;
SIGNAL \stack[9][4]~q\ : std_logic;
SIGNAL \data_out~43_combout\ : std_logic;
SIGNAL \data_out~44_combout\ : std_logic;
SIGNAL \data_out~47_combout\ : std_logic;
SIGNAL \stack[2][4]~q\ : std_logic;
SIGNAL \stack[0][4]~q\ : std_logic;
SIGNAL \stack[8][4]~feeder_combout\ : std_logic;
SIGNAL \stack[8][4]~q\ : std_logic;
SIGNAL \stack[10][4]~q\ : std_logic;
SIGNAL \data_out~48_combout\ : std_logic;
SIGNAL \data_out~49_combout\ : std_logic;
SIGNAL \data_out~50_combout\ : std_logic;
SIGNAL \data_out[4]~reg0_q\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \stack[4][5]~feeder_combout\ : std_logic;
SIGNAL \stack[4][5]~q\ : std_logic;
SIGNAL \stack[0][5]~q\ : std_logic;
SIGNAL \stack[8][5]~feeder_combout\ : std_logic;
SIGNAL \stack[8][5]~q\ : std_logic;
SIGNAL \stack[12][5]~q\ : std_logic;
SIGNAL \data_out~58_combout\ : std_logic;
SIGNAL \data_out~59_combout\ : std_logic;
SIGNAL \stack[10][5]~feeder_combout\ : std_logic;
SIGNAL \stack[10][5]~q\ : std_logic;
SIGNAL \stack[2][5]~q\ : std_logic;
SIGNAL \stack[6][5]~feeder_combout\ : std_logic;
SIGNAL \stack[6][5]~q\ : std_logic;
SIGNAL \stack[14][5]~q\ : std_logic;
SIGNAL \data_out~51_combout\ : std_logic;
SIGNAL \data_out~52_combout\ : std_logic;
SIGNAL \stack[11][5]~q\ : std_logic;
SIGNAL \stack[3][5]~q\ : std_logic;
SIGNAL \stack[7][5]~q\ : std_logic;
SIGNAL \data_out~53_combout\ : std_logic;
SIGNAL \data_out~54_combout\ : std_logic;
SIGNAL \stack[9][5]~feeder_combout\ : std_logic;
SIGNAL \stack[9][5]~q\ : std_logic;
SIGNAL \stack[1][5]~q\ : std_logic;
SIGNAL \stack[5][5]~q\ : std_logic;
SIGNAL \stack[13][5]~q\ : std_logic;
SIGNAL \data_out~55_combout\ : std_logic;
SIGNAL \data_out~56_combout\ : std_logic;
SIGNAL \data_out~57_combout\ : std_logic;
SIGNAL \data_out~60_combout\ : std_logic;
SIGNAL \data_out[5]~reg0_q\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \stack[8][6]~feeder_combout\ : std_logic;
SIGNAL \stack[8][6]~q\ : std_logic;
SIGNAL \stack[10][6]~q\ : std_logic;
SIGNAL \stack[14][6]~q\ : std_logic;
SIGNAL \data_out~61_combout\ : std_logic;
SIGNAL \stack[12][6]~feeder_combout\ : std_logic;
SIGNAL \stack[12][6]~q\ : std_logic;
SIGNAL \data_out~62_combout\ : std_logic;
SIGNAL \stack[4][6]~q\ : std_logic;
SIGNAL \stack[0][6]~q\ : std_logic;
SIGNAL \stack[2][6]~feeder_combout\ : std_logic;
SIGNAL \stack[2][6]~q\ : std_logic;
SIGNAL \stack[6][6]~q\ : std_logic;
SIGNAL \data_out~68_combout\ : std_logic;
SIGNAL \data_out~69_combout\ : std_logic;
SIGNAL \stack[13][6]~q\ : std_logic;
SIGNAL \stack[9][6]~feeder_combout\ : std_logic;
SIGNAL \stack[9][6]~q\ : std_logic;
SIGNAL \stack[11][6]~q\ : std_logic;
SIGNAL \data_out~65_combout\ : std_logic;
SIGNAL \data_out~66_combout\ : std_logic;
SIGNAL \stack[1][6]~q\ : std_logic;
SIGNAL \stack[5][6]~feeder_combout\ : std_logic;
SIGNAL \stack[5][6]~q\ : std_logic;
SIGNAL \stack[7][6]~feeder_combout\ : std_logic;
SIGNAL \stack[7][6]~q\ : std_logic;
SIGNAL \stack[3][6]~q\ : std_logic;
SIGNAL \data_out~63_combout\ : std_logic;
SIGNAL \data_out~64_combout\ : std_logic;
SIGNAL \data_out~67_combout\ : std_logic;
SIGNAL \data_out~70_combout\ : std_logic;
SIGNAL \data_out[6]~reg0_q\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \stack[0][7]~q\ : std_logic;
SIGNAL \stack[8][7]~q\ : std_logic;
SIGNAL \stack[2][7]~q\ : std_logic;
SIGNAL \stack[10][7]~q\ : std_logic;
SIGNAL \data_out~78_combout\ : std_logic;
SIGNAL \data_out~79_combout\ : std_logic;
SIGNAL \stack[4][7]~feeder_combout\ : std_logic;
SIGNAL \stack[4][7]~q\ : std_logic;
SIGNAL \stack[6][7]~q\ : std_logic;
SIGNAL \stack[12][7]~q\ : std_logic;
SIGNAL \stack[14][7]~q\ : std_logic;
SIGNAL \data_out~71_combout\ : std_logic;
SIGNAL \data_out~72_combout\ : std_logic;
SIGNAL \stack[13][7]~q\ : std_logic;
SIGNAL \stack[5][7]~q\ : std_logic;
SIGNAL \stack[7][7]~feeder_combout\ : std_logic;
SIGNAL \stack[7][7]~q\ : std_logic;
SIGNAL \data_out~75_combout\ : std_logic;
SIGNAL \data_out~76_combout\ : std_logic;
SIGNAL \stack[3][7]~feeder_combout\ : std_logic;
SIGNAL \stack[3][7]~q\ : std_logic;
SIGNAL \stack[1][7]~q\ : std_logic;
SIGNAL \stack[9][7]~q\ : std_logic;
SIGNAL \stack[11][7]~q\ : std_logic;
SIGNAL \data_out~73_combout\ : std_logic;
SIGNAL \data_out~74_combout\ : std_logic;
SIGNAL \data_out~77_combout\ : std_logic;
SIGNAL \data_out~80_combout\ : std_logic;
SIGNAL \data_out[7]~reg0_q\ : std_logic;
SIGNAL \full~0_combout\ : std_logic;
SIGNAL \full~1_combout\ : std_logic;
SIGNAL \empty~0_combout\ : std_logic;
SIGNAL \full~reg0_q\ : std_logic;
SIGNAL \empty~1_combout\ : std_logic;
SIGNAL \empty~reg0_q\ : std_logic;
SIGNAL pointer : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_empty~reg0_q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_push <= push;
ww_pop <= pop;
ww_peek <= peek;
ww_data_in <= data_in;
data_out <= ww_data_out;
full <= ww_full;
empty <= ww_empty;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_empty~reg0_q\ <= NOT \empty~reg0_q\;
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: IOOBUF_X69_Y73_N2
\data_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X79_Y73_N2
\data_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\data_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X79_Y73_N9
\data_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\data_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[4]~output_o\);

-- Location: IOOBUF_X81_Y73_N2
\data_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\data_out[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[6]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[6]~output_o\);

-- Location: IOOBUF_X62_Y73_N16
\data_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out[7]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\full~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \full~reg0_q\,
	devoe => ww_devoe,
	o => \full~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\empty~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_empty~reg0_q\,
	devoe => ww_devoe,
	o => \empty~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X69_Y73_N22
\data_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: IOIBUF_X0_Y36_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: IOIBUF_X74_Y73_N22
\push~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_push,
	o => \push~input_o\);

-- Location: IOIBUF_X67_Y73_N15
\pop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pop,
	o => \pop~input_o\);

-- Location: LCCOMB_X70_Y72_N18
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = pointer(2) $ (((pointer(1) & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => pointer(2),
	datad => pointer(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X69_Y72_N20
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = pointer(2) $ (((pointer(1)) # (pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datac => pointer(1),
	datad => pointer(0),
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X69_Y72_N8
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!pointer(2) & (!pointer(0) & (!pointer(1) & !pointer(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(0),
	datac => pointer(1),
	datad => pointer(3),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X67_Y72_N28
\pointer[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[2]~3_combout\ = (\pop~input_o\ & (!\Add1~0_combout\ & ((!\LessThan1~0_combout\)))) # (!\pop~input_o\ & (((pointer(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pop~input_o\,
	datab => \Add1~0_combout\,
	datac => pointer(2),
	datad => \LessThan1~0_combout\,
	combout => \pointer[2]~3_combout\);

-- Location: LCCOMB_X69_Y72_N22
\pointer[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[2]~4_combout\ = (\process_0~0_combout\ & (\Add0~0_combout\)) # (!\process_0~0_combout\ & ((\pointer[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Add0~0_combout\,
	datad => \pointer[2]~3_combout\,
	combout => \pointer[2]~4_combout\);

-- Location: FF_X69_Y72_N23
\pointer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pointer[2]~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(2));

-- Location: LCCOMB_X69_Y70_N10
\process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (!pointer(3) & !pointer(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pointer(3),
	datad => pointer(1),
	combout => \process_0~1_combout\);

-- Location: LCCOMB_X69_Y70_N8
\process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = ((!pointer(0) & (!pointer(2) & \process_0~1_combout\))) # (!\pop~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \pop~input_o\,
	datac => pointer(2),
	datad => \process_0~1_combout\,
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X69_Y72_N14
\pointer[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[1]~7_combout\ = pointer(1) $ (((\process_0~0_combout\ & (pointer(0))) # (!\process_0~0_combout\ & (!pointer(0) & !\process_0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => pointer(0),
	datac => pointer(1),
	datad => \process_0~2_combout\,
	combout => \pointer[1]~7_combout\);

-- Location: FF_X69_Y72_N15
\pointer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pointer[1]~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(1));

-- Location: LCCOMB_X69_Y72_N16
\Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~4_combout\ = (pointer(1) & pointer(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pointer(1),
	datad => pointer(2),
	combout => \Decoder0~4_combout\);

-- Location: LCCOMB_X69_Y72_N6
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\push~input_o\ & (((!\Decoder0~4_combout\) # (!pointer(3))) # (!pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(3),
	datac => \push~input_o\,
	datad => \Decoder0~4_combout\,
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X69_Y72_N24
\pointer~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer~2_combout\ = pointer(0) $ (((\process_0~0_combout\) # (!\process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datac => pointer(0),
	datad => \process_0~2_combout\,
	combout => \pointer~2_combout\);

-- Location: FF_X69_Y72_N25
\pointer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pointer~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(0));

-- Location: LCCOMB_X70_Y72_N26
\pointer[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[3]~5_combout\ = (\push~input_o\ & (((!pointer(3) & pointer(2))))) # (!\push~input_o\ & (\pop~input_o\ & (pointer(3) & !pointer(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pop~input_o\,
	datab => \push~input_o\,
	datac => pointer(3),
	datad => pointer(2),
	combout => \pointer[3]~5_combout\);

-- Location: LCCOMB_X70_Y72_N12
\pointer[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[3]~6_combout\ = (pointer(3) & ((pointer(0)) # ((pointer(1)) # (!\pointer[3]~5_combout\)))) # (!pointer(3) & (pointer(0) & (pointer(1) & \pointer[3]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => pointer(0),
	datac => pointer(1),
	datad => \pointer[3]~5_combout\,
	combout => \pointer[3]~6_combout\);

-- Location: FF_X69_Y72_N1
\pointer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \pointer[3]~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(3));

-- Location: LCCOMB_X72_Y72_N18
\Add1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~3_combout\ = (!pointer(0) & !pointer(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datad => pointer(1),
	combout => \Add1~3_combout\);

-- Location: LCCOMB_X72_Y72_N30
\Decoder0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~25_combout\ = (!pointer(3) & (!pointer(2) & (\push~input_o\ & \Add1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => pointer(2),
	datac => \push~input_o\,
	datad => \Add1~3_combout\,
	combout => \Decoder0~25_combout\);

-- Location: FF_X72_Y72_N19
\stack[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][0]~q\);

-- Location: LCCOMB_X69_Y72_N26
\Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~1_combout\ = pointer(1) $ (pointer(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pointer(1),
	datad => pointer(0),
	combout => \Add1~1_combout\);

-- Location: LCCOMB_X73_Y72_N16
\Decoder0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~22_combout\ = (pointer(2) & (!pointer(3) & (\Add1~3_combout\ & \process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(3),
	datac => \Add1~3_combout\,
	datad => \process_0~0_combout\,
	combout => \Decoder0~22_combout\);

-- Location: FF_X73_Y72_N13
\stack[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][0]~q\);

-- Location: LCCOMB_X70_Y72_N24
\stack[2][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[2][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[2][0]~feeder_combout\);

-- Location: LCCOMB_X70_Y72_N30
\Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~6_combout\ = (!pointer(3) & \push~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => \push~input_o\,
	combout => \Decoder0~6_combout\);

-- Location: LCCOMB_X70_Y72_N10
\Decoder0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~23_combout\ = (\Decoder0~6_combout\ & (!pointer(2) & (pointer(1) & !pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~6_combout\,
	datab => pointer(2),
	datac => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~23_combout\);

-- Location: FF_X70_Y72_N25
\stack[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[2][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][0]~q\);

-- Location: LCCOMB_X73_Y72_N2
\Decoder0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~24_combout\ = (\push~input_o\ & (!pointer(0) & (!pointer(3) & \Decoder0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(0),
	datac => pointer(3),
	datad => \Decoder0~4_combout\,
	combout => \Decoder0~24_combout\);

-- Location: FF_X73_Y72_N7
\stack[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][0]~q\);

-- Location: LCCOMB_X73_Y72_N6
\data_out~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~7_combout\ = (\Add1~1_combout\ & (((\Add1~0_combout\)))) # (!\Add1~1_combout\ & ((\Add1~0_combout\ & (\stack[2][0]~q\)) # (!\Add1~0_combout\ & ((\stack[6][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datab => \stack[2][0]~q\,
	datac => \stack[6][0]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~7_combout\);

-- Location: LCCOMB_X73_Y72_N12
\data_out~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~8_combout\ = (\Add1~1_combout\ & ((\data_out~7_combout\ & (\stack[0][0]~q\)) # (!\data_out~7_combout\ & ((\stack[4][0]~q\))))) # (!\Add1~1_combout\ & (((\data_out~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][0]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[4][0]~q\,
	datad => \data_out~7_combout\,
	combout => \data_out~8_combout\);

-- Location: LCCOMB_X69_Y72_N18
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = pointer(3) $ (((pointer(2)) # ((pointer(1)) # (pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(3),
	datac => pointer(1),
	datad => pointer(0),
	combout => \Add1~2_combout\);

-- Location: LCCOMB_X69_Y71_N12
\stack[3][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[3][0]~feeder_combout\);

-- Location: LCCOMB_X69_Y71_N10
\Decoder0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~7_combout\ = (pointer(1) & (pointer(0) & (\Decoder0~6_combout\ & !pointer(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => pointer(0),
	datac => \Decoder0~6_combout\,
	datad => pointer(2),
	combout => \Decoder0~7_combout\);

-- Location: FF_X69_Y71_N13
\stack[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[3][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][0]~q\);

-- Location: LCCOMB_X68_Y71_N4
\stack[1][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[1][0]~feeder_combout\);

-- Location: LCCOMB_X68_Y71_N22
\Decoder0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~11_combout\ = (\push~input_o\ & pointer(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \push~input_o\,
	datad => pointer(0),
	combout => \Decoder0~11_combout\);

-- Location: LCCOMB_X68_Y71_N30
\Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~5_combout\ = (!pointer(2) & (!pointer(1) & !pointer(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(1),
	datad => pointer(3),
	combout => \Decoder0~5_combout\);

-- Location: LCCOMB_X68_Y71_N16
\Decoder0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~12_combout\ = (\Decoder0~11_combout\ & (\Decoder0~5_combout\ & ((!\Decoder0~4_combout\) # (!pointer(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~11_combout\,
	datab => pointer(3),
	datac => \Decoder0~5_combout\,
	datad => \Decoder0~4_combout\,
	combout => \Decoder0~12_combout\);

-- Location: FF_X68_Y71_N5
\stack[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[1][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][0]~q\);

-- Location: LCCOMB_X70_Y71_N4
\Decoder0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~8_combout\ = (\push~input_o\ & !pointer(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datad => pointer(1),
	combout => \Decoder0~8_combout\);

-- Location: LCCOMB_X70_Y71_N26
\Decoder0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~9_combout\ = (pointer(2) & (!pointer(3) & (\Decoder0~8_combout\ & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(3),
	datac => \Decoder0~8_combout\,
	datad => pointer(0),
	combout => \Decoder0~9_combout\);

-- Location: FF_X70_Y71_N5
\stack[5][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][0]~q\);

-- Location: LCCOMB_X69_Y72_N0
\Decoder0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~10_combout\ = (\push~input_o\ & (pointer(0) & (!pointer(3) & \Decoder0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(0),
	datac => pointer(3),
	datad => \Decoder0~4_combout\,
	combout => \Decoder0~10_combout\);

-- Location: FF_X70_Y71_N7
\stack[7][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][0]~q\);

-- Location: LCCOMB_X70_Y71_N6
\data_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~0_combout\ = (\Add1~1_combout\ & ((\stack[5][0]~q\) # ((\Add1~0_combout\)))) # (!\Add1~1_combout\ & (((\stack[7][0]~q\ & !\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[5][0]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[7][0]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~0_combout\);

-- Location: LCCOMB_X70_Y71_N0
\data_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~1_combout\ = (\Add1~0_combout\ & ((\data_out~0_combout\ & ((\stack[1][0]~q\))) # (!\data_out~0_combout\ & (\stack[3][0]~q\)))) # (!\Add1~0_combout\ & (((\data_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[3][0]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[1][0]~q\,
	datad => \data_out~0_combout\,
	combout => \data_out~1_combout\);

-- Location: LCCOMB_X69_Y70_N12
\stack[9][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[9][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[9][0]~feeder_combout\);

-- Location: LCCOMB_X69_Y70_N16
\Decoder0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~19_combout\ = (\push~input_o\ & (pointer(0) & ((!\Decoder0~4_combout\) # (!pointer(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => \push~input_o\,
	datac => \Decoder0~4_combout\,
	datad => pointer(0),
	combout => \Decoder0~19_combout\);

-- Location: LCCOMB_X69_Y70_N22
\Decoder0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~20_combout\ = (pointer(3) & (!pointer(1) & (!pointer(2) & \Decoder0~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => pointer(1),
	datac => pointer(2),
	datad => \Decoder0~19_combout\,
	combout => \Decoder0~20_combout\);

-- Location: FF_X69_Y70_N13
\stack[9][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[9][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][0]~q\);

-- Location: LCCOMB_X70_Y70_N4
\stack[11][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[11][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[11][0]~feeder_combout\);

-- Location: LCCOMB_X70_Y70_N6
\Decoder0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~18_combout\ = (\push~input_o\ & (pointer(0) & pointer(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datac => pointer(0),
	datad => pointer(3),
	combout => \Decoder0~18_combout\);

-- Location: LCCOMB_X70_Y70_N8
\Decoder0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~26_combout\ = (pointer(1) & (!pointer(2) & \Decoder0~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pointer(1),
	datac => pointer(2),
	datad => \Decoder0~18_combout\,
	combout => \Decoder0~26_combout\);

-- Location: FF_X70_Y70_N5
\stack[11][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[11][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][0]~q\);

-- Location: LCCOMB_X70_Y72_N22
\data_out~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~4_combout\ = (\stack[9][0]~q\ & ((\stack[11][0]~q\) # (pointer(0) $ (pointer(1))))) # (!\stack[9][0]~q\ & (\stack[11][0]~q\ & (pointer(0) $ (!pointer(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[9][0]~q\,
	datab => pointer(0),
	datac => pointer(1),
	datad => \stack[11][0]~q\,
	combout => \data_out~4_combout\);

-- Location: LCCOMB_X68_Y71_N10
\stack[13][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[13][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[13][0]~feeder_combout\);

-- Location: LCCOMB_X68_Y71_N28
\Decoder0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~21_combout\ = (\push~input_o\ & (!pointer(1) & pointer(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(1),
	datad => pointer(3),
	combout => \Decoder0~21_combout\);

-- Location: LCCOMB_X68_Y71_N18
\Decoder0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~27_combout\ = (pointer(2) & (!pointer(1) & (pointer(0) & \Decoder0~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(1),
	datac => pointer(0),
	datad => \Decoder0~21_combout\,
	combout => \Decoder0~27_combout\);

-- Location: FF_X68_Y71_N11
\stack[13][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[13][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][0]~q\);

-- Location: LCCOMB_X70_Y72_N8
\data_out~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~5_combout\ = (\Add1~0_combout\ & (\data_out~4_combout\)) # (!\Add1~0_combout\ & (((\stack[13][0]~q\ & \Add1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~4_combout\,
	datab => \Add1~0_combout\,
	datac => \stack[13][0]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~5_combout\);

-- Location: LCCOMB_X67_Y72_N4
\stack[8][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[8][0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \stack[8][0]~feeder_combout\);

-- Location: LCCOMB_X67_Y72_N6
\Decoder0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~17_combout\ = (!pointer(2) & (pointer(3) & (\process_0~0_combout\ & \Add1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => pointer(3),
	datac => \process_0~0_combout\,
	datad => \Add1~3_combout\,
	combout => \Decoder0~17_combout\);

-- Location: FF_X67_Y72_N5
\stack[8][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[8][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][0]~q\);

-- Location: LCCOMB_X68_Y72_N22
\Decoder0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~13_combout\ = (\push~input_o\ & pointer(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(3),
	combout => \Decoder0~13_combout\);

-- Location: LCCOMB_X68_Y72_N12
\Decoder0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~14_combout\ = (pointer(1) & (!pointer(2) & (!pointer(0) & \Decoder0~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => pointer(2),
	datac => pointer(0),
	datad => \Decoder0~13_combout\,
	combout => \Decoder0~14_combout\);

-- Location: FF_X68_Y72_N21
\stack[10][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][0]~q\);

-- Location: LCCOMB_X72_Y72_N0
\Decoder0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~15_combout\ = (pointer(3) & (\Add1~3_combout\ & (pointer(2) & \process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => \Add1~3_combout\,
	datac => pointer(2),
	datad => \process_0~0_combout\,
	combout => \Decoder0~15_combout\);

-- Location: FF_X72_Y72_N5
\stack[12][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][0]~q\);

-- Location: LCCOMB_X68_Y72_N30
\Decoder0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~16_combout\ = (\push~input_o\ & (pointer(3) & (!pointer(0) & \Decoder0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(3),
	datac => pointer(0),
	datad => \Decoder0~4_combout\,
	combout => \Decoder0~16_combout\);

-- Location: FF_X68_Y72_N11
\stack[14][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][0]~q\);

-- Location: LCCOMB_X68_Y72_N10
\data_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~2_combout\ = (\Add1~0_combout\ & (((\Add1~1_combout\)))) # (!\Add1~0_combout\ & ((\Add1~1_combout\ & (\stack[12][0]~q\)) # (!\Add1~1_combout\ & ((\stack[14][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[12][0]~q\,
	datac => \stack[14][0]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~2_combout\);

-- Location: LCCOMB_X68_Y72_N20
\data_out~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~3_combout\ = (\Add1~0_combout\ & ((\data_out~2_combout\ & (\stack[8][0]~q\)) # (!\data_out~2_combout\ & ((\stack[10][0]~q\))))) # (!\Add1~0_combout\ & (((\data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[8][0]~q\,
	datac => \stack[10][0]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~3_combout\);

-- Location: LCCOMB_X70_Y72_N6
\data_out~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~6_combout\ = (pointer(0) & ((\Add1~2_combout\) # ((\data_out~3_combout\)))) # (!pointer(0) & (!\Add1~2_combout\ & (\data_out~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \Add1~2_combout\,
	datac => \data_out~5_combout\,
	datad => \data_out~3_combout\,
	combout => \data_out~6_combout\);

-- Location: LCCOMB_X70_Y72_N0
\data_out~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~9_combout\ = (\Add1~2_combout\ & ((\data_out~6_combout\ & (\data_out~8_combout\)) # (!\data_out~6_combout\ & ((\data_out~1_combout\))))) # (!\Add1~2_combout\ & (((\data_out~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~8_combout\,
	datab => \Add1~2_combout\,
	datac => \data_out~1_combout\,
	datad => \data_out~6_combout\,
	combout => \data_out~9_combout\);

-- Location: IOIBUF_X65_Y73_N15
\peek~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_peek,
	o => \peek~input_o\);

-- Location: LCCOMB_X69_Y72_N10
\data_out[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out[0]~10_combout\ = (!\LessThan1~0_combout\ & (!\process_0~0_combout\ & ((\pop~input_o\) # (\peek~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pop~input_o\,
	datab => \peek~input_o\,
	datac => \LessThan1~0_combout\,
	datad => \process_0~0_combout\,
	combout => \data_out[0]~10_combout\);

-- Location: FF_X70_Y72_N1
\data_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~9_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[0]~reg0_q\);

-- Location: IOIBUF_X72_Y73_N1
\data_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: FF_X70_Y72_N31
\stack[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][1]~q\);

-- Location: LCCOMB_X72_Y72_N26
\stack[0][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[0][1]~feeder_combout\);

-- Location: FF_X72_Y72_N27
\stack[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][1]~q\);

-- Location: LCCOMB_X67_Y72_N22
\stack[8][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[8][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[8][1]~feeder_combout\);

-- Location: FF_X67_Y72_N23
\stack[8][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[8][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][1]~q\);

-- Location: FF_X68_Y72_N7
\stack[10][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][1]~q\);

-- Location: LCCOMB_X68_Y72_N6
\data_out~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~18_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[8][1]~q\)) # (!\Add1~1_combout\ & ((\stack[10][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[8][1]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[10][1]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~18_combout\);

-- Location: LCCOMB_X72_Y71_N20
\data_out~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~19_combout\ = (\Add1~2_combout\ & ((\data_out~18_combout\ & ((\stack[0][1]~q\))) # (!\data_out~18_combout\ & (\stack[2][1]~q\)))) # (!\Add1~2_combout\ & (((\data_out~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][1]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[0][1]~q\,
	datad => \data_out~18_combout\,
	combout => \data_out~19_combout\);

-- Location: LCCOMB_X68_Y71_N12
\stack[1][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[1][1]~feeder_combout\);

-- Location: FF_X68_Y71_N13
\stack[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[1][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][1]~q\);

-- Location: FF_X69_Y71_N7
\stack[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][1]~q\);

-- Location: LCCOMB_X70_Y70_N14
\stack[11][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[11][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[11][1]~feeder_combout\);

-- Location: FF_X70_Y70_N15
\stack[11][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[11][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][1]~q\);

-- Location: FF_X69_Y70_N31
\stack[9][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][1]~q\);

-- Location: LCCOMB_X69_Y71_N24
\data_out~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~11_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & ((\stack[9][1]~q\))) # (!\Add1~1_combout\ & (\stack[11][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[11][1]~q\,
	datab => \stack[9][1]~q\,
	datac => \Add1~2_combout\,
	datad => \Add1~1_combout\,
	combout => \data_out~11_combout\);

-- Location: LCCOMB_X69_Y71_N6
\data_out~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~12_combout\ = (\Add1~2_combout\ & ((\data_out~11_combout\ & (\stack[1][1]~q\)) # (!\data_out~11_combout\ & ((\stack[3][1]~q\))))) # (!\Add1~2_combout\ & (((\data_out~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[1][1]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[3][1]~q\,
	datad => \data_out~11_combout\,
	combout => \data_out~12_combout\);

-- Location: LCCOMB_X68_Y71_N2
\stack[13][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[13][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[13][1]~feeder_combout\);

-- Location: FF_X68_Y71_N3
\stack[13][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[13][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][1]~q\);

-- Location: FF_X70_Y71_N21
\stack[5][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][1]~q\);

-- Location: FF_X70_Y71_N11
\stack[7][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][1]~q\);

-- Location: LCCOMB_X70_Y71_N10
\data_out~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~15_combout\ = (pointer(0) & ((pointer(1) & ((\stack[7][1]~q\))) # (!pointer(1) & (\stack[5][1]~q\)))) # (!pointer(0) & ((pointer(1) & (\stack[5][1]~q\)) # (!pointer(1) & ((\stack[7][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \stack[5][1]~q\,
	datac => \stack[7][1]~q\,
	datad => pointer(1),
	combout => \data_out~15_combout\);

-- Location: LCCOMB_X72_Y71_N28
\data_out~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~16_combout\ = (\Add1~2_combout\ & (((\data_out~15_combout\)))) # (!\Add1~2_combout\ & (\stack[13][1]~q\ & (\Add1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[13][1]~q\,
	datab => \Add1~1_combout\,
	datac => \data_out~15_combout\,
	datad => \Add1~2_combout\,
	combout => \data_out~16_combout\);

-- Location: LCCOMB_X73_Y72_N22
\stack[4][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[4][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[4][1]~feeder_combout\);

-- Location: FF_X73_Y72_N23
\stack[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[4][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][1]~q\);

-- Location: LCCOMB_X73_Y72_N8
\stack[6][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[6][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[6][1]~feeder_combout\);

-- Location: FF_X73_Y72_N9
\stack[6][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[6][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][1]~q\);

-- Location: LCCOMB_X72_Y72_N8
\stack[12][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[12][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[12][1]~feeder_combout\);

-- Location: FF_X72_Y72_N9
\stack[12][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[12][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][1]~q\);

-- Location: FF_X68_Y72_N25
\stack[14][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][1]~q\);

-- Location: LCCOMB_X68_Y72_N24
\data_out~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~13_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[12][1]~q\)) # (!\Add1~1_combout\ & ((\stack[14][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[12][1]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[14][1]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~13_combout\);

-- Location: LCCOMB_X72_Y71_N6
\data_out~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~14_combout\ = (\Add1~2_combout\ & ((\data_out~13_combout\ & (\stack[4][1]~q\)) # (!\data_out~13_combout\ & ((\stack[6][1]~q\))))) # (!\Add1~2_combout\ & (((\data_out~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[4][1]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[6][1]~q\,
	datad => \data_out~13_combout\,
	combout => \data_out~14_combout\);

-- Location: LCCOMB_X72_Y71_N2
\data_out~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~17_combout\ = (\Add1~0_combout\ & (((pointer(0))))) # (!\Add1~0_combout\ & ((pointer(0) & ((\data_out~14_combout\))) # (!pointer(0) & (\data_out~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \data_out~16_combout\,
	datac => pointer(0),
	datad => \data_out~14_combout\,
	combout => \data_out~17_combout\);

-- Location: LCCOMB_X72_Y71_N16
\data_out~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~20_combout\ = (\Add1~0_combout\ & ((\data_out~17_combout\ & (\data_out~19_combout\)) # (!\data_out~17_combout\ & ((\data_out~12_combout\))))) # (!\Add1~0_combout\ & (((\data_out~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \data_out~19_combout\,
	datac => \data_out~12_combout\,
	datad => \data_out~17_combout\,
	combout => \data_out~20_combout\);

-- Location: FF_X72_Y71_N17
\data_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[1]~reg0_q\);

-- Location: IOIBUF_X72_Y73_N22
\data_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: FF_X67_Y72_N17
\stack[8][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][2]~q\);

-- Location: FF_X72_Y72_N7
\stack[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][2]~q\);

-- Location: LCCOMB_X73_Y72_N20
\stack[4][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[4][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[4][2]~feeder_combout\);

-- Location: FF_X73_Y72_N21
\stack[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[4][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][2]~q\);

-- Location: FF_X72_Y72_N25
\stack[12][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][2]~q\);

-- Location: LCCOMB_X72_Y72_N24
\data_out~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~28_combout\ = (\Add1~2_combout\ & ((\stack[4][2]~q\) # ((\Add1~0_combout\)))) # (!\Add1~2_combout\ & (((\stack[12][2]~q\ & !\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[4][2]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[12][2]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~28_combout\);

-- Location: LCCOMB_X72_Y72_N6
\data_out~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~29_combout\ = (\Add1~0_combout\ & ((\data_out~28_combout\ & ((\stack[0][2]~q\))) # (!\data_out~28_combout\ & (\stack[8][2]~q\)))) # (!\Add1~0_combout\ & (((\data_out~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[8][2]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[0][2]~q\,
	datad => \data_out~28_combout\,
	combout => \data_out~29_combout\);

-- Location: FF_X70_Y70_N21
\stack[11][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][2]~q\);

-- Location: LCCOMB_X69_Y71_N2
\stack[3][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[3][2]~feeder_combout\);

-- Location: FF_X69_Y71_N3
\stack[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[3][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][2]~q\);

-- Location: LCCOMB_X70_Y71_N24
\stack[7][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[7][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[7][2]~feeder_combout\);

-- Location: FF_X70_Y71_N25
\stack[7][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[7][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][2]~q\);

-- Location: LCCOMB_X69_Y72_N12
\data_out~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~23_combout\ = (\Add1~2_combout\ & ((\Add1~0_combout\ & (\stack[3][2]~q\)) # (!\Add1~0_combout\ & ((\stack[7][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[3][2]~q\,
	datab => \Add1~2_combout\,
	datac => \Add1~0_combout\,
	datad => \stack[7][2]~q\,
	combout => \data_out~23_combout\);

-- Location: LCCOMB_X69_Y72_N2
\data_out~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~24_combout\ = (\data_out~23_combout\) # ((\stack[11][2]~q\ & (!\Add1~2_combout\ & \Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[11][2]~q\,
	datab => \Add1~2_combout\,
	datac => \Add1~0_combout\,
	datad => \data_out~23_combout\,
	combout => \data_out~24_combout\);

-- Location: FF_X74_Y72_N17
\stack[6][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][2]~q\);

-- Location: FF_X70_Y72_N5
\stack[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][2]~q\);

-- Location: LCCOMB_X68_Y72_N2
\stack[14][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[14][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[14][2]~feeder_combout\);

-- Location: FF_X68_Y72_N3
\stack[14][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[14][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][2]~q\);

-- Location: LCCOMB_X68_Y72_N4
\stack[10][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[10][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[10][2]~feeder_combout\);

-- Location: FF_X68_Y72_N5
\stack[10][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[10][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][2]~q\);

-- Location: LCCOMB_X69_Y72_N28
\data_out~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~25_combout\ = (\Add1~2_combout\ & (((\Add1~0_combout\)))) # (!\Add1~2_combout\ & ((\Add1~0_combout\ & ((\stack[10][2]~q\))) # (!\Add1~0_combout\ & (\stack[14][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[14][2]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[10][2]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~25_combout\);

-- Location: LCCOMB_X70_Y72_N4
\data_out~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~26_combout\ = (\Add1~2_combout\ & ((\data_out~25_combout\ & ((\stack[2][2]~q\))) # (!\data_out~25_combout\ & (\stack[6][2]~q\)))) # (!\Add1~2_combout\ & (((\data_out~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[6][2]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[2][2]~q\,
	datad => \data_out~25_combout\,
	combout => \data_out~26_combout\);

-- Location: LCCOMB_X69_Y72_N30
\data_out~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~27_combout\ = (pointer(1) & (((pointer(0) & \data_out~26_combout\)))) # (!pointer(1) & ((\data_out~24_combout\) # ((pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => \data_out~24_combout\,
	datac => pointer(0),
	datad => \data_out~26_combout\,
	combout => \data_out~27_combout\);

-- Location: LCCOMB_X69_Y70_N0
\stack[9][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[9][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[9][2]~feeder_combout\);

-- Location: FF_X69_Y70_N1
\stack[9][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[9][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][2]~q\);

-- Location: FF_X68_Y71_N27
\stack[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][2]~q\);

-- Location: LCCOMB_X70_Y71_N22
\stack[5][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[5][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[5][2]~feeder_combout\);

-- Location: FF_X70_Y71_N23
\stack[5][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[5][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][2]~q\);

-- Location: FF_X68_Y71_N21
\stack[13][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][2]~q\);

-- Location: LCCOMB_X68_Y71_N20
\data_out~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~21_combout\ = (\Add1~0_combout\ & (((\Add1~2_combout\)))) # (!\Add1~0_combout\ & ((\Add1~2_combout\ & (\stack[5][2]~q\)) # (!\Add1~2_combout\ & ((\stack[13][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[5][2]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[13][2]~q\,
	datad => \Add1~2_combout\,
	combout => \data_out~21_combout\);

-- Location: LCCOMB_X68_Y71_N26
\data_out~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~22_combout\ = (\Add1~0_combout\ & ((\data_out~21_combout\ & ((\stack[1][2]~q\))) # (!\data_out~21_combout\ & (\stack[9][2]~q\)))) # (!\Add1~0_combout\ & (((\data_out~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[9][2]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[1][2]~q\,
	datad => \data_out~21_combout\,
	combout => \data_out~22_combout\);

-- Location: LCCOMB_X69_Y72_N4
\data_out~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~30_combout\ = (\Add1~1_combout\ & ((\data_out~27_combout\ & (\data_out~29_combout\)) # (!\data_out~27_combout\ & ((\data_out~22_combout\))))) # (!\Add1~1_combout\ & (((\data_out~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datab => \data_out~29_combout\,
	datac => \data_out~27_combout\,
	datad => \data_out~22_combout\,
	combout => \data_out~30_combout\);

-- Location: FF_X69_Y72_N5
\data_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[2]~reg0_q\);

-- Location: IOIBUF_X67_Y73_N8
\data_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: FF_X70_Y72_N19
\stack[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][3]~q\);

-- Location: FF_X72_Y71_N13
\stack[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][3]~q\);

-- Location: FF_X73_Y72_N15
\stack[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][3]~q\);

-- Location: FF_X73_Y72_N1
\stack[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][3]~q\);

-- Location: LCCOMB_X73_Y72_N0
\data_out~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~38_combout\ = (\Add1~0_combout\ & (((\Add1~1_combout\)))) # (!\Add1~0_combout\ & ((\Add1~1_combout\ & (\stack[4][3]~q\)) # (!\Add1~1_combout\ & ((\stack[6][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[4][3]~q\,
	datac => \stack[6][3]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~38_combout\);

-- Location: LCCOMB_X72_Y71_N12
\data_out~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~39_combout\ = (\Add1~0_combout\ & ((\data_out~38_combout\ & ((\stack[0][3]~q\))) # (!\data_out~38_combout\ & (\stack[2][3]~q\)))) # (!\Add1~0_combout\ & (((\data_out~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][3]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[0][3]~q\,
	datad => \data_out~38_combout\,
	combout => \data_out~39_combout\);

-- Location: LCCOMB_X67_Y72_N14
\stack[8][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[8][3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \stack[8][3]~feeder_combout\);

-- Location: FF_X67_Y72_N15
\stack[8][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[8][3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][3]~q\);

-- Location: FF_X72_Y72_N17
\stack[12][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][3]~q\);

-- Location: FF_X68_Y72_N29
\stack[10][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][3]~q\);

-- Location: FF_X68_Y72_N27
\stack[14][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][3]~q\);

-- Location: LCCOMB_X68_Y72_N26
\data_out~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~31_combout\ = (\Add1~1_combout\ & (((\Add1~0_combout\)))) # (!\Add1~1_combout\ & ((\Add1~0_combout\ & (\stack[10][3]~q\)) # (!\Add1~0_combout\ & ((\stack[14][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[10][3]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[14][3]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~31_combout\);

-- Location: LCCOMB_X72_Y72_N16
\data_out~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~32_combout\ = (\Add1~1_combout\ & ((\data_out~31_combout\ & (\stack[8][3]~q\)) # (!\data_out~31_combout\ & ((\stack[12][3]~q\))))) # (!\Add1~1_combout\ & (((\data_out~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[8][3]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[12][3]~q\,
	datad => \data_out~31_combout\,
	combout => \data_out~32_combout\);

-- Location: LCCOMB_X69_Y71_N26
\stack[1][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \stack[1][3]~feeder_combout\);

-- Location: FF_X69_Y71_N27
\stack[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[1][3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][3]~q\);

-- Location: FF_X70_Y71_N15
\stack[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][3]~q\);

-- Location: LCCOMB_X69_Y71_N8
\stack[3][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \stack[3][3]~feeder_combout\);

-- Location: FF_X69_Y71_N9
\stack[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[3][3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][3]~q\);

-- Location: FF_X70_Y71_N17
\stack[7][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][3]~q\);

-- Location: LCCOMB_X70_Y71_N16
\data_out~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~33_combout\ = (\Add1~1_combout\ & (((\Add1~0_combout\)))) # (!\Add1~1_combout\ & ((\Add1~0_combout\ & (\stack[3][3]~q\)) # (!\Add1~0_combout\ & ((\stack[7][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[3][3]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[7][3]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~33_combout\);

-- Location: LCCOMB_X70_Y71_N14
\data_out~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~34_combout\ = (\Add1~1_combout\ & ((\data_out~33_combout\ & (\stack[1][3]~q\)) # (!\data_out~33_combout\ & ((\stack[5][3]~q\))))) # (!\Add1~1_combout\ & (((\data_out~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[1][3]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[5][3]~q\,
	datad => \data_out~33_combout\,
	combout => \data_out~34_combout\);

-- Location: FF_X68_Y71_N29
\stack[13][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][3]~q\);

-- Location: LCCOMB_X70_Y70_N10
\stack[11][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[11][3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \stack[11][3]~feeder_combout\);

-- Location: FF_X70_Y70_N11
\stack[11][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[11][3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][3]~q\);

-- Location: FF_X69_Y70_N27
\stack[9][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][3]~q\);

-- Location: LCCOMB_X72_Y71_N26
\data_out~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~35_combout\ = (\Add1~0_combout\ & ((\Add1~1_combout\ & ((\stack[9][3]~q\))) # (!\Add1~1_combout\ & (\stack[11][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[11][3]~q\,
	datab => \stack[9][3]~q\,
	datac => \Add1~1_combout\,
	datad => \Add1~0_combout\,
	combout => \data_out~35_combout\);

-- Location: LCCOMB_X72_Y71_N0
\data_out~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~36_combout\ = (\data_out~35_combout\) # ((\Add1~1_combout\ & (\stack[13][3]~q\ & !\Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datab => \stack[13][3]~q\,
	datac => \data_out~35_combout\,
	datad => \Add1~0_combout\,
	combout => \data_out~36_combout\);

-- Location: LCCOMB_X72_Y71_N18
\data_out~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~37_combout\ = (\Add1~2_combout\ & ((pointer(0)) # ((\data_out~34_combout\)))) # (!\Add1~2_combout\ & (!pointer(0) & ((\data_out~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => pointer(0),
	datac => \data_out~34_combout\,
	datad => \data_out~36_combout\,
	combout => \data_out~37_combout\);

-- Location: LCCOMB_X72_Y71_N14
\data_out~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~40_combout\ = (pointer(0) & ((\data_out~37_combout\ & (\data_out~39_combout\)) # (!\data_out~37_combout\ & ((\data_out~32_combout\))))) # (!pointer(0) & (((\data_out~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~39_combout\,
	datab => pointer(0),
	datac => \data_out~32_combout\,
	datad => \data_out~37_combout\,
	combout => \data_out~40_combout\);

-- Location: FF_X72_Y71_N15
\data_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[3]~reg0_q\);

-- Location: IOIBUF_X67_Y73_N22
\data_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: LCCOMB_X73_Y72_N24
\stack[4][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[4][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[4][4]~feeder_combout\);

-- Location: FF_X73_Y72_N25
\stack[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[4][4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][4]~q\);

-- Location: FF_X73_Y72_N31
\stack[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][4]~q\);

-- Location: FF_X72_Y72_N11
\stack[12][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][4]~q\);

-- Location: FF_X68_Y72_N17
\stack[14][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][4]~q\);

-- Location: LCCOMB_X68_Y72_N16
\data_out~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~41_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[12][4]~q\)) # (!\Add1~1_combout\ & ((\stack[14][4]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[12][4]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[14][4]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~41_combout\);

-- Location: LCCOMB_X73_Y72_N30
\data_out~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~42_combout\ = (\Add1~2_combout\ & ((\data_out~41_combout\ & (\stack[4][4]~q\)) # (!\data_out~41_combout\ & ((\stack[6][4]~q\))))) # (!\Add1~2_combout\ & (((\data_out~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \stack[4][4]~q\,
	datac => \stack[6][4]~q\,
	datad => \data_out~41_combout\,
	combout => \data_out~42_combout\);

-- Location: FF_X68_Y71_N31
\stack[13][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][4]~q\);

-- Location: FF_X70_Y71_N3
\stack[7][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][4]~q\);

-- Location: FF_X70_Y71_N29
\stack[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][4]~q\);

-- Location: LCCOMB_X70_Y71_N28
\data_out~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~45_combout\ = (pointer(0) & ((pointer(1) & (\stack[7][4]~q\)) # (!pointer(1) & ((\stack[5][4]~q\))))) # (!pointer(0) & ((pointer(1) & ((\stack[5][4]~q\))) # (!pointer(1) & (\stack[7][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \stack[7][4]~q\,
	datac => \stack[5][4]~q\,
	datad => pointer(1),
	combout => \data_out~45_combout\);

-- Location: LCCOMB_X73_Y71_N4
\data_out~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~46_combout\ = (\Add1~2_combout\ & (((\data_out~45_combout\)))) # (!\Add1~2_combout\ & (\stack[13][4]~q\ & (\Add1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \stack[13][4]~q\,
	datac => \Add1~1_combout\,
	datad => \data_out~45_combout\,
	combout => \data_out~46_combout\);

-- Location: LCCOMB_X69_Y71_N14
\stack[1][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[1][4]~feeder_combout\);

-- Location: FF_X69_Y71_N15
\stack[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[1][4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][4]~q\);

-- Location: LCCOMB_X69_Y71_N20
\stack[3][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[3][4]~feeder_combout\);

-- Location: FF_X69_Y71_N21
\stack[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[3][4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][4]~q\);

-- Location: LCCOMB_X70_Y70_N24
\stack[11][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[11][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[11][4]~feeder_combout\);

-- Location: FF_X70_Y70_N25
\stack[11][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[11][4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][4]~q\);

-- Location: LCCOMB_X69_Y70_N20
\stack[9][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[9][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[9][4]~feeder_combout\);

-- Location: FF_X69_Y70_N21
\stack[9][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[9][4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][4]~q\);

-- Location: LCCOMB_X73_Y71_N28
\data_out~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~43_combout\ = (\Add1~1_combout\ & (((\stack[9][4]~q\) # (\Add1~2_combout\)))) # (!\Add1~1_combout\ & (\stack[11][4]~q\ & ((!\Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[11][4]~q\,
	datab => \stack[9][4]~q\,
	datac => \Add1~1_combout\,
	datad => \Add1~2_combout\,
	combout => \data_out~43_combout\);

-- Location: LCCOMB_X73_Y71_N2
\data_out~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~44_combout\ = (\Add1~2_combout\ & ((\data_out~43_combout\ & (\stack[1][4]~q\)) # (!\data_out~43_combout\ & ((\stack[3][4]~q\))))) # (!\Add1~2_combout\ & (((\data_out~43_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \stack[1][4]~q\,
	datac => \stack[3][4]~q\,
	datad => \data_out~43_combout\,
	combout => \data_out~44_combout\);

-- Location: LCCOMB_X73_Y71_N22
\data_out~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~47_combout\ = (\Add1~0_combout\ & ((pointer(0)) # ((\data_out~44_combout\)))) # (!\Add1~0_combout\ & (!pointer(0) & (\data_out~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => pointer(0),
	datac => \data_out~46_combout\,
	datad => \data_out~44_combout\,
	combout => \data_out~47_combout\);

-- Location: FF_X70_Y72_N29
\stack[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][4]~q\);

-- Location: FF_X72_Y72_N21
\stack[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][4]~q\);

-- Location: LCCOMB_X67_Y72_N0
\stack[8][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[8][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[8][4]~feeder_combout\);

-- Location: FF_X67_Y72_N1
\stack[8][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[8][4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][4]~q\);

-- Location: FF_X68_Y72_N19
\stack[10][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][4]~q\);

-- Location: LCCOMB_X68_Y72_N18
\data_out~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~48_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[8][4]~q\)) # (!\Add1~1_combout\ & ((\stack[10][4]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[8][4]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[10][4]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~48_combout\);

-- Location: LCCOMB_X72_Y72_N20
\data_out~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~49_combout\ = (\Add1~2_combout\ & ((\data_out~48_combout\ & ((\stack[0][4]~q\))) # (!\data_out~48_combout\ & (\stack[2][4]~q\)))) # (!\Add1~2_combout\ & (((\data_out~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][4]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[0][4]~q\,
	datad => \data_out~48_combout\,
	combout => \data_out~49_combout\);

-- Location: LCCOMB_X73_Y71_N0
\data_out~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~50_combout\ = (pointer(0) & ((\data_out~47_combout\ & ((\data_out~49_combout\))) # (!\data_out~47_combout\ & (\data_out~42_combout\)))) # (!pointer(0) & (((\data_out~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~42_combout\,
	datab => pointer(0),
	datac => \data_out~47_combout\,
	datad => \data_out~49_combout\,
	combout => \data_out~50_combout\);

-- Location: FF_X73_Y71_N1
\data_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~50_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[4]~reg0_q\);

-- Location: IOIBUF_X67_Y73_N1
\data_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: LCCOMB_X73_Y72_N4
\stack[4][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[4][5]~feeder_combout\ = \data_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[5]~input_o\,
	combout => \stack[4][5]~feeder_combout\);

-- Location: FF_X73_Y72_N5
\stack[4][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[4][5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][5]~q\);

-- Location: FF_X72_Y72_N29
\stack[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][5]~q\);

-- Location: LCCOMB_X67_Y72_N8
\stack[8][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[8][5]~feeder_combout\ = \data_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[5]~input_o\,
	combout => \stack[8][5]~feeder_combout\);

-- Location: FF_X67_Y72_N9
\stack[8][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[8][5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][5]~q\);

-- Location: FF_X72_Y72_N3
\stack[12][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][5]~q\);

-- Location: LCCOMB_X72_Y72_N2
\data_out~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~58_combout\ = (\Add1~2_combout\ & (((\Add1~0_combout\)))) # (!\Add1~2_combout\ & ((\Add1~0_combout\ & (\stack[8][5]~q\)) # (!\Add1~0_combout\ & ((\stack[12][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[8][5]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[12][5]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~58_combout\);

-- Location: LCCOMB_X72_Y72_N28
\data_out~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~59_combout\ = (\Add1~2_combout\ & ((\data_out~58_combout\ & ((\stack[0][5]~q\))) # (!\data_out~58_combout\ & (\stack[4][5]~q\)))) # (!\Add1~2_combout\ & (((\data_out~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \stack[4][5]~q\,
	datac => \stack[0][5]~q\,
	datad => \data_out~58_combout\,
	combout => \data_out~59_combout\);

-- Location: LCCOMB_X67_Y72_N30
\stack[10][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[10][5]~feeder_combout\ = \data_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[5]~input_o\,
	combout => \stack[10][5]~feeder_combout\);

-- Location: FF_X67_Y72_N31
\stack[10][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[10][5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][5]~q\);

-- Location: FF_X70_Y72_N3
\stack[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][5]~q\);

-- Location: LCCOMB_X73_Y72_N10
\stack[6][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[6][5]~feeder_combout\ = \data_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[5]~input_o\,
	combout => \stack[6][5]~feeder_combout\);

-- Location: FF_X73_Y72_N11
\stack[6][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[6][5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][5]~q\);

-- Location: FF_X68_Y72_N9
\stack[14][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][5]~q\);

-- Location: LCCOMB_X68_Y72_N8
\data_out~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~51_combout\ = (\Add1~0_combout\ & (((\Add1~2_combout\)))) # (!\Add1~0_combout\ & ((\Add1~2_combout\ & (\stack[6][5]~q\)) # (!\Add1~2_combout\ & ((\stack[14][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[6][5]~q\,
	datac => \stack[14][5]~q\,
	datad => \Add1~2_combout\,
	combout => \data_out~51_combout\);

-- Location: LCCOMB_X69_Y71_N16
\data_out~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~52_combout\ = (\Add1~0_combout\ & ((\data_out~51_combout\ & ((\stack[2][5]~q\))) # (!\data_out~51_combout\ & (\stack[10][5]~q\)))) # (!\Add1~0_combout\ & (((\data_out~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[10][5]~q\,
	datab => \stack[2][5]~q\,
	datac => \Add1~0_combout\,
	datad => \data_out~51_combout\,
	combout => \data_out~52_combout\);

-- Location: FF_X70_Y70_N1
\stack[11][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][5]~q\);

-- Location: FF_X69_Y71_N23
\stack[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][5]~q\);

-- Location: FF_X70_Y70_N19
\stack[7][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][5]~q\);

-- Location: LCCOMB_X70_Y70_N18
\data_out~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~53_combout\ = (\Add1~2_combout\ & ((\Add1~0_combout\ & (\stack[3][5]~q\)) # (!\Add1~0_combout\ & ((\stack[7][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[3][5]~q\,
	datac => \stack[7][5]~q\,
	datad => \Add1~2_combout\,
	combout => \data_out~53_combout\);

-- Location: LCCOMB_X70_Y70_N0
\data_out~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~54_combout\ = (\data_out~53_combout\) # ((\Add1~0_combout\ & (!\Add1~2_combout\ & \stack[11][5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \Add1~2_combout\,
	datac => \stack[11][5]~q\,
	datad => \data_out~53_combout\,
	combout => \data_out~54_combout\);

-- Location: LCCOMB_X69_Y70_N14
\stack[9][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[9][5]~feeder_combout\ = \data_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[5]~input_o\,
	combout => \stack[9][5]~feeder_combout\);

-- Location: FF_X69_Y70_N15
\stack[9][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[9][5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][5]~q\);

-- Location: FF_X68_Y71_N15
\stack[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][5]~q\);

-- Location: FF_X70_Y71_N19
\stack[5][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][5]~q\);

-- Location: FF_X68_Y71_N1
\stack[13][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][5]~q\);

-- Location: LCCOMB_X68_Y71_N0
\data_out~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~55_combout\ = (\Add1~0_combout\ & (((\Add1~2_combout\)))) # (!\Add1~0_combout\ & ((\Add1~2_combout\ & (\stack[5][5]~q\)) # (!\Add1~2_combout\ & ((\stack[13][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[5][5]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[13][5]~q\,
	datad => \Add1~2_combout\,
	combout => \data_out~55_combout\);

-- Location: LCCOMB_X68_Y71_N14
\data_out~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~56_combout\ = (\Add1~0_combout\ & ((\data_out~55_combout\ & ((\stack[1][5]~q\))) # (!\data_out~55_combout\ & (\stack[9][5]~q\)))) # (!\Add1~0_combout\ & (((\data_out~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[9][5]~q\,
	datab => \Add1~0_combout\,
	datac => \stack[1][5]~q\,
	datad => \data_out~55_combout\,
	combout => \data_out~56_combout\);

-- Location: LCCOMB_X73_Y71_N12
\data_out~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~57_combout\ = (pointer(0) & (!pointer(1))) # (!pointer(0) & ((pointer(1) & ((\data_out~56_combout\))) # (!pointer(1) & (\data_out~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \data_out~54_combout\,
	datad => \data_out~56_combout\,
	combout => \data_out~57_combout\);

-- Location: LCCOMB_X73_Y71_N30
\data_out~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~60_combout\ = (pointer(0) & ((\data_out~57_combout\ & (\data_out~59_combout\)) # (!\data_out~57_combout\ & ((\data_out~52_combout\))))) # (!pointer(0) & (((\data_out~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~59_combout\,
	datab => pointer(0),
	datac => \data_out~52_combout\,
	datad => \data_out~57_combout\,
	combout => \data_out~60_combout\);

-- Location: FF_X73_Y71_N31
\data_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~60_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[5]~reg0_q\);

-- Location: IOIBUF_X72_Y73_N15
\data_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: LCCOMB_X67_Y72_N2
\stack[8][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[8][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[8][6]~feeder_combout\);

-- Location: FF_X67_Y72_N3
\stack[8][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[8][6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][6]~q\);

-- Location: FF_X68_Y72_N23
\stack[10][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][6]~q\);

-- Location: FF_X68_Y72_N1
\stack[14][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][6]~q\);

-- Location: LCCOMB_X68_Y72_N0
\data_out~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~61_combout\ = (\Add1~1_combout\ & (((\Add1~0_combout\)))) # (!\Add1~1_combout\ & ((\Add1~0_combout\ & (\stack[10][6]~q\)) # (!\Add1~0_combout\ & ((\stack[14][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[10][6]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[14][6]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~61_combout\);

-- Location: LCCOMB_X72_Y72_N22
\stack[12][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[12][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[12][6]~feeder_combout\);

-- Location: FF_X72_Y72_N23
\stack[12][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[12][6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][6]~q\);

-- Location: LCCOMB_X72_Y71_N30
\data_out~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~62_combout\ = (\Add1~1_combout\ & ((\data_out~61_combout\ & (\stack[8][6]~q\)) # (!\data_out~61_combout\ & ((\stack[12][6]~q\))))) # (!\Add1~1_combout\ & (((\data_out~61_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[8][6]~q\,
	datab => \Add1~1_combout\,
	datac => \data_out~61_combout\,
	datad => \stack[12][6]~q\,
	combout => \data_out~62_combout\);

-- Location: FF_X73_Y72_N27
\stack[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][6]~q\);

-- Location: FF_X72_Y71_N9
\stack[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][6]~q\);

-- Location: LCCOMB_X70_Y72_N20
\stack[2][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[2][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[2][6]~feeder_combout\);

-- Location: FF_X70_Y72_N21
\stack[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[2][6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][6]~q\);

-- Location: FF_X73_Y72_N29
\stack[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][6]~q\);

-- Location: LCCOMB_X73_Y72_N28
\data_out~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~68_combout\ = (\Add1~1_combout\ & (((\Add1~0_combout\)))) # (!\Add1~1_combout\ & ((\Add1~0_combout\ & (\stack[2][6]~q\)) # (!\Add1~0_combout\ & ((\stack[6][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datab => \stack[2][6]~q\,
	datac => \stack[6][6]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~68_combout\);

-- Location: LCCOMB_X72_Y71_N8
\data_out~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~69_combout\ = (\Add1~1_combout\ & ((\data_out~68_combout\ & ((\stack[0][6]~q\))) # (!\data_out~68_combout\ & (\stack[4][6]~q\)))) # (!\Add1~1_combout\ & (((\data_out~68_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[4][6]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[0][6]~q\,
	datad => \data_out~68_combout\,
	combout => \data_out~69_combout\);

-- Location: FF_X68_Y71_N23
\stack[13][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][6]~q\);

-- Location: LCCOMB_X69_Y70_N24
\stack[9][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[9][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[9][6]~feeder_combout\);

-- Location: FF_X69_Y70_N25
\stack[9][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[9][6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][6]~q\);

-- Location: FF_X70_Y70_N3
\stack[11][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][6]~q\);

-- Location: LCCOMB_X70_Y70_N2
\data_out~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~65_combout\ = (\stack[9][6]~q\ & ((\stack[11][6]~q\) # (pointer(0) $ (pointer(1))))) # (!\stack[9][6]~q\ & (\stack[11][6]~q\ & (pointer(0) $ (!pointer(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[9][6]~q\,
	datab => pointer(0),
	datac => \stack[11][6]~q\,
	datad => pointer(1),
	combout => \data_out~65_combout\);

-- Location: LCCOMB_X72_Y71_N4
\data_out~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~66_combout\ = (\Add1~0_combout\ & (((\data_out~65_combout\)))) # (!\Add1~0_combout\ & (\stack[13][6]~q\ & (\Add1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[13][6]~q\,
	datab => \Add1~0_combout\,
	datac => \Add1~1_combout\,
	datad => \data_out~65_combout\,
	combout => \data_out~66_combout\);

-- Location: FF_X68_Y71_N9
\stack[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][6]~q\);

-- Location: LCCOMB_X70_Y71_N12
\stack[5][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[5][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[5][6]~feeder_combout\);

-- Location: FF_X70_Y71_N13
\stack[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[5][6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][6]~q\);

-- Location: LCCOMB_X70_Y71_N30
\stack[7][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[7][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[7][6]~feeder_combout\);

-- Location: FF_X70_Y71_N31
\stack[7][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[7][6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][6]~q\);

-- Location: FF_X69_Y71_N29
\stack[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][6]~q\);

-- Location: LCCOMB_X69_Y71_N28
\data_out~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~63_combout\ = (\Add1~1_combout\ & (((\Add1~0_combout\)))) # (!\Add1~1_combout\ & ((\Add1~0_combout\ & ((\stack[3][6]~q\))) # (!\Add1~0_combout\ & (\stack[7][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[7][6]~q\,
	datab => \Add1~1_combout\,
	datac => \stack[3][6]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~63_combout\);

-- Location: LCCOMB_X69_Y71_N30
\data_out~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~64_combout\ = (\Add1~1_combout\ & ((\data_out~63_combout\ & (\stack[1][6]~q\)) # (!\data_out~63_combout\ & ((\stack[5][6]~q\))))) # (!\Add1~1_combout\ & (((\data_out~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[1][6]~q\,
	datab => \stack[5][6]~q\,
	datac => \Add1~1_combout\,
	datad => \data_out~63_combout\,
	combout => \data_out~64_combout\);

-- Location: LCCOMB_X72_Y71_N10
\data_out~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~67_combout\ = (\Add1~2_combout\ & ((pointer(0)) # ((\data_out~64_combout\)))) # (!\Add1~2_combout\ & (!pointer(0) & (\data_out~66_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => pointer(0),
	datac => \data_out~66_combout\,
	datad => \data_out~64_combout\,
	combout => \data_out~67_combout\);

-- Location: LCCOMB_X72_Y71_N24
\data_out~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~70_combout\ = (pointer(0) & ((\data_out~67_combout\ & ((\data_out~69_combout\))) # (!\data_out~67_combout\ & (\data_out~62_combout\)))) # (!pointer(0) & (((\data_out~67_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~62_combout\,
	datab => pointer(0),
	datac => \data_out~69_combout\,
	datad => \data_out~67_combout\,
	combout => \data_out~70_combout\);

-- Location: FF_X72_Y71_N25
\data_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~70_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[6]~reg0_q\);

-- Location: IOIBUF_X65_Y73_N8
\data_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: FF_X72_Y72_N15
\stack[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][7]~q\);

-- Location: FF_X67_Y72_N25
\stack[8][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[8][7]~q\);

-- Location: FF_X70_Y72_N17
\stack[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][7]~q\);

-- Location: FF_X67_Y72_N11
\stack[10][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[10][7]~q\);

-- Location: LCCOMB_X67_Y72_N10
\data_out~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~78_combout\ = (\Add1~1_combout\ & (((\Add1~2_combout\)))) # (!\Add1~1_combout\ & ((\Add1~2_combout\ & (\stack[2][7]~q\)) # (!\Add1~2_combout\ & ((\stack[10][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datab => \stack[2][7]~q\,
	datac => \stack[10][7]~q\,
	datad => \Add1~2_combout\,
	combout => \data_out~78_combout\);

-- Location: LCCOMB_X67_Y72_N24
\data_out~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~79_combout\ = (\Add1~1_combout\ & ((\data_out~78_combout\ & (\stack[0][7]~q\)) # (!\data_out~78_combout\ & ((\stack[8][7]~q\))))) # (!\Add1~1_combout\ & (((\data_out~78_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~1_combout\,
	datab => \stack[0][7]~q\,
	datac => \stack[8][7]~q\,
	datad => \data_out~78_combout\,
	combout => \data_out~79_combout\);

-- Location: LCCOMB_X73_Y72_N18
\stack[4][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[4][7]~feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \stack[4][7]~feeder_combout\);

-- Location: FF_X73_Y72_N19
\stack[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[4][7]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][7]~q\);

-- Location: FF_X66_Y72_N27
\stack[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][7]~q\);

-- Location: FF_X72_Y72_N13
\stack[12][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[12][7]~q\);

-- Location: FF_X68_Y72_N15
\stack[14][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[14][7]~q\);

-- Location: LCCOMB_X68_Y72_N14
\data_out~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~71_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[12][7]~q\)) # (!\Add1~1_combout\ & ((\stack[14][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[12][7]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[14][7]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~71_combout\);

-- Location: LCCOMB_X66_Y72_N26
\data_out~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~72_combout\ = (\Add1~2_combout\ & ((\data_out~71_combout\ & (\stack[4][7]~q\)) # (!\data_out~71_combout\ & ((\stack[6][7]~q\))))) # (!\Add1~2_combout\ & (((\data_out~71_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \stack[4][7]~q\,
	datac => \stack[6][7]~q\,
	datad => \data_out~71_combout\,
	combout => \data_out~72_combout\);

-- Location: FF_X68_Y71_N7
\stack[13][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[13][7]~q\);

-- Location: FF_X70_Y71_N9
\stack[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][7]~q\);

-- Location: LCCOMB_X65_Y72_N20
\stack[7][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[7][7]~feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \stack[7][7]~feeder_combout\);

-- Location: FF_X65_Y72_N21
\stack[7][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[7][7]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[7][7]~q\);

-- Location: LCCOMB_X66_Y72_N2
\data_out~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~75_combout\ = (\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[5][7]~q\)) # (!\Add1~1_combout\ & ((\stack[7][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[5][7]~q\,
	datab => \stack[7][7]~q\,
	datac => \Add1~2_combout\,
	datad => \Add1~1_combout\,
	combout => \data_out~75_combout\);

-- Location: LCCOMB_X66_Y72_N4
\data_out~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~76_combout\ = (\data_out~75_combout\) # ((!\Add1~2_combout\ & (\Add1~1_combout\ & \stack[13][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \Add1~1_combout\,
	datac => \stack[13][7]~q\,
	datad => \data_out~75_combout\,
	combout => \data_out~76_combout\);

-- Location: LCCOMB_X69_Y71_N0
\stack[3][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][7]~feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \stack[3][7]~feeder_combout\);

-- Location: FF_X69_Y71_N1
\stack[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[3][7]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][7]~q\);

-- Location: FF_X68_Y71_N25
\stack[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][7]~q\);

-- Location: FF_X69_Y70_N19
\stack[9][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[9][7]~q\);

-- Location: FF_X70_Y70_N17
\stack[11][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Decoder0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[11][7]~q\);

-- Location: LCCOMB_X70_Y72_N14
\data_out~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~73_combout\ = (\Add1~2_combout\ & (((\Add1~1_combout\)))) # (!\Add1~2_combout\ & ((\Add1~1_combout\ & (\stack[9][7]~q\)) # (!\Add1~1_combout\ & ((\stack[11][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[9][7]~q\,
	datab => \Add1~2_combout\,
	datac => \stack[11][7]~q\,
	datad => \Add1~1_combout\,
	combout => \data_out~73_combout\);

-- Location: LCCOMB_X66_Y72_N28
\data_out~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~74_combout\ = (\Add1~2_combout\ & ((\data_out~73_combout\ & ((\stack[1][7]~q\))) # (!\data_out~73_combout\ & (\stack[3][7]~q\)))) # (!\Add1~2_combout\ & (((\data_out~73_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \stack[3][7]~q\,
	datac => \stack[1][7]~q\,
	datad => \data_out~73_combout\,
	combout => \data_out~74_combout\);

-- Location: LCCOMB_X66_Y72_N10
\data_out~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~77_combout\ = (pointer(0) & (\Add1~0_combout\)) # (!pointer(0) & ((\Add1~0_combout\ & ((\data_out~74_combout\))) # (!\Add1~0_combout\ & (\data_out~76_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \Add1~0_combout\,
	datac => \data_out~76_combout\,
	datad => \data_out~74_combout\,
	combout => \data_out~77_combout\);

-- Location: LCCOMB_X66_Y72_N12
\data_out~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~80_combout\ = (pointer(0) & ((\data_out~77_combout\ & (\data_out~79_combout\)) # (!\data_out~77_combout\ & ((\data_out~72_combout\))))) # (!pointer(0) & (((\data_out~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \data_out~79_combout\,
	datac => \data_out~72_combout\,
	datad => \data_out~77_combout\,
	combout => \data_out~80_combout\);

-- Location: FF_X66_Y72_N13
\data_out[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_out~80_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \data_out[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out[7]~reg0_q\);

-- Location: LCCOMB_X69_Y70_N28
\full~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~0_combout\ = (pointer(3) & (!pointer(0) & (pointer(2) & pointer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(3),
	datab => pointer(0),
	datac => pointer(2),
	datad => pointer(1),
	combout => \full~0_combout\);

-- Location: LCCOMB_X69_Y70_N4
\full~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~1_combout\ = (\process_0~0_combout\ & ((\full~0_combout\) # (\full~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \full~0_combout\,
	datac => \full~reg0_q\,
	datad => \process_0~0_combout\,
	combout => \full~1_combout\);

-- Location: LCCOMB_X69_Y70_N6
\empty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~0_combout\ = (\process_0~0_combout\) # (!\process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \process_0~2_combout\,
	datad => \process_0~0_combout\,
	combout => \empty~0_combout\);

-- Location: FF_X69_Y70_N5
\full~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \full~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \empty~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \full~reg0_q\);

-- Location: LCCOMB_X69_Y70_N2
\empty~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~1_combout\ = (\process_0~0_combout\) # ((\empty~reg0_q\ & ((!\Decoder0~5_combout\) # (!pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \Decoder0~5_combout\,
	datac => \empty~reg0_q\,
	datad => \process_0~0_combout\,
	combout => \empty~1_combout\);

-- Location: FF_X69_Y70_N3
\empty~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \empty~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \empty~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \empty~reg0_q\);

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_data_out(4) <= \data_out[4]~output_o\;

ww_data_out(5) <= \data_out[5]~output_o\;

ww_data_out(6) <= \data_out[6]~output_o\;

ww_data_out(7) <= \data_out[7]~output_o\;

ww_full <= \full~output_o\;

ww_empty <= \empty~output_o\;
END structure;


