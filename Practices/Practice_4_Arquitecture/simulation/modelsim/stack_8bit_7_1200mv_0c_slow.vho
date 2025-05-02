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

-- DATE "05/01/2025 21:02:44"

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
	data_out : BUFFER std_logic_vector(7 DOWNTO 0);
	full : BUFFER std_logic;
	empty : BUFFER std_logic
	);
END stack_8bit;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- full	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- empty	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- peek	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- push	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pop	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \push~input_o\ : std_logic;
SIGNAL \pop~input_o\ : std_logic;
SIGNAL \pointer[2]~4_combout\ : std_logic;
SIGNAL \pointer[2]~5_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \pointer[1]~2_combout\ : std_logic;
SIGNAL \pointer[1]~6_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \pointer~3_combout\ : std_logic;
SIGNAL \peek~input_o\ : std_logic;
SIGNAL \data_out~19_combout\ : std_logic;
SIGNAL \data_out~20_combout\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \Decoder0~6_combout\ : std_logic;
SIGNAL \stack[6][0]~q\ : std_logic;
SIGNAL \Decoder0~5_combout\ : std_logic;
SIGNAL \stack[5][0]~q\ : std_logic;
SIGNAL \Decoder0~4_combout\ : std_logic;
SIGNAL \stack[4][0]~q\ : std_logic;
SIGNAL \data_out~18_combout\ : std_logic;
SIGNAL \data_out~50_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \stack[1][0]~q\ : std_logic;
SIGNAL \Decoder0~3_combout\ : std_logic;
SIGNAL \stack[0][0]~q\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \stack[3][0]~q\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \stack[2][0]~q\ : std_logic;
SIGNAL \data_out~16_combout\ : std_logic;
SIGNAL \data_out~17_combout\ : std_logic;
SIGNAL \data_out~21_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \stack[3][1]~feeder_combout\ : std_logic;
SIGNAL \stack[3][1]~q\ : std_logic;
SIGNAL \stack[2][1]~q\ : std_logic;
SIGNAL \data_out~23_combout\ : std_logic;
SIGNAL \stack[0][1]~q\ : std_logic;
SIGNAL \stack[1][1]~feeder_combout\ : std_logic;
SIGNAL \stack[1][1]~q\ : std_logic;
SIGNAL \data_out~24_combout\ : std_logic;
SIGNAL \stack[5][1]~q\ : std_logic;
SIGNAL \stack[4][1]~feeder_combout\ : std_logic;
SIGNAL \stack[4][1]~q\ : std_logic;
SIGNAL \data_out~22_combout\ : std_logic;
SIGNAL \stack[6][1]~q\ : std_logic;
SIGNAL \data_out~51_combout\ : std_logic;
SIGNAL \data_out~25_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \stack[1][2]~feeder_combout\ : std_logic;
SIGNAL \stack[1][2]~q\ : std_logic;
SIGNAL \stack[0][2]~q\ : std_logic;
SIGNAL \stack[2][2]~q\ : std_logic;
SIGNAL \stack[3][2]~feeder_combout\ : std_logic;
SIGNAL \stack[3][2]~q\ : std_logic;
SIGNAL \data_out~27_combout\ : std_logic;
SIGNAL \data_out~28_combout\ : std_logic;
SIGNAL \stack[5][2]~q\ : std_logic;
SIGNAL \stack[4][2]~feeder_combout\ : std_logic;
SIGNAL \stack[4][2]~q\ : std_logic;
SIGNAL \data_out~26_combout\ : std_logic;
SIGNAL \stack[6][2]~feeder_combout\ : std_logic;
SIGNAL \stack[6][2]~q\ : std_logic;
SIGNAL \data_out~52_combout\ : std_logic;
SIGNAL \data_out~29_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \stack[1][3]~feeder_combout\ : std_logic;
SIGNAL \stack[1][3]~q\ : std_logic;
SIGNAL \stack[0][3]~q\ : std_logic;
SIGNAL \stack[2][3]~q\ : std_logic;
SIGNAL \stack[3][3]~q\ : std_logic;
SIGNAL \data_out~31_combout\ : std_logic;
SIGNAL \data_out~32_combout\ : std_logic;
SIGNAL \stack[6][3]~q\ : std_logic;
SIGNAL \stack[5][3]~q\ : std_logic;
SIGNAL \stack[4][3]~q\ : std_logic;
SIGNAL \data_out~30_combout\ : std_logic;
SIGNAL \data_out~53_combout\ : std_logic;
SIGNAL \data_out~33_combout\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \stack[6][4]~q\ : std_logic;
SIGNAL \stack[5][4]~q\ : std_logic;
SIGNAL \stack[4][4]~feeder_combout\ : std_logic;
SIGNAL \stack[4][4]~q\ : std_logic;
SIGNAL \data_out~34_combout\ : std_logic;
SIGNAL \data_out~54_combout\ : std_logic;
SIGNAL \stack[1][4]~q\ : std_logic;
SIGNAL \stack[0][4]~q\ : std_logic;
SIGNAL \stack[2][4]~q\ : std_logic;
SIGNAL \stack[3][4]~feeder_combout\ : std_logic;
SIGNAL \stack[3][4]~q\ : std_logic;
SIGNAL \data_out~35_combout\ : std_logic;
SIGNAL \data_out~36_combout\ : std_logic;
SIGNAL \data_out~37_combout\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \stack[5][5]~q\ : std_logic;
SIGNAL \stack[4][5]~feeder_combout\ : std_logic;
SIGNAL \stack[4][5]~q\ : std_logic;
SIGNAL \data_out~38_combout\ : std_logic;
SIGNAL \stack[6][5]~q\ : std_logic;
SIGNAL \data_out~55_combout\ : std_logic;
SIGNAL \stack[1][5]~q\ : std_logic;
SIGNAL \stack[0][5]~q\ : std_logic;
SIGNAL \stack[2][5]~q\ : std_logic;
SIGNAL \stack[3][5]~q\ : std_logic;
SIGNAL \data_out~39_combout\ : std_logic;
SIGNAL \data_out~40_combout\ : std_logic;
SIGNAL \data_out~41_combout\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \stack[6][6]~q\ : std_logic;
SIGNAL \stack[5][6]~q\ : std_logic;
SIGNAL \stack[4][6]~feeder_combout\ : std_logic;
SIGNAL \stack[4][6]~q\ : std_logic;
SIGNAL \data_out~42_combout\ : std_logic;
SIGNAL \data_out~56_combout\ : std_logic;
SIGNAL \stack[1][6]~feeder_combout\ : std_logic;
SIGNAL \stack[1][6]~q\ : std_logic;
SIGNAL \stack[0][6]~q\ : std_logic;
SIGNAL \stack[3][6]~feeder_combout\ : std_logic;
SIGNAL \stack[3][6]~q\ : std_logic;
SIGNAL \stack[2][6]~q\ : std_logic;
SIGNAL \data_out~43_combout\ : std_logic;
SIGNAL \data_out~44_combout\ : std_logic;
SIGNAL \data_out~45_combout\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \stack[5][7]~q\ : std_logic;
SIGNAL \stack[4][7]~feeder_combout\ : std_logic;
SIGNAL \stack[4][7]~q\ : std_logic;
SIGNAL \data_out~46_combout\ : std_logic;
SIGNAL \stack[6][7]~q\ : std_logic;
SIGNAL \data_out~57_combout\ : std_logic;
SIGNAL \stack[3][7]~feeder_combout\ : std_logic;
SIGNAL \stack[3][7]~q\ : std_logic;
SIGNAL \stack[2][7]~q\ : std_logic;
SIGNAL \data_out~47_combout\ : std_logic;
SIGNAL \stack[1][7]~feeder_combout\ : std_logic;
SIGNAL \stack[1][7]~q\ : std_logic;
SIGNAL \stack[0][7]~q\ : std_logic;
SIGNAL \data_out~48_combout\ : std_logic;
SIGNAL \data_out~49_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL pointer : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

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
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

-- Location: IOOBUF_X69_Y73_N16
\data_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~21_combout\,
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\data_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~25_combout\,
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\data_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~29_combout\,
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\data_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~33_combout\,
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\data_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~37_combout\,
	devoe => ww_devoe,
	o => \data_out[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\data_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~41_combout\,
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
	i => \data_out~45_combout\,
	devoe => ww_devoe,
	o => \data_out[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\data_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~49_combout\,
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\full~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~0_combout\,
	devoe => ww_devoe,
	o => \full~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\empty~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~0_combout\,
	devoe => ww_devoe,
	o => \empty~output_o\);

-- Location: IOIBUF_X115_Y40_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\push~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_push,
	o => \push~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\pop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pop,
	o => \pop~input_o\);

-- Location: LCCOMB_X113_Y40_N10
\pointer[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[2]~4_combout\ = (\push~input_o\ & (pointer(0))) # (!\push~input_o\ & (!pointer(0) & \pop~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datac => pointer(0),
	datad => \pop~input_o\,
	combout => \pointer[2]~4_combout\);

-- Location: LCCOMB_X114_Y40_N26
\pointer[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[2]~5_combout\ = (pointer(1) & ((pointer(2)) # ((pointer(0) & \pointer[2]~4_combout\)))) # (!pointer(1) & (pointer(2) & ((pointer(0)) # (!\pointer[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => pointer(0),
	datac => pointer(2),
	datad => \pointer[2]~4_combout\,
	combout => \pointer[2]~5_combout\);

-- Location: IOIBUF_X115_Y17_N1
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X114_Y40_N27
\pointer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \pointer[2]~5_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(2));

-- Location: LCCOMB_X113_Y40_N28
\pointer[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[1]~2_combout\ = (\pop~input_o\ & ((pointer(1) & (pointer(0))) # (!pointer(1) & (!pointer(0) & pointer(2))))) # (!\pop~input_o\ & (pointer(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pop~input_o\,
	datab => pointer(1),
	datac => pointer(0),
	datad => pointer(2),
	combout => \pointer[1]~2_combout\);

-- Location: LCCOMB_X113_Y40_N8
\pointer[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer[1]~6_combout\ = (\process_0~0_combout\ & (pointer(0) $ ((pointer(1))))) # (!\process_0~0_combout\ & (((\pointer[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => pointer(0),
	datac => pointer(1),
	datad => \pointer[1]~2_combout\,
	combout => \pointer[1]~6_combout\);

-- Location: FF_X113_Y40_N9
\pointer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \pointer[1]~6_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(1));

-- Location: LCCOMB_X113_Y40_N6
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\push~input_o\ & (((!pointer(2)) # (!pointer(0))) # (!pointer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(1),
	datac => pointer(0),
	datad => pointer(2),
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X113_Y40_N18
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!pointer(0) & (!pointer(1) & !pointer(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datad => pointer(2),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X113_Y40_N14
\pointer~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer~3_combout\ = pointer(0) $ (((\process_0~0_combout\) # ((\pop~input_o\ & !\Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \pop~input_o\,
	datac => pointer(0),
	datad => \Equal1~0_combout\,
	combout => \pointer~3_combout\);

-- Location: FF_X113_Y40_N15
\pointer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \pointer~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(0));

-- Location: IOIBUF_X115_Y13_N8
\peek~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_peek,
	o => \peek~input_o\);

-- Location: LCCOMB_X113_Y39_N28
\data_out~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~19_combout\ = (pointer(2) & (\peek~input_o\ & ((pointer(0)) # (pointer(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(2),
	datac => \peek~input_o\,
	datad => pointer(1),
	combout => \data_out~19_combout\);

-- Location: LCCOMB_X113_Y39_N22
\data_out~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~20_combout\ = (\peek~input_o\ & (pointer(2) $ (((pointer(0)) # (pointer(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(2),
	datac => \peek~input_o\,
	datad => pointer(1),
	combout => \data_out~20_combout\);

-- Location: IOIBUF_X115_Y18_N8
\data_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: LCCOMB_X111_Y40_N20
\Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~6_combout\ = (pointer(2) & (\push~input_o\ & (pointer(1) & !pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(2),
	datab => \push~input_o\,
	datac => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~6_combout\);

-- Location: FF_X111_Y40_N17
\stack[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][0]~q\);

-- Location: LCCOMB_X113_Y40_N12
\Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~5_combout\ = (\push~input_o\ & (!pointer(1) & (pointer(0) & pointer(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(1),
	datac => pointer(0),
	datad => pointer(2),
	combout => \Decoder0~5_combout\);

-- Location: FF_X113_Y40_N25
\stack[5][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][0]~q\);

-- Location: LCCOMB_X112_Y40_N26
\Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~4_combout\ = (\push~input_o\ & (!pointer(1) & (!pointer(0) & pointer(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(1),
	datac => pointer(0),
	datad => pointer(2),
	combout => \Decoder0~4_combout\);

-- Location: FF_X112_Y40_N21
\stack[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][0]~q\);

-- Location: LCCOMB_X113_Y40_N24
\data_out~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~18_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][0]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][0]~q\,
	datad => \stack[4][0]~q\,
	combout => \data_out~18_combout\);

-- Location: LCCOMB_X111_Y40_N16
\data_out~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~50_combout\ = (\data_out~18_combout\) # ((pointer(0) & (pointer(1) & \stack[6][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[6][0]~q\,
	datad => \data_out~18_combout\,
	combout => \data_out~50_combout\);

-- Location: LCCOMB_X113_Y39_N12
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = pointer(0) $ (pointer(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pointer(0),
	datad => pointer(1),
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X114_Y39_N16
\Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (\push~input_o\ & (!pointer(2) & (pointer(0) & !pointer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(2),
	datac => pointer(0),
	datad => pointer(1),
	combout => \Decoder0~0_combout\);

-- Location: FF_X114_Y39_N1
\stack[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][0]~q\);

-- Location: LCCOMB_X113_Y39_N26
\Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~3_combout\ = (\push~input_o\ & (!pointer(2) & (!pointer(0) & !pointer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(2),
	datac => pointer(0),
	datad => pointer(1),
	combout => \Decoder0~3_combout\);

-- Location: FF_X113_Y39_N7
\stack[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][0]~q\);

-- Location: LCCOMB_X114_Y38_N24
\Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (\push~input_o\ & (!pointer(2) & (pointer(1) & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(2),
	datac => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~1_combout\);

-- Location: FF_X114_Y38_N1
\stack[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][0]~q\);

-- Location: LCCOMB_X114_Y40_N10
\Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~2_combout\ = (\push~input_o\ & (!pointer(2) & (pointer(1) & !pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(2),
	datac => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~2_combout\);

-- Location: FF_X114_Y40_N1
\stack[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][0]~q\);

-- Location: LCCOMB_X114_Y40_N0
\data_out~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~16_combout\ = (pointer(1) & (((\stack[2][0]~q\ & pointer(0))))) # (!pointer(1) & ((\stack[3][0]~q\) # ((pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => \stack[3][0]~q\,
	datac => \stack[2][0]~q\,
	datad => pointer(0),
	combout => \data_out~16_combout\);

-- Location: LCCOMB_X113_Y39_N6
\data_out~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~17_combout\ = (\Add1~0_combout\ & ((\data_out~16_combout\ & ((\stack[0][0]~q\))) # (!\data_out~16_combout\ & (\stack[1][0]~q\)))) # (!\Add1~0_combout\ & (((\data_out~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[1][0]~q\,
	datac => \stack[0][0]~q\,
	datad => \data_out~16_combout\,
	combout => \data_out~17_combout\);

-- Location: LCCOMB_X112_Y39_N28
\data_out~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~21_combout\ = (\data_out~19_combout\ & ((\data_out~50_combout\) # ((\data_out~20_combout\ & \data_out~17_combout\)))) # (!\data_out~19_combout\ & (\data_out~20_combout\ & ((\data_out~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~19_combout\,
	datab => \data_out~20_combout\,
	datac => \data_out~50_combout\,
	datad => \data_out~17_combout\,
	combout => \data_out~21_combout\);

-- Location: IOIBUF_X115_Y11_N8
\data_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: LCCOMB_X114_Y38_N2
\stack[3][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \stack[3][1]~feeder_combout\);

-- Location: FF_X114_Y38_N3
\stack[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[3][1]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][1]~q\);

-- Location: FF_X114_Y40_N9
\stack[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][1]~q\);

-- Location: LCCOMB_X114_Y40_N8
\data_out~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~23_combout\ = (pointer(1) & (((\stack[2][1]~q\ & pointer(0))))) # (!pointer(1) & ((\stack[3][1]~q\) # ((pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => \stack[3][1]~q\,
	datac => \stack[2][1]~q\,
	datad => pointer(0),
	combout => \data_out~23_combout\);

-- Location: FF_X113_Y39_N21
\stack[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][1]~q\);

-- Location: LCCOMB_X114_Y39_N6
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

-- Location: FF_X114_Y39_N7
\stack[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[1][1]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][1]~q\);

-- Location: LCCOMB_X113_Y39_N20
\data_out~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~24_combout\ = (\Add1~0_combout\ & ((\data_out~23_combout\ & (\stack[0][1]~q\)) # (!\data_out~23_combout\ & ((\stack[1][1]~q\))))) # (!\Add1~0_combout\ & (\data_out~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \data_out~23_combout\,
	datac => \stack[0][1]~q\,
	datad => \stack[1][1]~q\,
	combout => \data_out~24_combout\);

-- Location: FF_X113_Y40_N19
\stack[5][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][1]~q\);

-- Location: LCCOMB_X112_Y40_N22
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

-- Location: FF_X112_Y40_N23
\stack[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[4][1]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][1]~q\);

-- Location: LCCOMB_X112_Y40_N16
\data_out~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~22_combout\ = (pointer(1) & (\stack[5][1]~q\ & (!pointer(0)))) # (!pointer(1) & (((pointer(0) & \stack[4][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[5][1]~q\,
	datab => pointer(1),
	datac => pointer(0),
	datad => \stack[4][1]~q\,
	combout => \data_out~22_combout\);

-- Location: FF_X111_Y40_N23
\stack[6][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][1]~q\);

-- Location: LCCOMB_X111_Y40_N22
\data_out~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~51_combout\ = (\data_out~22_combout\) # ((pointer(1) & (\stack[6][1]~q\ & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datab => \data_out~22_combout\,
	datac => \stack[6][1]~q\,
	datad => pointer(0),
	combout => \data_out~51_combout\);

-- Location: LCCOMB_X111_Y40_N0
\data_out~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~25_combout\ = (\data_out~24_combout\ & ((\data_out~20_combout\) # ((\data_out~51_combout\ & \data_out~19_combout\)))) # (!\data_out~24_combout\ & (((\data_out~51_combout\ & \data_out~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~24_combout\,
	datab => \data_out~20_combout\,
	datac => \data_out~51_combout\,
	datad => \data_out~19_combout\,
	combout => \data_out~25_combout\);

-- Location: IOIBUF_X115_Y10_N1
\data_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: LCCOMB_X114_Y39_N8
\stack[1][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[1][2]~feeder_combout\);

-- Location: FF_X114_Y39_N9
\stack[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[1][2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][2]~q\);

-- Location: FF_X113_Y39_N11
\stack[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][2]~q\);

-- Location: FF_X114_Y40_N19
\stack[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][2]~q\);

-- Location: LCCOMB_X114_Y38_N4
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

-- Location: FF_X114_Y38_N5
\stack[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[3][2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][2]~q\);

-- Location: LCCOMB_X114_Y40_N18
\data_out~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~27_combout\ = (pointer(0) & (((\stack[2][2]~q\)) # (!pointer(1)))) # (!pointer(0) & (!pointer(1) & ((\stack[3][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[2][2]~q\,
	datad => \stack[3][2]~q\,
	combout => \data_out~27_combout\);

-- Location: LCCOMB_X113_Y39_N10
\data_out~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~28_combout\ = (\Add1~0_combout\ & ((\data_out~27_combout\ & ((\stack[0][2]~q\))) # (!\data_out~27_combout\ & (\stack[1][2]~q\)))) # (!\Add1~0_combout\ & (((\data_out~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[1][2]~q\,
	datac => \stack[0][2]~q\,
	datad => \data_out~27_combout\,
	combout => \data_out~28_combout\);

-- Location: FF_X113_Y40_N21
\stack[5][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][2]~q\);

-- Location: LCCOMB_X112_Y40_N10
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

-- Location: FF_X112_Y40_N11
\stack[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[4][2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][2]~q\);

-- Location: LCCOMB_X113_Y40_N20
\data_out~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~26_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][2]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][2]~q\,
	datad => \stack[4][2]~q\,
	combout => \data_out~26_combout\);

-- Location: LCCOMB_X111_Y40_N26
\stack[6][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[6][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[6][2]~feeder_combout\);

-- Location: FF_X111_Y40_N27
\stack[6][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[6][2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][2]~q\);

-- Location: LCCOMB_X112_Y40_N0
\data_out~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~52_combout\ = (\data_out~26_combout\) # ((pointer(0) & (pointer(1) & \stack[6][2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \data_out~26_combout\,
	datac => pointer(1),
	datad => \stack[6][2]~q\,
	combout => \data_out~52_combout\);

-- Location: LCCOMB_X112_Y39_N10
\data_out~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~29_combout\ = (\data_out~19_combout\ & ((\data_out~52_combout\) # ((\data_out~28_combout\ & \data_out~20_combout\)))) # (!\data_out~19_combout\ & (\data_out~28_combout\ & ((\data_out~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~19_combout\,
	datab => \data_out~28_combout\,
	datac => \data_out~52_combout\,
	datad => \data_out~20_combout\,
	combout => \data_out~29_combout\);

-- Location: IOIBUF_X115_Y15_N1
\data_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: LCCOMB_X114_Y39_N26
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

-- Location: FF_X114_Y39_N27
\stack[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[1][3]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][3]~q\);

-- Location: FF_X113_Y39_N25
\stack[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][3]~q\);

-- Location: FF_X114_Y40_N21
\stack[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][3]~q\);

-- Location: FF_X114_Y38_N31
\stack[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][3]~q\);

-- Location: LCCOMB_X114_Y40_N20
\data_out~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~31_combout\ = (pointer(0) & (((\stack[2][3]~q\)) # (!pointer(1)))) # (!pointer(0) & (!pointer(1) & ((\stack[3][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[2][3]~q\,
	datad => \stack[3][3]~q\,
	combout => \data_out~31_combout\);

-- Location: LCCOMB_X113_Y39_N24
\data_out~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~32_combout\ = (\Add1~0_combout\ & ((\data_out~31_combout\ & ((\stack[0][3]~q\))) # (!\data_out~31_combout\ & (\stack[1][3]~q\)))) # (!\Add1~0_combout\ & (((\data_out~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[1][3]~q\,
	datac => \stack[0][3]~q\,
	datad => \data_out~31_combout\,
	combout => \data_out~32_combout\);

-- Location: FF_X111_Y40_N25
\stack[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][3]~q\);

-- Location: FF_X113_Y40_N27
\stack[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][3]~q\);

-- Location: FF_X112_Y40_N13
\stack[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][3]~q\);

-- Location: LCCOMB_X113_Y40_N26
\data_out~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~30_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][3]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][3]~q\,
	datad => \stack[4][3]~q\,
	combout => \data_out~30_combout\);

-- Location: LCCOMB_X111_Y40_N24
\data_out~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~53_combout\ = (\data_out~30_combout\) # ((pointer(0) & (pointer(1) & \stack[6][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[6][3]~q\,
	datad => \data_out~30_combout\,
	combout => \data_out~53_combout\);

-- Location: LCCOMB_X111_Y40_N14
\data_out~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~33_combout\ = (\data_out~32_combout\ & ((\data_out~20_combout\) # ((\data_out~53_combout\ & \data_out~19_combout\)))) # (!\data_out~32_combout\ & (\data_out~53_combout\ & ((\data_out~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~32_combout\,
	datab => \data_out~53_combout\,
	datac => \data_out~20_combout\,
	datad => \data_out~19_combout\,
	combout => \data_out~33_combout\);

-- Location: IOIBUF_X115_Y4_N22
\data_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: FF_X111_Y40_N13
\stack[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][4]~q\);

-- Location: FF_X113_Y40_N5
\stack[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][4]~q\);

-- Location: LCCOMB_X112_Y40_N2
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

-- Location: FF_X112_Y40_N3
\stack[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[4][4]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][4]~q\);

-- Location: LCCOMB_X113_Y40_N4
\data_out~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~34_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][4]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][4]~q\,
	datad => \stack[4][4]~q\,
	combout => \data_out~34_combout\);

-- Location: LCCOMB_X111_Y40_N12
\data_out~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~54_combout\ = (\data_out~34_combout\) # ((pointer(0) & (pointer(1) & \stack[6][4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[6][4]~q\,
	datad => \data_out~34_combout\,
	combout => \data_out~54_combout\);

-- Location: FF_X114_Y39_N29
\stack[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][4]~q\);

-- Location: FF_X113_Y39_N3
\stack[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][4]~q\);

-- Location: FF_X114_Y40_N31
\stack[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][4]~q\);

-- Location: LCCOMB_X114_Y38_N16
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

-- Location: FF_X114_Y38_N17
\stack[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[3][4]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][4]~q\);

-- Location: LCCOMB_X114_Y40_N30
\data_out~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~35_combout\ = (pointer(0) & (((\stack[2][4]~q\)) # (!pointer(1)))) # (!pointer(0) & (!pointer(1) & ((\stack[3][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[2][4]~q\,
	datad => \stack[3][4]~q\,
	combout => \data_out~35_combout\);

-- Location: LCCOMB_X113_Y39_N2
\data_out~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~36_combout\ = (\Add1~0_combout\ & ((\data_out~35_combout\ & ((\stack[0][4]~q\))) # (!\data_out~35_combout\ & (\stack[1][4]~q\)))) # (!\Add1~0_combout\ & (((\data_out~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[1][4]~q\,
	datac => \stack[0][4]~q\,
	datad => \data_out~35_combout\,
	combout => \data_out~36_combout\);

-- Location: LCCOMB_X111_Y40_N2
\data_out~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~37_combout\ = (\data_out~54_combout\ & ((\data_out~19_combout\) # ((\data_out~20_combout\ & \data_out~36_combout\)))) # (!\data_out~54_combout\ & (\data_out~20_combout\ & (\data_out~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~54_combout\,
	datab => \data_out~20_combout\,
	datac => \data_out~36_combout\,
	datad => \data_out~19_combout\,
	combout => \data_out~37_combout\);

-- Location: IOIBUF_X115_Y16_N8
\data_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: FF_X113_Y40_N31
\stack[5][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][5]~q\);

-- Location: LCCOMB_X112_Y40_N28
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

-- Location: FF_X112_Y40_N29
\stack[4][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[4][5]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][5]~q\);

-- Location: LCCOMB_X113_Y40_N30
\data_out~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~38_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][5]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][5]~q\,
	datad => \stack[4][5]~q\,
	combout => \data_out~38_combout\);

-- Location: FF_X111_Y40_N9
\stack[6][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][5]~q\);

-- Location: LCCOMB_X111_Y40_N8
\data_out~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~55_combout\ = (\data_out~38_combout\) # ((pointer(0) & (\stack[6][5]~q\ & pointer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => \data_out~38_combout\,
	datac => \stack[6][5]~q\,
	datad => pointer(1),
	combout => \data_out~55_combout\);

-- Location: FF_X114_Y39_N23
\stack[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][5]~q\);

-- Location: FF_X113_Y39_N5
\stack[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][5]~q\);

-- Location: FF_X114_Y40_N29
\stack[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][5]~q\);

-- Location: FF_X114_Y38_N19
\stack[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][5]~q\);

-- Location: LCCOMB_X114_Y40_N28
\data_out~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~39_combout\ = (pointer(0) & (((\stack[2][5]~q\)) # (!pointer(1)))) # (!pointer(0) & (!pointer(1) & ((\stack[3][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[2][5]~q\,
	datad => \stack[3][5]~q\,
	combout => \data_out~39_combout\);

-- Location: LCCOMB_X113_Y39_N4
\data_out~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~40_combout\ = (\Add1~0_combout\ & ((\data_out~39_combout\ & ((\stack[0][5]~q\))) # (!\data_out~39_combout\ & (\stack[1][5]~q\)))) # (!\Add1~0_combout\ & (((\data_out~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[1][5]~q\,
	datac => \stack[0][5]~q\,
	datad => \data_out~39_combout\,
	combout => \data_out~40_combout\);

-- Location: LCCOMB_X112_Y39_N4
\data_out~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~41_combout\ = (\data_out~19_combout\ & ((\data_out~55_combout\) # ((\data_out~20_combout\ & \data_out~40_combout\)))) # (!\data_out~19_combout\ & (\data_out~20_combout\ & ((\data_out~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~19_combout\,
	datab => \data_out~20_combout\,
	datac => \data_out~55_combout\,
	datad => \data_out~40_combout\,
	combout => \data_out~41_combout\);

-- Location: IOIBUF_X115_Y4_N15
\data_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: FF_X111_Y40_N11
\stack[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][6]~q\);

-- Location: FF_X113_Y40_N17
\stack[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][6]~q\);

-- Location: LCCOMB_X112_Y40_N14
\stack[4][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[4][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[4][6]~feeder_combout\);

-- Location: FF_X112_Y40_N15
\stack[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[4][6]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][6]~q\);

-- Location: LCCOMB_X113_Y40_N16
\data_out~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~42_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][6]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][6]~q\,
	datad => \stack[4][6]~q\,
	combout => \data_out~42_combout\);

-- Location: LCCOMB_X111_Y40_N10
\data_out~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~56_combout\ = (\data_out~42_combout\) # ((pointer(0) & (pointer(1) & \stack[6][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[6][6]~q\,
	datad => \data_out~42_combout\,
	combout => \data_out~56_combout\);

-- Location: LCCOMB_X114_Y39_N12
\stack[1][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[1][6]~feeder_combout\);

-- Location: FF_X114_Y39_N13
\stack[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[1][6]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][6]~q\);

-- Location: FF_X113_Y39_N31
\stack[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][6]~q\);

-- Location: LCCOMB_X114_Y38_N8
\stack[3][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[3][6]~feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \stack[3][6]~feeder_combout\);

-- Location: FF_X114_Y38_N9
\stack[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[3][6]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][6]~q\);

-- Location: FF_X114_Y40_N3
\stack[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][6]~q\);

-- Location: LCCOMB_X114_Y40_N2
\data_out~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~43_combout\ = (pointer(1) & (((\stack[2][6]~q\ & pointer(0))))) # (!pointer(1) & ((\stack[3][6]~q\) # ((pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[3][6]~q\,
	datab => pointer(1),
	datac => \stack[2][6]~q\,
	datad => pointer(0),
	combout => \data_out~43_combout\);

-- Location: LCCOMB_X113_Y39_N30
\data_out~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~44_combout\ = (\Add1~0_combout\ & ((\data_out~43_combout\ & ((\stack[0][6]~q\))) # (!\data_out~43_combout\ & (\stack[1][6]~q\)))) # (!\Add1~0_combout\ & (((\data_out~43_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \stack[1][6]~q\,
	datac => \stack[0][6]~q\,
	datad => \data_out~43_combout\,
	combout => \data_out~44_combout\);

-- Location: LCCOMB_X111_Y40_N28
\data_out~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~45_combout\ = (\data_out~56_combout\ & ((\data_out~19_combout\) # ((\data_out~20_combout\ & \data_out~44_combout\)))) # (!\data_out~56_combout\ & (((\data_out~20_combout\ & \data_out~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~56_combout\,
	datab => \data_out~19_combout\,
	datac => \data_out~20_combout\,
	datad => \data_out~44_combout\,
	combout => \data_out~45_combout\);

-- Location: IOIBUF_X115_Y5_N15
\data_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: FF_X113_Y40_N23
\stack[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[5][7]~q\);

-- Location: LCCOMB_X112_Y40_N24
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

-- Location: FF_X112_Y40_N25
\stack[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[4][7]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[4][7]~q\);

-- Location: LCCOMB_X113_Y40_N22
\data_out~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~46_combout\ = (pointer(0) & (!pointer(1) & ((\stack[4][7]~q\)))) # (!pointer(0) & (pointer(1) & (\stack[5][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => \stack[5][7]~q\,
	datad => \stack[4][7]~q\,
	combout => \data_out~46_combout\);

-- Location: FF_X111_Y40_N31
\stack[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[6][7]~q\);

-- Location: LCCOMB_X111_Y40_N30
\data_out~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~57_combout\ = (\data_out~46_combout\) # ((pointer(1) & (\stack[6][7]~q\ & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~46_combout\,
	datab => pointer(1),
	datac => \stack[6][7]~q\,
	datad => pointer(0),
	combout => \data_out~57_combout\);

-- Location: LCCOMB_X114_Y38_N22
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

-- Location: FF_X114_Y38_N23
\stack[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[3][7]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[3][7]~q\);

-- Location: FF_X114_Y40_N25
\stack[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][7]~q\);

-- Location: LCCOMB_X114_Y40_N24
\data_out~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~47_combout\ = (pointer(1) & (((\stack[2][7]~q\ & pointer(0))))) # (!pointer(1) & ((\stack[3][7]~q\) # ((pointer(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[3][7]~q\,
	datab => pointer(1),
	datac => \stack[2][7]~q\,
	datad => pointer(0),
	combout => \data_out~47_combout\);

-- Location: LCCOMB_X114_Y39_N14
\stack[1][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][7]~feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \stack[1][7]~feeder_combout\);

-- Location: FF_X114_Y39_N15
\stack[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stack[1][7]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][7]~q\);

-- Location: FF_X113_Y39_N1
\stack[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][7]~q\);

-- Location: LCCOMB_X113_Y39_N0
\data_out~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~48_combout\ = (\data_out~47_combout\ & (((\stack[0][7]~q\) # (!\Add1~0_combout\)))) # (!\data_out~47_combout\ & (\stack[1][7]~q\ & ((\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~47_combout\,
	datab => \stack[1][7]~q\,
	datac => \stack[0][7]~q\,
	datad => \Add1~0_combout\,
	combout => \data_out~48_combout\);

-- Location: LCCOMB_X111_Y40_N4
\data_out~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~49_combout\ = (\data_out~57_combout\ & ((\data_out~19_combout\) # ((\data_out~48_combout\ & \data_out~20_combout\)))) # (!\data_out~57_combout\ & (((\data_out~48_combout\ & \data_out~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~57_combout\,
	datab => \data_out~19_combout\,
	datac => \data_out~48_combout\,
	datad => \data_out~20_combout\,
	combout => \data_out~49_combout\);

-- Location: LCCOMB_X111_Y40_N6
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (pointer(0) & (pointer(1) & pointer(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(0),
	datab => pointer(1),
	datac => pointer(2),
	combout => \Equal0~0_combout\);

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


