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

-- DATE "04/15/2025 16:39:16"

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

ENTITY 	cla_4bit IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	cin : IN std_logic;
	sum : BUFFER std_logic_vector(3 DOWNTO 0);
	cout : BUFFER std_logic
	);
END cla_4bit;

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


ARCHITECTURE structure OF cla_4bit IS
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
SIGNAL \GEN_PFA:0:PFA_X|s~0_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \GEN_PFA:1:PFA_X|s~0_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \GEN_PFA:1:PFA_X|s~combout\ : std_logic;
SIGNAL \CLA|c[1]~1_combout\ : std_logic;
SIGNAL \CLA|c[1]~2_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \CLA|c~0_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \GEN_PFA:2:PFA_X|s~combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \CLA|c~3_combout\ : std_logic;
SIGNAL \CLA|c[2]~4_combout\ : std_logic;
SIGNAL \CLA|c[2]~5_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \GEN_PFA:3:PFA_X|s~combout\ : std_logic;
SIGNAL \CLA|c[3]~6_combout\ : std_logic;
SIGNAL \CLA|c[3]~7_combout\ : std_logic;
SIGNAL \CLA|c[3]~8_combout\ : std_logic;

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
	i => \GEN_PFA:0:PFA_X|s~0_combout\,
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
	i => \GEN_PFA:1:PFA_X|s~combout\,
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
	i => \GEN_PFA:2:PFA_X|s~combout\,
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
	i => \GEN_PFA:3:PFA_X|s~combout\,
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
	i => \CLA|c[3]~8_combout\,
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
\GEN_PFA:0:PFA_X|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_PFA:0:PFA_X|s~0_combout\ = \cin~input_o\ $ (\b[0]~input_o\ $ (\a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \b[0]~input_o\,
	datad => \a[0]~input_o\,
	combout => \GEN_PFA:0:PFA_X|s~0_combout\);

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

-- Location: LCCOMB_X114_Y15_N18
\GEN_PFA:1:PFA_X|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_PFA:1:PFA_X|s~0_combout\ = \a[1]~input_o\ $ (((\b[0]~input_o\ & ((\cin~input_o\) # (\a[0]~input_o\))) # (!\b[0]~input_o\ & (\cin~input_o\ & \a[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[0]~input_o\,
	datac => \cin~input_o\,
	datad => \a[0]~input_o\,
	combout => \GEN_PFA:1:PFA_X|s~0_combout\);

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

-- Location: LCCOMB_X114_Y15_N12
\GEN_PFA:1:PFA_X|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_PFA:1:PFA_X|s~combout\ = \GEN_PFA:1:PFA_X|s~0_combout\ $ (\b[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \GEN_PFA:1:PFA_X|s~0_combout\,
	datac => \b[1]~input_o\,
	combout => \GEN_PFA:1:PFA_X|s~combout\);

-- Location: LCCOMB_X114_Y15_N16
\CLA|c[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[1]~1_combout\ = (\b[1]~input_o\) # (\a[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b[1]~input_o\,
	datad => \a[1]~input_o\,
	combout => \CLA|c[1]~1_combout\);

-- Location: LCCOMB_X114_Y15_N10
\CLA|c[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[1]~2_combout\ = (\cin~input_o\ & (\CLA|c[1]~1_combout\ & ((\b[0]~input_o\) # (\a[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \b[0]~input_o\,
	datac => \CLA|c[1]~1_combout\,
	datad => \a[0]~input_o\,
	combout => \CLA|c[1]~2_combout\);

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

-- Location: LCCOMB_X114_Y15_N22
\CLA|c~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c~0_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\) # ((\b[0]~input_o\ & \a[0]~input_o\)))) # (!\a[1]~input_o\ & (\b[0]~input_o\ & (\b[1]~input_o\ & \a[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \a[0]~input_o\,
	combout => \CLA|c~0_combout\);

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

-- Location: LCCOMB_X114_Y15_N20
\GEN_PFA:2:PFA_X|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_PFA:2:PFA_X|s~combout\ = \b[2]~input_o\ $ (\a[2]~input_o\ $ (((\CLA|c[1]~2_combout\) # (\CLA|c~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLA|c[1]~2_combout\,
	datab => \b[2]~input_o\,
	datac => \CLA|c~0_combout\,
	datad => \a[2]~input_o\,
	combout => \GEN_PFA:2:PFA_X|s~combout\);

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

-- Location: LCCOMB_X114_Y15_N6
\CLA|c~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c~3_combout\ = (\b[2]~input_o\ & ((\a[2]~input_o\) # ((\a[1]~input_o\ & \b[1]~input_o\)))) # (!\b[2]~input_o\ & (\a[1]~input_o\ & (\b[1]~input_o\ & \a[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \CLA|c~3_combout\);

-- Location: LCCOMB_X114_Y15_N24
\CLA|c[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[2]~4_combout\ = (\CLA|c[1]~1_combout\ & ((\cin~input_o\ & ((\b[0]~input_o\) # (\a[0]~input_o\))) # (!\cin~input_o\ & (\b[0]~input_o\ & \a[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \b[0]~input_o\,
	datac => \CLA|c[1]~1_combout\,
	datad => \a[0]~input_o\,
	combout => \CLA|c[2]~4_combout\);

-- Location: LCCOMB_X114_Y15_N2
\CLA|c[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[2]~5_combout\ = (\CLA|c~3_combout\) # ((\CLA|c[2]~4_combout\ & ((\b[2]~input_o\) # (\a[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLA|c~3_combout\,
	datab => \CLA|c[2]~4_combout\,
	datac => \b[2]~input_o\,
	datad => \a[2]~input_o\,
	combout => \CLA|c[2]~5_combout\);

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
\GEN_PFA:3:PFA_X|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \GEN_PFA:3:PFA_X|s~combout\ = \b[3]~input_o\ $ (\CLA|c[2]~5_combout\ $ (\a[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \CLA|c[2]~5_combout\,
	datac => \a[3]~input_o\,
	combout => \GEN_PFA:3:PFA_X|s~combout\);

-- Location: LCCOMB_X114_Y15_N30
\CLA|c[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[3]~6_combout\ = (\CLA|c[2]~4_combout\) # ((\b[1]~input_o\ & \a[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLA|c[2]~4_combout\,
	datac => \b[1]~input_o\,
	datad => \a[1]~input_o\,
	combout => \CLA|c[3]~6_combout\);

-- Location: LCCOMB_X114_Y15_N0
\CLA|c[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[3]~7_combout\ = (\b[2]~input_o\ & ((\CLA|c[3]~6_combout\) # (\a[2]~input_o\))) # (!\b[2]~input_o\ & (\CLA|c[3]~6_combout\ & \a[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[2]~input_o\,
	datac => \CLA|c[3]~6_combout\,
	datad => \a[2]~input_o\,
	combout => \CLA|c[3]~7_combout\);

-- Location: LCCOMB_X114_Y15_N26
\CLA|c[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLA|c[3]~8_combout\ = (\b[3]~input_o\ & ((\CLA|c[3]~7_combout\) # (\a[3]~input_o\))) # (!\b[3]~input_o\ & (\CLA|c[3]~7_combout\ & \a[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \CLA|c[3]~7_combout\,
	datac => \a[3]~input_o\,
	combout => \CLA|c[3]~8_combout\);

ww_sum(0) <= \sum[0]~output_o\;

ww_sum(1) <= \sum[1]~output_o\;

ww_sum(2) <= \sum[2]~output_o\;

ww_sum(3) <= \sum[3]~output_o\;

ww_cout <= \cout~output_o\;
END structure;


