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

-- DATE "05/20/2025 12:34:01"

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

ENTITY 	RegisterFile_Top IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(17 DOWNTO 0);
	KEY : IN std_logic_vector(3 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(17 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(8 DOWNTO 0)
	);
END RegisterFile_Top;

-- Design Ports Information
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_U25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[8]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RegisterFile_Top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(8 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[17]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \LEDG[8]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \RF|regs~158_combout\ : std_logic;
SIGNAL \RF|regs~44_q\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \RF|regs~157_combout\ : std_logic;
SIGNAL \RF|regs~60_q\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \RF|regs~76_combout\ : std_logic;
SIGNAL \RF|regs~159_combout\ : std_logic;
SIGNAL \RF|regs~68_q\ : std_logic;
SIGNAL \RF|regs~156_combout\ : std_logic;
SIGNAL \RF|regs~52_q\ : std_logic;
SIGNAL \RF|regs~77_combout\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \RF|regs~161_combout\ : std_logic;
SIGNAL \RF|regs~20_q\ : std_logic;
SIGNAL \RF|regs~162_combout\ : std_logic;
SIGNAL \RF|regs~12_q\ : std_logic;
SIGNAL \RF|regs~78_combout\ : std_logic;
SIGNAL \RF|regs~163_combout\ : std_logic;
SIGNAL \RF|regs~36_q\ : std_logic;
SIGNAL \RF|regs~160_combout\ : std_logic;
SIGNAL \RF|regs~28_q\ : std_logic;
SIGNAL \RF|regs~79_combout\ : std_logic;
SIGNAL \RF|regs~80_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \RF|regs~37_q\ : std_logic;
SIGNAL \RF|regs~21_q\ : std_logic;
SIGNAL \RF|regs~13_q\ : std_logic;
SIGNAL \RF|regs~83_combout\ : std_logic;
SIGNAL \RF|regs~29_q\ : std_logic;
SIGNAL \RF|regs~84_combout\ : std_logic;
SIGNAL \RF|regs~69_q\ : std_logic;
SIGNAL \RF|regs~45_q\ : std_logic;
SIGNAL \RF|regs~61_q\ : std_logic;
SIGNAL \RF|regs~81_combout\ : std_logic;
SIGNAL \RF|regs~53_q\ : std_logic;
SIGNAL \RF|regs~82_combout\ : std_logic;
SIGNAL \RF|regs~85_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \RF|regs~38_q\ : std_logic;
SIGNAL \RF|regs~22_q\ : std_logic;
SIGNAL \RF|regs~14_q\ : std_logic;
SIGNAL \RF|regs~88_combout\ : std_logic;
SIGNAL \RF|regs~30_q\ : std_logic;
SIGNAL \RF|regs~89_combout\ : std_logic;
SIGNAL \RF|regs~46_q\ : std_logic;
SIGNAL \RF|regs~62_q\ : std_logic;
SIGNAL \RF|regs~86_combout\ : std_logic;
SIGNAL \RF|regs~70_q\ : std_logic;
SIGNAL \RF|regs~54_q\ : std_logic;
SIGNAL \RF|regs~87_combout\ : std_logic;
SIGNAL \RF|regs~90_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \RF|regs~39_q\ : std_logic;
SIGNAL \RF|regs~23_q\ : std_logic;
SIGNAL \RF|regs~15_q\ : std_logic;
SIGNAL \RF|regs~93_combout\ : std_logic;
SIGNAL \RF|regs~31_q\ : std_logic;
SIGNAL \RF|regs~94_combout\ : std_logic;
SIGNAL \RF|regs~71_q\ : std_logic;
SIGNAL \RF|regs~47_q\ : std_logic;
SIGNAL \RF|regs~63_q\ : std_logic;
SIGNAL \RF|regs~91_combout\ : std_logic;
SIGNAL \RF|regs~55_q\ : std_logic;
SIGNAL \RF|regs~92_combout\ : std_logic;
SIGNAL \RF|regs~95_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \RF|regs~72_q\ : std_logic;
SIGNAL \RF|regs~56_q\ : std_logic;
SIGNAL \RF|regs~48_q\ : std_logic;
SIGNAL \RF|regs~64_q\ : std_logic;
SIGNAL \RF|regs~96_combout\ : std_logic;
SIGNAL \RF|regs~97_combout\ : std_logic;
SIGNAL \RF|regs~16_q\ : std_logic;
SIGNAL \RF|regs~24_q\ : std_logic;
SIGNAL \RF|regs~98_combout\ : std_logic;
SIGNAL \RF|regs~40_q\ : std_logic;
SIGNAL \RF|regs~32_q\ : std_logic;
SIGNAL \RF|regs~99_combout\ : std_logic;
SIGNAL \RF|regs~100_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \RF|regs~25_q\ : std_logic;
SIGNAL \RF|regs~17_q\ : std_logic;
SIGNAL \RF|regs~103_combout\ : std_logic;
SIGNAL \RF|regs~41_q\ : std_logic;
SIGNAL \RF|regs~33_q\ : std_logic;
SIGNAL \RF|regs~104_combout\ : std_logic;
SIGNAL \RF|regs~73_q\ : std_logic;
SIGNAL \RF|regs~49_q\ : std_logic;
SIGNAL \RF|regs~65_q\ : std_logic;
SIGNAL \RF|regs~101_combout\ : std_logic;
SIGNAL \RF|regs~57_q\ : std_logic;
SIGNAL \RF|regs~102_combout\ : std_logic;
SIGNAL \RF|regs~105_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \RF|regs~26_q\ : std_logic;
SIGNAL \RF|regs~18_q\ : std_logic;
SIGNAL \RF|regs~108_combout\ : std_logic;
SIGNAL \RF|regs~42_q\ : std_logic;
SIGNAL \RF|regs~34_q\ : std_logic;
SIGNAL \RF|regs~109_combout\ : std_logic;
SIGNAL \RF|regs~74_q\ : std_logic;
SIGNAL \RF|regs~50_q\ : std_logic;
SIGNAL \RF|regs~66_q\ : std_logic;
SIGNAL \RF|regs~106_combout\ : std_logic;
SIGNAL \RF|regs~58_q\ : std_logic;
SIGNAL \RF|regs~107_combout\ : std_logic;
SIGNAL \RF|regs~110_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \RF|regs~27_q\ : std_logic;
SIGNAL \RF|regs~19_q\ : std_logic;
SIGNAL \RF|regs~113_combout\ : std_logic;
SIGNAL \RF|regs~43_q\ : std_logic;
SIGNAL \RF|regs~35_q\ : std_logic;
SIGNAL \RF|regs~114_combout\ : std_logic;
SIGNAL \RF|regs~51_q\ : std_logic;
SIGNAL \RF|regs~67_q\ : std_logic;
SIGNAL \RF|regs~111_combout\ : std_logic;
SIGNAL \RF|regs~75_q\ : std_logic;
SIGNAL \RF|regs~59_q\ : std_logic;
SIGNAL \RF|regs~112_combout\ : std_logic;
SIGNAL \RF|regs~115_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \RF|regs~116_combout\ : std_logic;
SIGNAL \RF|regs~117_combout\ : std_logic;
SIGNAL \RF|regs~118_combout\ : std_logic;
SIGNAL \RF|regs~119_combout\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \RF|regs~120_combout\ : std_logic;
SIGNAL \RF|regs~123_combout\ : std_logic;
SIGNAL \RF|regs~124_combout\ : std_logic;
SIGNAL \RF|regs~121_combout\ : std_logic;
SIGNAL \RF|regs~122_combout\ : std_logic;
SIGNAL \RF|regs~125_combout\ : std_logic;
SIGNAL \RF|regs~126_combout\ : std_logic;
SIGNAL \RF|regs~127_combout\ : std_logic;
SIGNAL \RF|regs~128_combout\ : std_logic;
SIGNAL \RF|regs~129_combout\ : std_logic;
SIGNAL \RF|regs~130_combout\ : std_logic;
SIGNAL \RF|regs~133_combout\ : std_logic;
SIGNAL \RF|regs~134_combout\ : std_logic;
SIGNAL \RF|regs~131_combout\ : std_logic;
SIGNAL \RF|regs~132_combout\ : std_logic;
SIGNAL \RF|regs~135_combout\ : std_logic;
SIGNAL \RF|regs~138_combout\ : std_logic;
SIGNAL \RF|regs~139_combout\ : std_logic;
SIGNAL \RF|regs~136_combout\ : std_logic;
SIGNAL \RF|regs~137_combout\ : std_logic;
SIGNAL \RF|regs~140_combout\ : std_logic;
SIGNAL \RF|regs~141_combout\ : std_logic;
SIGNAL \RF|regs~142_combout\ : std_logic;
SIGNAL \RF|regs~143_combout\ : std_logic;
SIGNAL \RF|regs~144_combout\ : std_logic;
SIGNAL \RF|regs~145_combout\ : std_logic;
SIGNAL \RF|regs~146_combout\ : std_logic;
SIGNAL \RF|regs~147_combout\ : std_logic;
SIGNAL \RF|regs~148_combout\ : std_logic;
SIGNAL \RF|regs~149_combout\ : std_logic;
SIGNAL \RF|regs~150_combout\ : std_logic;
SIGNAL \RF|regs~153_combout\ : std_logic;
SIGNAL \RF|regs~154_combout\ : std_logic;
SIGNAL \RF|regs~151_combout\ : std_logic;
SIGNAL \RF|regs~152_combout\ : std_logic;
SIGNAL \RF|regs~155_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
ww_KEY <= KEY;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~80_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~85_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~90_combout\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~95_combout\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~100_combout\,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~105_combout\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~110_combout\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~115_combout\,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[17]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~120_combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~125_combout\,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~130_combout\,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~135_combout\,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\LEDG[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~140_combout\,
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\LEDG[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~145_combout\,
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\LEDG[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~150_combout\,
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\LEDG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF|regs~155_combout\,
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\LEDG[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[8]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: IOIBUF_X115_Y13_N1
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X115_Y14_N8
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

-- Location: LCCOMB_X113_Y16_N16
\RF|regs~158\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~158_combout\ = (!\SW[15]~input_o\ & (!\SW[16]~input_o\ & (!\KEY[0]~input_o\ & \SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[17]~input_o\,
	combout => \RF|regs~158_combout\);

-- Location: FF_X113_Y15_N11
\RF|regs~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~44_q\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: LCCOMB_X114_Y16_N20
\RF|regs~157\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~157_combout\ = (!\SW[15]~input_o\ & (\SW[17]~input_o\ & (!\KEY[0]~input_o\ & \SW[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[17]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[16]~input_o\,
	combout => \RF|regs~157_combout\);

-- Location: FF_X113_Y15_N9
\RF|regs~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~60_q\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: LCCOMB_X113_Y15_N8
\RF|regs~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~76_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~60_q\))) # (!\SW[13]~input_o\ & (\RF|regs~44_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~44_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~60_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~76_combout\);

-- Location: LCCOMB_X114_Y16_N30
\RF|regs~159\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~159_combout\ = (\SW[15]~input_o\ & (\SW[17]~input_o\ & (!\KEY[0]~input_o\ & \SW[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[17]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[16]~input_o\,
	combout => \RF|regs~159_combout\);

-- Location: FF_X114_Y15_N19
\RF|regs~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~68_q\);

-- Location: LCCOMB_X114_Y16_N18
\RF|regs~156\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~156_combout\ = (\SW[15]~input_o\ & (\SW[17]~input_o\ & (!\KEY[0]~input_o\ & !\SW[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[17]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[16]~input_o\,
	combout => \RF|regs~156_combout\);

-- Location: FF_X114_Y15_N1
\RF|regs~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~52_q\);

-- Location: LCCOMB_X114_Y15_N0
\RF|regs~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~77_combout\ = (\RF|regs~76_combout\ & ((\RF|regs~68_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~76_combout\ & (((\RF|regs~52_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~76_combout\,
	datab => \RF|regs~68_q\,
	datac => \RF|regs~52_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~77_combout\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: LCCOMB_X113_Y16_N20
\RF|regs~161\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~161_combout\ = (\SW[15]~input_o\ & (!\SW[16]~input_o\ & (!\KEY[0]~input_o\ & !\SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[17]~input_o\,
	combout => \RF|regs~161_combout\);

-- Location: FF_X113_Y14_N1
\RF|regs~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~20_q\);

-- Location: LCCOMB_X113_Y16_N30
\RF|regs~162\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~162_combout\ = (!\SW[15]~input_o\ & (!\SW[16]~input_o\ & (!\KEY[0]~input_o\ & !\SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[17]~input_o\,
	combout => \RF|regs~162_combout\);

-- Location: FF_X113_Y14_N19
\RF|regs~12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~12_q\);

-- Location: LCCOMB_X113_Y14_N0
\RF|regs~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~78_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~20_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~12_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~20_q\,
	datad => \RF|regs~12_q\,
	combout => \RF|regs~78_combout\);

-- Location: LCCOMB_X113_Y16_N24
\RF|regs~163\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~163_combout\ = (\SW[15]~input_o\ & (\SW[16]~input_o\ & (!\KEY[0]~input_o\ & !\SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[17]~input_o\,
	combout => \RF|regs~163_combout\);

-- Location: FF_X114_Y14_N3
\RF|regs~36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~36_q\);

-- Location: LCCOMB_X113_Y16_N26
\RF|regs~160\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~160_combout\ = (!\SW[15]~input_o\ & (\SW[16]~input_o\ & (!\KEY[0]~input_o\ & !\SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \KEY[0]~input_o\,
	datad => \SW[17]~input_o\,
	combout => \RF|regs~160_combout\);

-- Location: FF_X114_Y14_N1
\RF|regs~28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~28_q\);

-- Location: LCCOMB_X114_Y14_N0
\RF|regs~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~79_combout\ = (\RF|regs~78_combout\ & ((\RF|regs~36_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~78_combout\ & (((\RF|regs~28_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~78_combout\,
	datab => \RF|regs~36_q\,
	datac => \RF|regs~28_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~79_combout\);

-- Location: LCCOMB_X114_Y15_N12
\RF|regs~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~80_combout\ = (\SW[14]~input_o\ & (\RF|regs~77_combout\)) # (!\SW[14]~input_o\ & ((\RF|regs~79_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~77_combout\,
	datac => \SW[14]~input_o\,
	datad => \RF|regs~79_combout\,
	combout => \RF|regs~80_combout\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X114_Y14_N7
\RF|regs~37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~37_q\);

-- Location: FF_X113_Y14_N21
\RF|regs~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~21_q\);

-- Location: FF_X113_Y14_N23
\RF|regs~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~13_q\);

-- Location: LCCOMB_X113_Y14_N20
\RF|regs~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~83_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~21_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~13_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~21_q\,
	datad => \RF|regs~13_q\,
	combout => \RF|regs~83_combout\);

-- Location: FF_X114_Y14_N13
\RF|regs~29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~29_q\);

-- Location: LCCOMB_X114_Y14_N12
\RF|regs~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~84_combout\ = (\RF|regs~83_combout\ & ((\RF|regs~37_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~83_combout\ & (((\RF|regs~29_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~37_q\,
	datab => \RF|regs~83_combout\,
	datac => \RF|regs~29_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~84_combout\);

-- Location: FF_X114_Y15_N9
\RF|regs~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~69_q\);

-- Location: FF_X113_Y15_N7
\RF|regs~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~45_q\);

-- Location: FF_X113_Y15_N21
\RF|regs~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~61_q\);

-- Location: LCCOMB_X113_Y15_N20
\RF|regs~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~81_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~61_q\))) # (!\SW[13]~input_o\ & (\RF|regs~45_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~45_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~61_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~81_combout\);

-- Location: FF_X114_Y15_N31
\RF|regs~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~53_q\);

-- Location: LCCOMB_X114_Y15_N30
\RF|regs~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~82_combout\ = (\RF|regs~81_combout\ & ((\RF|regs~69_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~81_combout\ & (((\RF|regs~53_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~69_q\,
	datab => \RF|regs~81_combout\,
	datac => \RF|regs~53_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~82_combout\);

-- Location: LCCOMB_X114_Y15_N26
\RF|regs~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~85_combout\ = (\SW[14]~input_o\ & ((\RF|regs~82_combout\))) # (!\SW[14]~input_o\ & (\RF|regs~84_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~84_combout\,
	datac => \SW[14]~input_o\,
	datad => \RF|regs~82_combout\,
	combout => \RF|regs~85_combout\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X114_Y14_N11
\RF|regs~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~38_q\);

-- Location: FF_X113_Y14_N17
\RF|regs~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~22_q\);

-- Location: FF_X113_Y14_N11
\RF|regs~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~14_q\);

-- Location: LCCOMB_X113_Y14_N16
\RF|regs~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~88_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~22_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~14_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~22_q\,
	datad => \RF|regs~14_q\,
	combout => \RF|regs~88_combout\);

-- Location: FF_X114_Y14_N25
\RF|regs~30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~30_q\);

-- Location: LCCOMB_X114_Y14_N24
\RF|regs~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~89_combout\ = (\RF|regs~88_combout\ & ((\RF|regs~38_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~88_combout\ & (((\RF|regs~30_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~38_q\,
	datab => \RF|regs~88_combout\,
	datac => \RF|regs~30_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~89_combout\);

-- Location: FF_X113_Y15_N27
\RF|regs~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~46_q\);

-- Location: FF_X113_Y15_N17
\RF|regs~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~62_q\);

-- Location: LCCOMB_X113_Y15_N16
\RF|regs~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~86_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~62_q\))) # (!\SW[13]~input_o\ & (\RF|regs~46_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~46_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~62_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~86_combout\);

-- Location: FF_X114_Y15_N15
\RF|regs~70\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~70_q\);

-- Location: FF_X114_Y15_N5
\RF|regs~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~54_q\);

-- Location: LCCOMB_X114_Y15_N4
\RF|regs~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~87_combout\ = (\RF|regs~86_combout\ & ((\RF|regs~70_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~86_combout\ & (((\RF|regs~54_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~86_combout\,
	datab => \RF|regs~70_q\,
	datac => \RF|regs~54_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~87_combout\);

-- Location: LCCOMB_X114_Y15_N16
\RF|regs~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~90_combout\ = (\SW[14]~input_o\ & ((\RF|regs~87_combout\))) # (!\SW[14]~input_o\ & (\RF|regs~89_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~89_combout\,
	datab => \SW[14]~input_o\,
	datad => \RF|regs~87_combout\,
	combout => \RF|regs~90_combout\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: FF_X114_Y14_N31
\RF|regs~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~39_q\);

-- Location: FF_X113_Y14_N5
\RF|regs~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~23_q\);

-- Location: FF_X113_Y14_N15
\RF|regs~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~15_q\);

-- Location: LCCOMB_X113_Y14_N4
\RF|regs~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~93_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~23_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~15_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~23_q\,
	datad => \RF|regs~15_q\,
	combout => \RF|regs~93_combout\);

-- Location: FF_X114_Y14_N29
\RF|regs~31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~31_q\);

-- Location: LCCOMB_X114_Y14_N28
\RF|regs~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~94_combout\ = (\RF|regs~93_combout\ & ((\RF|regs~39_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~93_combout\ & (((\RF|regs~31_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~39_q\,
	datab => \RF|regs~93_combout\,
	datac => \RF|regs~31_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~94_combout\);

-- Location: FF_X114_Y15_N21
\RF|regs~71\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~71_q\);

-- Location: FF_X113_Y15_N15
\RF|regs~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~47_q\);

-- Location: FF_X113_Y15_N29
\RF|regs~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~63_q\);

-- Location: LCCOMB_X113_Y15_N28
\RF|regs~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~91_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~63_q\))) # (!\SW[13]~input_o\ & (\RF|regs~47_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~47_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~63_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~91_combout\);

-- Location: FF_X114_Y15_N11
\RF|regs~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~55_q\);

-- Location: LCCOMB_X114_Y15_N10
\RF|regs~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~92_combout\ = (\RF|regs~91_combout\ & ((\RF|regs~71_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~91_combout\ & (((\RF|regs~55_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~71_q\,
	datab => \RF|regs~91_combout\,
	datac => \RF|regs~55_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~92_combout\);

-- Location: LCCOMB_X114_Y14_N8
\RF|regs~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~95_combout\ = (\SW[14]~input_o\ & ((\RF|regs~92_combout\))) # (!\SW[14]~input_o\ & (\RF|regs~94_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~94_combout\,
	datac => \RF|regs~92_combout\,
	datad => \SW[14]~input_o\,
	combout => \RF|regs~95_combout\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: FF_X114_Y16_N11
\RF|regs~72\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~72_q\);

-- Location: FF_X114_Y16_N9
\RF|regs~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~56_q\);

-- Location: FF_X113_Y15_N19
\RF|regs~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~48_q\);

-- Location: FF_X113_Y15_N25
\RF|regs~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~64_q\);

-- Location: LCCOMB_X113_Y15_N24
\RF|regs~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~96_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~64_q\))) # (!\SW[13]~input_o\ & (\RF|regs~48_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~48_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~64_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~96_combout\);

-- Location: LCCOMB_X114_Y16_N8
\RF|regs~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~97_combout\ = (\SW[12]~input_o\ & ((\RF|regs~96_combout\ & (\RF|regs~72_q\)) # (!\RF|regs~96_combout\ & ((\RF|regs~56_q\))))) # (!\SW[12]~input_o\ & (((\RF|regs~96_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~72_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~56_q\,
	datad => \RF|regs~96_combout\,
	combout => \RF|regs~97_combout\);

-- Location: FF_X113_Y14_N27
\RF|regs~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~16_q\);

-- Location: FF_X113_Y14_N9
\RF|regs~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~24_q\);

-- Location: LCCOMB_X113_Y14_N8
\RF|regs~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~98_combout\ = (\SW[13]~input_o\ & (((\SW[12]~input_o\)))) # (!\SW[13]~input_o\ & ((\SW[12]~input_o\ & ((\RF|regs~24_q\))) # (!\SW[12]~input_o\ & (\RF|regs~16_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~16_q\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~24_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~98_combout\);

-- Location: FF_X114_Y14_N21
\RF|regs~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~40_q\);

-- Location: FF_X114_Y14_N27
\RF|regs~32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~32_q\);

-- Location: LCCOMB_X114_Y14_N26
\RF|regs~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~99_combout\ = (\RF|regs~98_combout\ & ((\RF|regs~40_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~98_combout\ & (((\RF|regs~32_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~98_combout\,
	datab => \RF|regs~40_q\,
	datac => \RF|regs~32_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~99_combout\);

-- Location: LCCOMB_X114_Y14_N14
\RF|regs~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~100_combout\ = (\SW[14]~input_o\ & (\RF|regs~97_combout\)) # (!\SW[14]~input_o\ & ((\RF|regs~99_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~97_combout\,
	datac => \RF|regs~99_combout\,
	datad => \SW[14]~input_o\,
	combout => \RF|regs~100_combout\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: FF_X113_Y14_N13
\RF|regs~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~25_q\);

-- Location: FF_X113_Y14_N31
\RF|regs~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~17_q\);

-- Location: LCCOMB_X113_Y14_N12
\RF|regs~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~103_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~25_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~17_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~25_q\,
	datad => \RF|regs~17_q\,
	combout => \RF|regs~103_combout\);

-- Location: FF_X114_Y14_N19
\RF|regs~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~41_q\);

-- Location: FF_X114_Y14_N17
\RF|regs~33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~33_q\);

-- Location: LCCOMB_X114_Y14_N16
\RF|regs~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~104_combout\ = (\RF|regs~103_combout\ & ((\RF|regs~41_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~103_combout\ & (((\RF|regs~33_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~103_combout\,
	datab => \RF|regs~41_q\,
	datac => \RF|regs~33_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~104_combout\);

-- Location: FF_X114_Y16_N15
\RF|regs~73\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~73_q\);

-- Location: FF_X113_Y15_N23
\RF|regs~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~49_q\);

-- Location: FF_X113_Y15_N5
\RF|regs~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~65_q\);

-- Location: LCCOMB_X113_Y15_N4
\RF|regs~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~101_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~65_q\))) # (!\SW[13]~input_o\ & (\RF|regs~49_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~49_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~65_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~101_combout\);

-- Location: FF_X114_Y16_N29
\RF|regs~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~57_q\);

-- Location: LCCOMB_X114_Y16_N28
\RF|regs~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~102_combout\ = (\RF|regs~101_combout\ & ((\RF|regs~73_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~101_combout\ & (((\RF|regs~57_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~73_q\,
	datab => \RF|regs~101_combout\,
	datac => \RF|regs~57_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~102_combout\);

-- Location: LCCOMB_X114_Y14_N4
\RF|regs~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~105_combout\ = (\SW[14]~input_o\ & ((\RF|regs~102_combout\))) # (!\SW[14]~input_o\ & (\RF|regs~104_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[14]~input_o\,
	datac => \RF|regs~104_combout\,
	datad => \RF|regs~102_combout\,
	combout => \RF|regs~105_combout\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: FF_X113_Y14_N25
\RF|regs~26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~26_q\);

-- Location: FF_X113_Y14_N3
\RF|regs~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~18_q\);

-- Location: LCCOMB_X113_Y14_N24
\RF|regs~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~108_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~26_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~18_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~26_q\,
	datad => \RF|regs~18_q\,
	combout => \RF|regs~108_combout\);

-- Location: FF_X113_Y16_N19
\RF|regs~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~42_q\);

-- Location: FF_X113_Y16_N9
\RF|regs~34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~34_q\);

-- Location: LCCOMB_X113_Y16_N8
\RF|regs~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~109_combout\ = (\RF|regs~108_combout\ & ((\RF|regs~42_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~108_combout\ & (((\RF|regs~34_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~108_combout\,
	datab => \RF|regs~42_q\,
	datac => \RF|regs~34_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~109_combout\);

-- Location: FF_X114_Y16_N27
\RF|regs~74\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~74_q\);

-- Location: FF_X113_Y15_N3
\RF|regs~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~50_q\);

-- Location: FF_X113_Y15_N1
\RF|regs~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~66_q\);

-- Location: LCCOMB_X113_Y15_N0
\RF|regs~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~106_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~66_q\))) # (!\SW[13]~input_o\ & (\RF|regs~50_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~50_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~66_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~106_combout\);

-- Location: FF_X114_Y16_N25
\RF|regs~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~58_q\);

-- Location: LCCOMB_X114_Y16_N24
\RF|regs~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~107_combout\ = (\RF|regs~106_combout\ & ((\RF|regs~74_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~106_combout\ & (((\RF|regs~58_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~74_q\,
	datab => \RF|regs~106_combout\,
	datac => \RF|regs~58_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~107_combout\);

-- Location: LCCOMB_X114_Y16_N4
\RF|regs~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~110_combout\ = (\SW[14]~input_o\ & ((\RF|regs~107_combout\))) # (!\SW[14]~input_o\ & (\RF|regs~109_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~109_combout\,
	datab => \RF|regs~107_combout\,
	datad => \SW[14]~input_o\,
	combout => \RF|regs~110_combout\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: FF_X113_Y14_N29
\RF|regs~27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~161_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~27_q\);

-- Location: FF_X113_Y14_N7
\RF|regs~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~162_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~19_q\);

-- Location: LCCOMB_X113_Y14_N28
\RF|regs~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~113_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((\RF|regs~27_q\)))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & ((\RF|regs~19_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \RF|regs~27_q\,
	datad => \RF|regs~19_q\,
	combout => \RF|regs~113_combout\);

-- Location: FF_X113_Y16_N15
\RF|regs~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~163_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~43_q\);

-- Location: FF_X113_Y16_N13
\RF|regs~35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~160_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~35_q\);

-- Location: LCCOMB_X113_Y16_N12
\RF|regs~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~114_combout\ = (\RF|regs~113_combout\ & ((\RF|regs~43_q\) # ((!\SW[13]~input_o\)))) # (!\RF|regs~113_combout\ & (((\RF|regs~35_q\ & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~113_combout\,
	datab => \RF|regs~43_q\,
	datac => \RF|regs~35_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~114_combout\);

-- Location: FF_X113_Y15_N31
\RF|regs~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~158_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~51_q\);

-- Location: FF_X113_Y15_N13
\RF|regs~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~157_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~67_q\);

-- Location: LCCOMB_X113_Y15_N12
\RF|regs~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~111_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((\RF|regs~67_q\))) # (!\SW[13]~input_o\ & (\RF|regs~51_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~51_q\,
	datab => \SW[12]~input_o\,
	datac => \RF|regs~67_q\,
	datad => \SW[13]~input_o\,
	combout => \RF|regs~111_combout\);

-- Location: FF_X114_Y16_N17
\RF|regs~75\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~159_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~75_q\);

-- Location: FF_X114_Y16_N23
\RF|regs~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \RF|regs~156_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|regs~59_q\);

-- Location: LCCOMB_X114_Y16_N22
\RF|regs~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~112_combout\ = (\RF|regs~111_combout\ & ((\RF|regs~75_q\) # ((!\SW[12]~input_o\)))) # (!\RF|regs~111_combout\ & (((\RF|regs~59_q\ & \SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~111_combout\,
	datab => \RF|regs~75_q\,
	datac => \RF|regs~59_q\,
	datad => \SW[12]~input_o\,
	combout => \RF|regs~112_combout\);

-- Location: LCCOMB_X114_Y16_N2
\RF|regs~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~115_combout\ = (\SW[14]~input_o\ & ((\RF|regs~112_combout\))) # (!\SW[14]~input_o\ & (\RF|regs~114_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~114_combout\,
	datac => \RF|regs~112_combout\,
	datad => \SW[14]~input_o\,
	combout => \RF|regs~115_combout\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: LCCOMB_X113_Y15_N10
\RF|regs~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~116_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~60_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~44_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~60_q\,
	datac => \RF|regs~44_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~116_combout\);

-- Location: LCCOMB_X114_Y15_N18
\RF|regs~117\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~117_combout\ = (\RF|regs~116_combout\ & (((\RF|regs~68_q\) # (!\SW[9]~input_o\)))) # (!\RF|regs~116_combout\ & (\RF|regs~52_q\ & ((\SW[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~116_combout\,
	datab => \RF|regs~52_q\,
	datac => \RF|regs~68_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~117_combout\);

-- Location: LCCOMB_X113_Y14_N18
\RF|regs~118\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~118_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~20_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~12_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~20_q\,
	datac => \RF|regs~12_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~118_combout\);

-- Location: LCCOMB_X114_Y14_N2
\RF|regs~119\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~119_combout\ = (\RF|regs~118_combout\ & (((\RF|regs~36_q\)) # (!\SW[10]~input_o\))) # (!\RF|regs~118_combout\ & (\SW[10]~input_o\ & ((\RF|regs~28_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~118_combout\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~36_q\,
	datad => \RF|regs~28_q\,
	combout => \RF|regs~119_combout\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: LCCOMB_X114_Y15_N22
\RF|regs~120\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~120_combout\ = (\SW[11]~input_o\ & (\RF|regs~117_combout\)) # (!\SW[11]~input_o\ & ((\RF|regs~119_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~117_combout\,
	datac => \RF|regs~119_combout\,
	datad => \SW[11]~input_o\,
	combout => \RF|regs~120_combout\);

-- Location: LCCOMB_X113_Y14_N22
\RF|regs~123\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~123_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~21_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~13_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~21_q\,
	datac => \RF|regs~13_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~123_combout\);

-- Location: LCCOMB_X114_Y14_N6
\RF|regs~124\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~124_combout\ = (\SW[10]~input_o\ & ((\RF|regs~123_combout\ & ((\RF|regs~37_q\))) # (!\RF|regs~123_combout\ & (\RF|regs~29_q\)))) # (!\SW[10]~input_o\ & (((\RF|regs~123_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~29_q\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~37_q\,
	datad => \RF|regs~123_combout\,
	combout => \RF|regs~124_combout\);

-- Location: LCCOMB_X113_Y15_N6
\RF|regs~121\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~121_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~61_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~45_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~61_q\,
	datac => \RF|regs~45_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~121_combout\);

-- Location: LCCOMB_X114_Y15_N8
\RF|regs~122\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~122_combout\ = (\RF|regs~121_combout\ & (((\RF|regs~69_q\) # (!\SW[9]~input_o\)))) # (!\RF|regs~121_combout\ & (\RF|regs~53_q\ & ((\SW[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~53_q\,
	datab => \RF|regs~121_combout\,
	datac => \RF|regs~69_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~122_combout\);

-- Location: LCCOMB_X114_Y15_N24
\RF|regs~125\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~125_combout\ = (\SW[11]~input_o\ & ((\RF|regs~122_combout\))) # (!\SW[11]~input_o\ & (\RF|regs~124_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~124_combout\,
	datac => \RF|regs~122_combout\,
	datad => \SW[11]~input_o\,
	combout => \RF|regs~125_combout\);

-- Location: LCCOMB_X113_Y15_N26
\RF|regs~126\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~126_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~62_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~46_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~62_q\,
	datac => \RF|regs~46_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~126_combout\);

-- Location: LCCOMB_X114_Y15_N14
\RF|regs~127\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~127_combout\ = (\RF|regs~126_combout\ & (((\RF|regs~70_q\) # (!\SW[9]~input_o\)))) # (!\RF|regs~126_combout\ & (\RF|regs~54_q\ & ((\SW[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~126_combout\,
	datab => \RF|regs~54_q\,
	datac => \RF|regs~70_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~127_combout\);

-- Location: LCCOMB_X113_Y14_N10
\RF|regs~128\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~128_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~22_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~14_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~22_q\,
	datac => \RF|regs~14_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~128_combout\);

-- Location: LCCOMB_X114_Y14_N10
\RF|regs~129\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~129_combout\ = (\RF|regs~128_combout\ & (((\RF|regs~38_q\)) # (!\SW[10]~input_o\))) # (!\RF|regs~128_combout\ & (\SW[10]~input_o\ & ((\RF|regs~30_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~128_combout\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~38_q\,
	datad => \RF|regs~30_q\,
	combout => \RF|regs~129_combout\);

-- Location: LCCOMB_X114_Y15_N2
\RF|regs~130\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~130_combout\ = (\SW[11]~input_o\ & (\RF|regs~127_combout\)) # (!\SW[11]~input_o\ & ((\RF|regs~129_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~127_combout\,
	datac => \RF|regs~129_combout\,
	datad => \SW[11]~input_o\,
	combout => \RF|regs~130_combout\);

-- Location: LCCOMB_X113_Y14_N14
\RF|regs~133\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~133_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~23_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~15_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~23_q\,
	datac => \RF|regs~15_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~133_combout\);

-- Location: LCCOMB_X114_Y14_N30
\RF|regs~134\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~134_combout\ = (\RF|regs~133_combout\ & (((\RF|regs~39_q\)) # (!\SW[10]~input_o\))) # (!\RF|regs~133_combout\ & (\SW[10]~input_o\ & ((\RF|regs~31_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~133_combout\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~39_q\,
	datad => \RF|regs~31_q\,
	combout => \RF|regs~134_combout\);

-- Location: LCCOMB_X113_Y15_N14
\RF|regs~131\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~131_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~63_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~47_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~63_q\,
	datac => \RF|regs~47_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~131_combout\);

-- Location: LCCOMB_X114_Y15_N20
\RF|regs~132\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~132_combout\ = (\SW[9]~input_o\ & ((\RF|regs~131_combout\ & ((\RF|regs~71_q\))) # (!\RF|regs~131_combout\ & (\RF|regs~55_q\)))) # (!\SW[9]~input_o\ & (((\RF|regs~131_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~55_q\,
	datab => \SW[9]~input_o\,
	datac => \RF|regs~71_q\,
	datad => \RF|regs~131_combout\,
	combout => \RF|regs~132_combout\);

-- Location: LCCOMB_X114_Y15_N28
\RF|regs~135\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~135_combout\ = (\SW[11]~input_o\ & ((\RF|regs~132_combout\))) # (!\SW[11]~input_o\ & (\RF|regs~134_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~134_combout\,
	datab => \RF|regs~132_combout\,
	datad => \SW[11]~input_o\,
	combout => \RF|regs~135_combout\);

-- Location: LCCOMB_X113_Y14_N26
\RF|regs~138\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~138_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~24_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~16_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~24_q\,
	datac => \RF|regs~16_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~138_combout\);

-- Location: LCCOMB_X114_Y14_N20
\RF|regs~139\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~139_combout\ = (\RF|regs~138_combout\ & (((\RF|regs~40_q\)) # (!\SW[10]~input_o\))) # (!\RF|regs~138_combout\ & (\SW[10]~input_o\ & ((\RF|regs~32_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~138_combout\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~40_q\,
	datad => \RF|regs~32_q\,
	combout => \RF|regs~139_combout\);

-- Location: LCCOMB_X113_Y15_N18
\RF|regs~136\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~136_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~64_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~48_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~64_q\,
	datac => \RF|regs~48_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~136_combout\);

-- Location: LCCOMB_X114_Y16_N10
\RF|regs~137\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~137_combout\ = (\RF|regs~136_combout\ & (((\RF|regs~72_q\) # (!\SW[9]~input_o\)))) # (!\RF|regs~136_combout\ & (\RF|regs~56_q\ & ((\SW[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~136_combout\,
	datab => \RF|regs~56_q\,
	datac => \RF|regs~72_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~137_combout\);

-- Location: LCCOMB_X114_Y14_N22
\RF|regs~140\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~140_combout\ = (\SW[11]~input_o\ & ((\RF|regs~137_combout\))) # (!\SW[11]~input_o\ & (\RF|regs~139_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~139_combout\,
	datac => \SW[11]~input_o\,
	datad => \RF|regs~137_combout\,
	combout => \RF|regs~140_combout\);

-- Location: LCCOMB_X113_Y15_N22
\RF|regs~141\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~141_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~65_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~49_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~65_q\,
	datac => \RF|regs~49_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~141_combout\);

-- Location: LCCOMB_X114_Y16_N14
\RF|regs~142\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~142_combout\ = (\RF|regs~141_combout\ & (((\RF|regs~73_q\)) # (!\SW[9]~input_o\))) # (!\RF|regs~141_combout\ & (\SW[9]~input_o\ & ((\RF|regs~57_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~141_combout\,
	datab => \SW[9]~input_o\,
	datac => \RF|regs~73_q\,
	datad => \RF|regs~57_q\,
	combout => \RF|regs~142_combout\);

-- Location: LCCOMB_X113_Y14_N30
\RF|regs~143\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~143_combout\ = (\SW[9]~input_o\ & ((\RF|regs~25_q\) # ((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & (((\RF|regs~17_q\ & !\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~25_q\,
	datab => \SW[9]~input_o\,
	datac => \RF|regs~17_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~143_combout\);

-- Location: LCCOMB_X114_Y14_N18
\RF|regs~144\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~144_combout\ = (\RF|regs~143_combout\ & (((\RF|regs~41_q\)) # (!\SW[10]~input_o\))) # (!\RF|regs~143_combout\ & (\SW[10]~input_o\ & ((\RF|regs~33_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~143_combout\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~41_q\,
	datad => \RF|regs~33_q\,
	combout => \RF|regs~144_combout\);

-- Location: LCCOMB_X114_Y16_N12
\RF|regs~145\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~145_combout\ = (\SW[11]~input_o\ & (\RF|regs~142_combout\)) # (!\SW[11]~input_o\ & ((\RF|regs~144_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~142_combout\,
	datac => \SW[11]~input_o\,
	datad => \RF|regs~144_combout\,
	combout => \RF|regs~145_combout\);

-- Location: LCCOMB_X113_Y15_N2
\RF|regs~146\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~146_combout\ = (\SW[9]~input_o\ & (((\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & (\RF|regs~66_q\)) # (!\SW[10]~input_o\ & ((\RF|regs~50_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~66_q\,
	datac => \RF|regs~50_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~146_combout\);

-- Location: LCCOMB_X114_Y16_N26
\RF|regs~147\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~147_combout\ = (\SW[9]~input_o\ & ((\RF|regs~146_combout\ & ((\RF|regs~74_q\))) # (!\RF|regs~146_combout\ & (\RF|regs~58_q\)))) # (!\SW[9]~input_o\ & (((\RF|regs~146_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~58_q\,
	datab => \SW[9]~input_o\,
	datac => \RF|regs~74_q\,
	datad => \RF|regs~146_combout\,
	combout => \RF|regs~147_combout\);

-- Location: LCCOMB_X113_Y14_N2
\RF|regs~148\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~148_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~26_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~18_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~26_q\,
	datac => \RF|regs~18_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~148_combout\);

-- Location: LCCOMB_X113_Y16_N18
\RF|regs~149\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~149_combout\ = (\RF|regs~148_combout\ & (((\RF|regs~42_q\) # (!\SW[10]~input_o\)))) # (!\RF|regs~148_combout\ & (\RF|regs~34_q\ & ((\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~148_combout\,
	datab => \RF|regs~34_q\,
	datac => \RF|regs~42_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~149_combout\);

-- Location: LCCOMB_X114_Y16_N6
\RF|regs~150\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~150_combout\ = (\SW[11]~input_o\ & (\RF|regs~147_combout\)) # (!\SW[11]~input_o\ & ((\RF|regs~149_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~147_combout\,
	datac => \SW[11]~input_o\,
	datad => \RF|regs~149_combout\,
	combout => \RF|regs~150_combout\);

-- Location: LCCOMB_X113_Y14_N6
\RF|regs~153\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~153_combout\ = (\SW[10]~input_o\ & (((\SW[9]~input_o\)))) # (!\SW[10]~input_o\ & ((\SW[9]~input_o\ & (\RF|regs~27_q\)) # (!\SW[9]~input_o\ & ((\RF|regs~19_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[10]~input_o\,
	datab => \RF|regs~27_q\,
	datac => \RF|regs~19_q\,
	datad => \SW[9]~input_o\,
	combout => \RF|regs~153_combout\);

-- Location: LCCOMB_X113_Y16_N14
\RF|regs~154\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~154_combout\ = (\RF|regs~153_combout\ & (((\RF|regs~43_q\) # (!\SW[10]~input_o\)))) # (!\RF|regs~153_combout\ & (\RF|regs~35_q\ & ((\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RF|regs~35_q\,
	datab => \RF|regs~153_combout\,
	datac => \RF|regs~43_q\,
	datad => \SW[10]~input_o\,
	combout => \RF|regs~154_combout\);

-- Location: LCCOMB_X113_Y15_N30
\RF|regs~151\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~151_combout\ = (\SW[9]~input_o\ & (\SW[10]~input_o\)) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & ((\RF|regs~67_q\))) # (!\SW[10]~input_o\ & (\RF|regs~51_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[10]~input_o\,
	datac => \RF|regs~51_q\,
	datad => \RF|regs~67_q\,
	combout => \RF|regs~151_combout\);

-- Location: LCCOMB_X114_Y16_N16
\RF|regs~152\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~152_combout\ = (\SW[9]~input_o\ & ((\RF|regs~151_combout\ & ((\RF|regs~75_q\))) # (!\RF|regs~151_combout\ & (\RF|regs~59_q\)))) # (!\SW[9]~input_o\ & (((\RF|regs~151_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \RF|regs~59_q\,
	datac => \RF|regs~75_q\,
	datad => \RF|regs~151_combout\,
	combout => \RF|regs~152_combout\);

-- Location: LCCOMB_X114_Y16_N0
\RF|regs~155\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|regs~155_combout\ = (\SW[11]~input_o\ & ((\RF|regs~152_combout\))) # (!\SW[11]~input_o\ & (\RF|regs~154_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RF|regs~154_combout\,
	datac => \SW[11]~input_o\,
	datad => \RF|regs~152_combout\,
	combout => \RF|regs~155_combout\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X107_Y0_N8
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y27_N1
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X100_Y73_N15
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(17) <= \LEDR[17]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_LEDG(8) <= \LEDG[8]~output_o\;
END structure;


