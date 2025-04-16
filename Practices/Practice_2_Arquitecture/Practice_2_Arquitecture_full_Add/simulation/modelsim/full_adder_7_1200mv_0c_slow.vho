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

-- DATE "04/15/2025 21:59:21"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	full_adder_4bit IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	cin : IN std_logic;
	sum : BUFFER std_logic_vector(3 DOWNTO 0);
	cout : BUFFER std_logic
	);
END full_adder_4bit;

-- Design Ports Information
-- sum[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF full_adder_4bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_sum : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL \sum[0]~output_o\ : std_logic;
SIGNAL \sum[1]~output_o\ : std_logic;
SIGNAL \sum[2]~output_o\ : std_logic;
SIGNAL \sum[3]~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \GEN_FULL_ADDER:0:FA|sum~0_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \GEN_FULL_ADDER:0:FA|cout~0_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \GEN_FULL_ADDER:1:FA|sum~combout\ : std_logic;
SIGNAL \GEN_FULL_ADDER:1:FA|cout~0_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \GEN_FULL_ADDER:2:FA|sum~combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \GEN_FULL_ADDER:2:FA|cout~0_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \GEN_FULL_ADDER:3:FA|sum~combout\ : std_logic;
SIGNAL \GEN_FULL_ADDER:3:FA|cout~0_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
sum <= ww_sum;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X69_Y73_N16
\sum[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_FULL_ADDER:0:FA|sum~0_combout\,
	devoe => ww_devoe,
	o => \sum[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\sum[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_FULL_ADDER:1:FA|sum~combout\,
	devoe => ww_devoe,
	o => \sum[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\sum[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_FULL_ADDER:2:FA|sum~combout\,
	devoe => ww_devoe,
	o => \sum[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\sum[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_FULL_ADDER:3:FA|sum~combout\,
	devoe => ww_devoe,
	o => \sum[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\cout~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \GEN_FULL_ADDER:3:FA|cout~0_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

-- Location: IOIBUF_X115_Y4_N22
\cin~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\b[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\a[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: LCCOMB_X114_Y15_N8
\GEN_FULL_ADDER:0:FA|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:0:FA|sum~0_combout\ = \cin~input_o\ $ (\b[0]~input_o\ $ (\a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \b[0]~input_o\,
	datac => \a[0]~input_o\,
	combout => \GEN_FULL_ADDER:0:FA|sum~0_combout\);

-- Location: IOIBUF_X115_Y10_N1
\b[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X114_Y15_N26
\GEN_FULL_ADDER:0:FA|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:0:FA|cout~0_combout\ = (\cin~input_o\ & ((\b[0]~input_o\) # (\a[0]~input_o\))) # (!\cin~input_o\ & (\b[0]~input_o\ & \a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \b[0]~input_o\,
	datac => \a[0]~input_o\,
	combout => \GEN_FULL_ADDER:0:FA|cout~0_combout\);

-- Location: IOIBUF_X115_Y14_N1
\a[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X114_Y15_N12
\GEN_FULL_ADDER:1:FA|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:1:FA|sum~combout\ = \b[1]~input_o\ $ (\GEN_FULL_ADDER:0:FA|cout~0_combout\ $ (\a[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[1]~input_o\,
	datac => \GEN_FULL_ADDER:0:FA|cout~0_combout\,
	datad => \a[1]~input_o\,
	combout => \GEN_FULL_ADDER:1:FA|sum~combout\);

-- Location: LCCOMB_X114_Y15_N6
\GEN_FULL_ADDER:1:FA|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:1:FA|cout~0_combout\ = (\b[1]~input_o\ & ((\GEN_FULL_ADDER:0:FA|cout~0_combout\) # (\a[1]~input_o\))) # (!\b[1]~input_o\ & (\GEN_FULL_ADDER:0:FA|cout~0_combout\ & \a[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[1]~input_o\,
	datac => \GEN_FULL_ADDER:0:FA|cout~0_combout\,
	datad => \a[1]~input_o\,
	combout => \GEN_FULL_ADDER:1:FA|cout~0_combout\);

-- Location: IOIBUF_X115_Y11_N8
\b[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\a[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X114_Y15_N24
\GEN_FULL_ADDER:2:FA|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:2:FA|sum~combout\ = \GEN_FULL_ADDER:1:FA|cout~0_combout\ $ (\b[2]~input_o\ $ (\a[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_FULL_ADDER:1:FA|cout~0_combout\,
	datac => \b[2]~input_o\,
	datad => \a[2]~input_o\,
	combout => \GEN_FULL_ADDER:2:FA|sum~combout\);

-- Location: IOIBUF_X115_Y16_N8
\b[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X114_Y15_N2
\GEN_FULL_ADDER:2:FA|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:2:FA|cout~0_combout\ = (\GEN_FULL_ADDER:1:FA|cout~0_combout\ & ((\b[2]~input_o\) # (\a[2]~input_o\))) # (!\GEN_FULL_ADDER:1:FA|cout~0_combout\ & (\b[2]~input_o\ & \a[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GEN_FULL_ADDER:1:FA|cout~0_combout\,
	datac => \b[2]~input_o\,
	datad => \a[2]~input_o\,
	combout => \GEN_FULL_ADDER:2:FA|cout~0_combout\);

-- Location: IOIBUF_X115_Y13_N8
\a[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X114_Y15_N28
\GEN_FULL_ADDER:3:FA|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:3:FA|sum~combout\ = \b[3]~input_o\ $ (\GEN_FULL_ADDER:2:FA|cout~0_combout\ $ (\a[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \GEN_FULL_ADDER:2:FA|cout~0_combout\,
	datac => \a[3]~input_o\,
	combout => \GEN_FULL_ADDER:3:FA|sum~combout\);

-- Location: LCCOMB_X114_Y15_N30
\GEN_FULL_ADDER:3:FA|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_FULL_ADDER:3:FA|cout~0_combout\ = (\b[3]~input_o\ & ((\GEN_FULL_ADDER:2:FA|cout~0_combout\) # (\a[3]~input_o\))) # (!\b[3]~input_o\ & (\GEN_FULL_ADDER:2:FA|cout~0_combout\ & \a[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \GEN_FULL_ADDER:2:FA|cout~0_combout\,
	datac => \a[3]~input_o\,
	combout => \GEN_FULL_ADDER:3:FA|cout~0_combout\);

ww_sum(0) <= \sum[0]~output_o\;

ww_sum(1) <= \sum[1]~output_o\;

ww_sum(2) <= \sum[2]~output_o\;

ww_sum(3) <= \sum[3]~output_o\;

ww_cout <= \cout~output_o\;
END structure;


