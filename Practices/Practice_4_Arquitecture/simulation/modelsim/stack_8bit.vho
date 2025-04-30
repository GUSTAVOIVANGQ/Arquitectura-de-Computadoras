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

-- DATE "04/30/2025 08:37:11"

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
	empty : BUFFER std_logic;
	full : BUFFER std_logic
	);
END stack_8bit;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_G19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[1]	=>  Location: PIN_F19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[2]	=>  Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[3]	=>  Location: PIN_F21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[4]	=>  Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[5]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[6]	=>  Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- data_out[7]	=>  Location: PIN_H19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- empty	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- full	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- pop	=>  Location: PIN_N21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- peek	=>  Location: PIN_R24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- push	=>  Location: PIN_M21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_M23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_AC28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_AC27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_AD27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_AB27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_AD26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


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
SIGNAL ww_empty : std_logic;
SIGNAL ww_full : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_out[0]~output_o\ : std_logic;
SIGNAL \data_out[1]~output_o\ : std_logic;
SIGNAL \data_out[2]~output_o\ : std_logic;
SIGNAL \data_out[3]~output_o\ : std_logic;
SIGNAL \data_out[4]~output_o\ : std_logic;
SIGNAL \data_out[5]~output_o\ : std_logic;
SIGNAL \data_out[6]~output_o\ : std_logic;
SIGNAL \data_out[7]~output_o\ : std_logic;
SIGNAL \empty~output_o\ : std_logic;
SIGNAL \full~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \pop~input_o\ : std_logic;
SIGNAL \push~input_o\ : std_logic;
SIGNAL \stack_ptr~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \stack_ptr~0_combout\ : std_logic;
SIGNAL \peek~input_o\ : std_logic;
SIGNAL \data_out~0_combout\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \stack[1][0]~1_combout\ : std_logic;
SIGNAL \stack[1][0]~q\ : std_logic;
SIGNAL \stack[0][0]~0_combout\ : std_logic;
SIGNAL \stack[0][0]~q\ : std_logic;
SIGNAL \data_out~1_combout\ : std_logic;
SIGNAL \stack[2][0]~2_combout\ : std_logic;
SIGNAL \stack[2][0]~q\ : std_logic;
SIGNAL \data_out~2_combout\ : std_logic;
SIGNAL \data_out~3_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \stack[0][1]~feeder_combout\ : std_logic;
SIGNAL \stack[0][1]~q\ : std_logic;
SIGNAL \stack[1][1]~q\ : std_logic;
SIGNAL \data_out~4_combout\ : std_logic;
SIGNAL \stack[2][1]~q\ : std_logic;
SIGNAL \data_out~5_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \stack[1][2]~q\ : std_logic;
SIGNAL \stack[0][2]~feeder_combout\ : std_logic;
SIGNAL \stack[0][2]~q\ : std_logic;
SIGNAL \data_out~6_combout\ : std_logic;
SIGNAL \stack[2][2]~q\ : std_logic;
SIGNAL \data_out~7_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \stack[0][3]~feeder_combout\ : std_logic;
SIGNAL \stack[0][3]~q\ : std_logic;
SIGNAL \stack[1][3]~q\ : std_logic;
SIGNAL \data_out~8_combout\ : std_logic;
SIGNAL \stack[2][3]~q\ : std_logic;
SIGNAL \data_out~9_combout\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \stack[0][4]~feeder_combout\ : std_logic;
SIGNAL \stack[0][4]~q\ : std_logic;
SIGNAL \stack[1][4]~q\ : std_logic;
SIGNAL \data_out~10_combout\ : std_logic;
SIGNAL \stack[2][4]~q\ : std_logic;
SIGNAL \data_out~11_combout\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \stack[0][5]~feeder_combout\ : std_logic;
SIGNAL \stack[0][5]~q\ : std_logic;
SIGNAL \stack[1][5]~q\ : std_logic;
SIGNAL \data_out~12_combout\ : std_logic;
SIGNAL \stack[2][5]~q\ : std_logic;
SIGNAL \data_out~13_combout\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \stack[0][6]~q\ : std_logic;
SIGNAL \stack[1][6]~q\ : std_logic;
SIGNAL \data_out~14_combout\ : std_logic;
SIGNAL \stack[2][6]~q\ : std_logic;
SIGNAL \data_out~15_combout\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \stack[0][7]~feeder_combout\ : std_logic;
SIGNAL \stack[0][7]~q\ : std_logic;
SIGNAL \stack[1][7]~q\ : std_logic;
SIGNAL \data_out~16_combout\ : std_logic;
SIGNAL \stack[2][7]~q\ : std_logic;
SIGNAL \data_out~17_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL stack_ptr : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_push <= push;
ww_pop <= pop;
ww_peek <= peek;
ww_data_in <= data_in;
data_out <= ww_data_out;
empty <= ww_empty;
full <= ww_full;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;

-- Location: IOOBUF_X69_Y73_N16
\data_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~3_combout\,
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
	i => \data_out~5_combout\,
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
	i => \data_out~7_combout\,
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
	i => \data_out~9_combout\,
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
	i => \data_out~11_combout\,
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
	i => \data_out~13_combout\,
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
	i => \data_out~15_combout\,
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
	i => \data_out~17_combout\,
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\empty~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_LessThan0~0_combout\,
	devoe => ww_devoe,
	o => \empty~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\full~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out~2_combout\,
	devoe => ww_devoe,
	o => \full~output_o\);

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

-- Location: IOIBUF_X115_Y42_N15
\pop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pop,
	o => \pop~input_o\);

-- Location: IOIBUF_X115_Y53_N15
\push~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_push,
	o => \push~input_o\);

-- Location: LCCOMB_X112_Y15_N22
\stack_ptr~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~1_combout\ = (stack_ptr(0) & (!\pop~input_o\ & ((stack_ptr(1)) # (!\push~input_o\)))) # (!stack_ptr(0) & ((\push~input_o\) # ((\pop~input_o\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datab => \pop~input_o\,
	datac => stack_ptr(0),
	datad => stack_ptr(1),
	combout => \stack_ptr~1_combout\);

-- Location: IOIBUF_X115_Y40_N8
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X112_Y15_N23
\stack_ptr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack_ptr~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stack_ptr(0));

-- Location: LCCOMB_X112_Y15_N24
\stack_ptr~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~0_combout\ = (\push~input_o\ & (((stack_ptr(1)) # (stack_ptr(0))))) # (!\push~input_o\ & (stack_ptr(1) & ((stack_ptr(0)) # (!\pop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pop~input_o\,
	datab => \push~input_o\,
	datac => stack_ptr(1),
	datad => stack_ptr(0),
	combout => \stack_ptr~0_combout\);

-- Location: FF_X112_Y15_N25
\stack_ptr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack_ptr~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stack_ptr(1));

-- Location: IOIBUF_X115_Y35_N22
\peek~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_peek,
	o => \peek~input_o\);

-- Location: LCCOMB_X112_Y15_N12
\data_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~0_combout\ = (stack_ptr(1) & (((\pop~input_o\) # (\peek~input_o\)))) # (!stack_ptr(1) & (stack_ptr(0) & ((\pop~input_o\) # (\peek~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stack_ptr(1),
	datab => stack_ptr(0),
	datac => \pop~input_o\,
	datad => \peek~input_o\,
	combout => \data_out~0_combout\);

-- Location: IOIBUF_X115_Y17_N1
\data_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: LCCOMB_X112_Y15_N10
\stack[1][0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[1][0]~1_combout\ = (\push~input_o\ & (stack_ptr(0) & !stack_ptr(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datac => stack_ptr(0),
	datad => stack_ptr(1),
	combout => \stack[1][0]~1_combout\);

-- Location: FF_X111_Y15_N1
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
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][0]~q\);

-- Location: LCCOMB_X112_Y15_N18
\stack[0][0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][0]~0_combout\ = (!stack_ptr(0) & (\push~input_o\ & !stack_ptr(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stack_ptr(0),
	datab => \push~input_o\,
	datad => stack_ptr(1),
	combout => \stack[0][0]~0_combout\);

-- Location: FF_X112_Y15_N19
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
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][0]~q\);

-- Location: LCCOMB_X111_Y15_N0
\data_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~1_combout\ = (stack_ptr(0) & (!stack_ptr(1) & ((\stack[0][0]~q\)))) # (!stack_ptr(0) & (stack_ptr(1) & (\stack[1][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stack_ptr(0),
	datab => stack_ptr(1),
	datac => \stack[1][0]~q\,
	datad => \stack[0][0]~q\,
	combout => \data_out~1_combout\);

-- Location: LCCOMB_X112_Y15_N8
\stack[2][0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[2][0]~2_combout\ = (\push~input_o\ & (!stack_ptr(0) & stack_ptr(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \push~input_o\,
	datac => stack_ptr(0),
	datad => stack_ptr(1),
	combout => \stack[2][0]~2_combout\);

-- Location: FF_X111_Y15_N23
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
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][0]~q\);

-- Location: LCCOMB_X111_Y15_N24
\data_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~2_combout\ = (stack_ptr(0) & stack_ptr(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => stack_ptr(0),
	datad => stack_ptr(1),
	combout => \data_out~2_combout\);

-- Location: LCCOMB_X111_Y15_N22
\data_out~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~3_combout\ = (\data_out~0_combout\ & ((\data_out~1_combout\) # ((\stack[2][0]~q\ & \data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => \data_out~1_combout\,
	datac => \stack[2][0]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~3_combout\);

-- Location: IOIBUF_X115_Y14_N1
\data_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: LCCOMB_X112_Y15_N16
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

-- Location: FF_X112_Y15_N17
\stack[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][1]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][1]~q\);

-- Location: FF_X111_Y15_N11
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
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][1]~q\);

-- Location: LCCOMB_X111_Y15_N10
\data_out~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~4_combout\ = (stack_ptr(0) & (\stack[0][1]~q\ & ((!stack_ptr(1))))) # (!stack_ptr(0) & (((\stack[1][1]~q\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][1]~q\,
	datab => stack_ptr(0),
	datac => \stack[1][1]~q\,
	datad => stack_ptr(1),
	combout => \data_out~4_combout\);

-- Location: FF_X111_Y15_N5
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
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][1]~q\);

-- Location: LCCOMB_X111_Y15_N4
\data_out~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~5_combout\ = (\data_out~0_combout\ & ((\data_out~4_combout\) # ((\data_out~2_combout\ & \stack[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~4_combout\,
	datab => \data_out~2_combout\,
	datac => \stack[2][1]~q\,
	datad => \data_out~0_combout\,
	combout => \data_out~5_combout\);

-- Location: IOIBUF_X115_Y15_N8
\data_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: FF_X111_Y15_N25
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
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][2]~q\);

-- Location: LCCOMB_X112_Y15_N26
\stack[0][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \stack[0][2]~feeder_combout\);

-- Location: FF_X112_Y15_N27
\stack[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][2]~q\);

-- Location: LCCOMB_X112_Y15_N28
\data_out~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~6_combout\ = (stack_ptr(1) & (\stack[1][2]~q\ & ((!stack_ptr(0))))) # (!stack_ptr(1) & (((\stack[0][2]~q\ & stack_ptr(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stack_ptr(1),
	datab => \stack[1][2]~q\,
	datac => \stack[0][2]~q\,
	datad => stack_ptr(0),
	combout => \data_out~6_combout\);

-- Location: FF_X111_Y15_N19
\stack[2][2]\ : dffeas
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
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][2]~q\);

-- Location: LCCOMB_X111_Y15_N18
\data_out~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~7_combout\ = (\data_out~0_combout\ & ((\data_out~6_combout\) # ((\stack[2][2]~q\ & \data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => \data_out~6_combout\,
	datac => \stack[2][2]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~7_combout\);

-- Location: IOIBUF_X115_Y13_N8
\data_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: LCCOMB_X112_Y15_N14
\stack[0][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \stack[0][3]~feeder_combout\);

-- Location: FF_X112_Y15_N15
\stack[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][3]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][3]~q\);

-- Location: FF_X111_Y15_N9
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
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][3]~q\);

-- Location: LCCOMB_X111_Y15_N8
\data_out~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~8_combout\ = (stack_ptr(0) & (\stack[0][3]~q\ & ((!stack_ptr(1))))) # (!stack_ptr(0) & (((\stack[1][3]~q\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][3]~q\,
	datab => stack_ptr(0),
	datac => \stack[1][3]~q\,
	datad => stack_ptr(1),
	combout => \data_out~8_combout\);

-- Location: FF_X111_Y15_N3
\stack[2][3]\ : dffeas
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
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][3]~q\);

-- Location: LCCOMB_X111_Y15_N2
\data_out~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~9_combout\ = (\data_out~0_combout\ & ((\data_out~8_combout\) # ((\stack[2][3]~q\ & \data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => \data_out~8_combout\,
	datac => \stack[2][3]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~9_combout\);

-- Location: IOIBUF_X115_Y18_N8
\data_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: LCCOMB_X112_Y15_N4
\stack[0][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][4]~feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \stack[0][4]~feeder_combout\);

-- Location: FF_X112_Y15_N5
\stack[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][4]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][4]~q\);

-- Location: FF_X111_Y15_N17
\stack[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][4]~q\);

-- Location: LCCOMB_X111_Y15_N16
\data_out~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~10_combout\ = (stack_ptr(0) & (\stack[0][4]~q\ & ((!stack_ptr(1))))) # (!stack_ptr(0) & (((\stack[1][4]~q\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][4]~q\,
	datab => stack_ptr(0),
	datac => \stack[1][4]~q\,
	datad => stack_ptr(1),
	combout => \data_out~10_combout\);

-- Location: FF_X111_Y15_N15
\stack[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][4]~q\);

-- Location: LCCOMB_X111_Y15_N14
\data_out~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~11_combout\ = (\data_out~0_combout\ & ((\data_out~10_combout\) # ((\stack[2][4]~q\ & \data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => \data_out~10_combout\,
	datac => \stack[2][4]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~11_combout\);

-- Location: IOIBUF_X115_Y11_N8
\data_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: LCCOMB_X112_Y15_N6
\stack[0][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][5]~feeder_combout\ = \data_in[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[5]~input_o\,
	combout => \stack[0][5]~feeder_combout\);

-- Location: FF_X112_Y15_N7
\stack[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][5]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][5]~q\);

-- Location: FF_X111_Y15_N21
\stack[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][5]~q\);

-- Location: LCCOMB_X111_Y15_N20
\data_out~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~12_combout\ = (stack_ptr(0) & (\stack[0][5]~q\ & ((!stack_ptr(1))))) # (!stack_ptr(0) & (((\stack[1][5]~q\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][5]~q\,
	datab => stack_ptr(0),
	datac => \stack[1][5]~q\,
	datad => stack_ptr(1),
	combout => \data_out~12_combout\);

-- Location: FF_X111_Y15_N7
\stack[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][5]~q\);

-- Location: LCCOMB_X111_Y15_N6
\data_out~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~13_combout\ = (\data_out~0_combout\ & ((\data_out~12_combout\) # ((\stack[2][5]~q\ & \data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => \data_out~12_combout\,
	datac => \stack[2][5]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~13_combout\);

-- Location: IOIBUF_X115_Y10_N1
\data_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: FF_X112_Y15_N21
\stack[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][6]~q\);

-- Location: FF_X111_Y15_N29
\stack[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][6]~q\);

-- Location: LCCOMB_X111_Y15_N28
\data_out~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~14_combout\ = (stack_ptr(0) & (\stack[0][6]~q\ & ((!stack_ptr(1))))) # (!stack_ptr(0) & (((\stack[1][6]~q\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][6]~q\,
	datab => stack_ptr(0),
	datac => \stack[1][6]~q\,
	datad => stack_ptr(1),
	combout => \data_out~14_combout\);

-- Location: FF_X111_Y15_N27
\stack[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][6]~q\);

-- Location: LCCOMB_X111_Y15_N26
\data_out~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~15_combout\ = (\data_out~0_combout\ & ((\data_out~14_combout\) # ((\stack[2][6]~q\ & \data_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~0_combout\,
	datab => \data_out~14_combout\,
	datac => \stack[2][6]~q\,
	datad => \data_out~2_combout\,
	combout => \data_out~15_combout\);

-- Location: IOIBUF_X115_Y15_N1
\data_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: LCCOMB_X112_Y15_N30
\stack[0][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack[0][7]~feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \stack[0][7]~feeder_combout\);

-- Location: FF_X112_Y15_N31
\stack[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack[0][7]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \stack[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[0][7]~q\);

-- Location: FF_X111_Y15_N13
\stack[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[1][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[1][7]~q\);

-- Location: LCCOMB_X111_Y15_N12
\data_out~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~16_combout\ = (stack_ptr(0) & (\stack[0][7]~q\ & ((!stack_ptr(1))))) # (!stack_ptr(0) & (((\stack[1][7]~q\ & stack_ptr(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack[0][7]~q\,
	datab => stack_ptr(0),
	datac => \stack[1][7]~q\,
	datad => stack_ptr(1),
	combout => \data_out~16_combout\);

-- Location: FF_X111_Y15_N31
\stack[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	ena => \stack[2][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack[2][7]~q\);

-- Location: LCCOMB_X111_Y15_N30
\data_out~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_out~17_combout\ = (\data_out~0_combout\ & ((\data_out~16_combout\) # ((\data_out~2_combout\ & \stack[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_out~16_combout\,
	datab => \data_out~2_combout\,
	datac => \stack[2][7]~q\,
	datad => \data_out~0_combout\,
	combout => \data_out~17_combout\);

-- Location: LCCOMB_X112_Y15_N0
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (stack_ptr(1)) # (stack_ptr(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => stack_ptr(1),
	datad => stack_ptr(0),
	combout => \LessThan0~0_combout\);

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_data_out(4) <= \data_out[4]~output_o\;

ww_data_out(5) <= \data_out[5]~output_o\;

ww_data_out(6) <= \data_out[6]~output_o\;

ww_data_out(7) <= \data_out[7]~output_o\;

ww_empty <= \empty~output_o\;

ww_full <= \full~output_o\;
END structure;


