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

-- DATE "05/01/2025 21:24:12"

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

ENTITY 	stack_4bit IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	push : IN std_logic;
	pop : IN std_logic;
	peek : IN std_logic;
	data_in : IN std_logic_vector(3 DOWNTO 0);
	data_out : BUFFER std_logic_vector(3 DOWNTO 0);
	full : BUFFER std_logic;
	empty : BUFFER std_logic
	);
END stack_4bit;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[1]	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[2]	=>  Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[3]	=>  Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- full	=>  Location: PIN_G19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- empty	=>  Location: PIN_F19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- peek	=>  Location: PIN_AD27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- push	=>  Location: PIN_AC28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- pop	=>  Location: PIN_AC27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_AB27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_AD26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF stack_4bit IS
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
SIGNAL ww_data_in : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_data_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_full : std_logic;
SIGNAL ww_empty : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \peek~input_o\ : std_logic;
SIGNAL \data_out[0]~output_o\ : std_logic;
SIGNAL \data_out[1]~output_o\ : std_logic;
SIGNAL \data_out[2]~output_o\ : std_logic;
SIGNAL \data_out[3]~output_o\ : std_logic;
SIGNAL \full~output_o\ : std_logic;
SIGNAL \empty~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \push~input_o\ : std_logic;
SIGNAL \pop~input_o\ : std_logic;
SIGNAL \pointer~1_combout\ : std_logic;
SIGNAL \pointer~0_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \stack[2][0]~q\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \stack[1][0]~q\ : std_logic;
SIGNAL \data_out~0_combout\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \stack[0][0]~q\ : std_logic;
SIGNAL \data_out~1_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \stack[2][1]~q\ : std_logic;
SIGNAL \stack[1][1]~q\ : std_logic;
SIGNAL \data_out~2_combout\ : std_logic;
SIGNAL \stack[0][1]~q\ : std_logic;
SIGNAL \data_out~3_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \stack[2][2]~feeder_combout\ : std_logic;
SIGNAL \stack[2][2]~q\ : std_logic;
SIGNAL \stack[1][2]~q\ : std_logic;
SIGNAL \data_out~4_combout\ : std_logic;
SIGNAL \stack[0][2]~q\ : std_logic;
SIGNAL \data_out~5_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \stack[2][3]~feeder_combout\ : std_logic;
SIGNAL \stack[2][3]~q\ : std_logic;
SIGNAL \stack[1][3]~q\ : std_logic;
SIGNAL \data_out~6_combout\ : std_logic;
SIGNAL \stack[0][3]~q\ : std_logic;
SIGNAL \data_out~7_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \data_out~8_combout\ : std_logic;
SIGNAL pointer : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_data_out~8_combout\ : std_logic;

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

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_data_out~8_combout\ <= NOT \data_out~8_combout\;

-- Location: IOOBUF_X107_Y73_N9
\data_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~1_combout\,
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\data_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~3_combout\,
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\data_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~5_combout\,
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\data_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~7_combout\,
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
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

-- Location: IOOBUF_X94_Y73_N2
\empty~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_data_out~8_combout\,
	devoe => ww_devoe,
	o => \empty~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
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

-- Location: LCCOMB_X113_Y18_N24
\pointer~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer~1_combout\ = (pointer(0) & (!\pop~input_o\ & ((pointer(1)) # (!\push~input_o\)))) # (!pointer(0) & ((\push~input_o\) # ((pointer(1) & \pop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(1),
	datac => pointer(0),
	datad => \pop~input_o\,
	combout => \pointer~1_combout\);

-- Location: FF_X113_Y18_N25
\pointer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pointer~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(0));

-- Location: LCCOMB_X113_Y18_N20
\pointer~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pointer~0_combout\ = (\push~input_o\ & ((pointer(0)) # ((pointer(1))))) # (!\push~input_o\ & (pointer(1) & ((pointer(0)) # (!\pop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(0),
	datac => pointer(1),
	datad => \pop~input_o\,
	combout => \pointer~0_combout\);

-- Location: FF_X113_Y18_N21
\pointer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pointer~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pointer(1));

-- Location: LCCOMB_X113_Y18_N26
\Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (\push~input_o\ & (pointer(1) & !pointer(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~0_combout\);

-- Location: FF_X113_Y18_N27
\stack[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][0]~q\);

-- Location: LCCOMB_X112_Y18_N28
\Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (\push~input_o\ & (!pointer(1) & pointer(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \push~input_o\,
	datac => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~1_combout\);

-- Location: FF_X112_Y18_N1
\stack[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][0]~q\);

-- Location: LCCOMB_X112_Y18_N0
\data_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~0_combout\ = (pointer(1) & ((pointer(0) & (\stack[2][0]~q\)) # (!pointer(0) & ((\stack[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][0]~q\,
	datab => pointer(0),
	datac => \stack[1][0]~q\,
	datad => pointer(1),
	combout => \data_out~0_combout\);

-- Location: LCCOMB_X112_Y18_N18
\Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~2_combout\ = (\push~input_o\ & (!pointer(1) & !pointer(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \push~input_o\,
	datac => pointer(1),
	datad => pointer(0),
	combout => \Decoder0~2_combout\);

-- Location: FF_X112_Y18_N15
\stack[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][0]~q\);

-- Location: LCCOMB_X112_Y18_N14
\data_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~1_combout\ = (\data_out~0_combout\) # ((!pointer(1) & (\stack[0][0]~q\ & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => pointer(1),
	datac => \stack[0][0]~q\,
	datad => pointer(0),
	combout => \data_out~1_combout\);

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

-- Location: FF_X113_Y18_N23
\stack[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][1]~q\);

-- Location: FF_X112_Y18_N25
\stack[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][1]~q\);

-- Location: LCCOMB_X112_Y18_N24
\data_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~2_combout\ = (pointer(1) & ((pointer(0) & (\stack[2][1]~q\)) # (!pointer(0) & ((\stack[1][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][1]~q\,
	datab => pointer(1),
	datac => \stack[1][1]~q\,
	datad => pointer(0),
	combout => \data_out~2_combout\);

-- Location: FF_X112_Y18_N27
\stack[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][1]~q\);

-- Location: LCCOMB_X112_Y18_N26
\data_out~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~3_combout\ = (\data_out~2_combout\) # ((pointer(0) & (\stack[0][1]~q\ & !pointer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~2_combout\,
	datab => pointer(0),
	datac => \stack[0][1]~q\,
	datad => pointer(1),
	combout => \data_out~3_combout\);

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

-- Location: LCCOMB_X113_Y18_N16
\stack[2][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[2][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[2][2]~feeder_combout\);

-- Location: FF_X113_Y18_N17
\stack[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[2][2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][2]~q\);

-- Location: FF_X112_Y18_N21
\stack[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][2]~q\);

-- Location: LCCOMB_X112_Y18_N20
\data_out~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~4_combout\ = (pointer(1) & ((pointer(0) & (\stack[2][2]~q\)) # (!pointer(0) & ((\stack[1][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][2]~q\,
	datab => pointer(0),
	datac => \stack[1][2]~q\,
	datad => pointer(1),
	combout => \data_out~4_combout\);

-- Location: FF_X112_Y18_N7
\stack[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][2]~q\);

-- Location: LCCOMB_X112_Y18_N6
\data_out~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~5_combout\ = (\data_out~4_combout\) # ((!pointer(1) & (\stack[0][2]~q\ & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~4_combout\,
	datab => pointer(1),
	datac => \stack[0][2]~q\,
	datad => pointer(0),
	combout => \data_out~5_combout\);

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

-- Location: LCCOMB_X113_Y18_N30
\stack[2][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[2][3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \stack[2][3]~feeder_combout\);

-- Location: FF_X113_Y18_N31
\stack[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[2][3]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][3]~q\);

-- Location: FF_X112_Y18_N13
\stack[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][3]~q\);

-- Location: LCCOMB_X112_Y18_N12
\data_out~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~6_combout\ = (pointer(1) & ((pointer(0) & (\stack[2][3]~q\)) # (!pointer(0) & ((\stack[1][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[2][3]~q\,
	datab => pointer(1),
	datac => \stack[1][3]~q\,
	datad => pointer(0),
	combout => \data_out~6_combout\);

-- Location: FF_X112_Y18_N23
\stack[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][3]~q\);

-- Location: LCCOMB_X112_Y18_N22
\data_out~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~7_combout\ = (\data_out~6_combout\) # ((!pointer(1) & (\stack[0][3]~q\ & pointer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~6_combout\,
	datab => pointer(1),
	datac => \stack[0][3]~q\,
	datad => pointer(0),
	combout => \data_out~7_combout\);

-- Location: LCCOMB_X112_Y18_N4
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (pointer(1) & pointer(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pointer(1),
	datad => pointer(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X112_Y18_N10
\data_out~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~8_combout\ = (pointer(0)) # (pointer(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pointer(0),
	datad => pointer(1),
	combout => \data_out~8_combout\);

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

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_full <= \full~output_o\;

ww_empty <= \empty~output_o\;
END structure;


