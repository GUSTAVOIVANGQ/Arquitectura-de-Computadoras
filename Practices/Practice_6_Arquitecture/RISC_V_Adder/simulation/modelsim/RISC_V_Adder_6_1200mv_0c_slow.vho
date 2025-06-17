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

-- DATE "06/17/2025 12:47:45"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
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

ENTITY 	RISC_V_Adder IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	opcode : IN std_logic_vector(6 DOWNTO 0);
	rs1 : IN std_logic_vector(1 DOWNTO 0);
	rs2 : IN std_logic_vector(1 DOWNTO 0);
	rd : IN std_logic_vector(1 DOWNTO 0);
	immediate : IN std_logic_vector(1 DOWNTO 0);
	result : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END RISC_V_Adder;

-- Design Ports Information
-- result[0]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[1]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs1[1]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs1[0]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[0]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs2[1]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs2[0]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[0]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[1]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[4]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[5]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[2]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[3]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[6]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[1]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[1]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd[0]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RISC_V_Adder IS
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
SIGNAL ww_opcode : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_rs1 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_rs2 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_rd : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_immediate : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_result : std_logic_vector(1 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \result[0]~output_o\ : std_logic;
SIGNAL \result[1]~output_o\ : std_logic;
SIGNAL \opcode[2]~input_o\ : std_logic;
SIGNAL \opcode[5]~input_o\ : std_logic;
SIGNAL \opcode[4]~input_o\ : std_logic;
SIGNAL \opcode[6]~input_o\ : std_logic;
SIGNAL \opcode[3]~input_o\ : std_logic;
SIGNAL \ALU|Mux1~0_combout\ : std_logic;
SIGNAL \opcode[1]~input_o\ : std_logic;
SIGNAL \opcode[0]~input_o\ : std_logic;
SIGNAL \ALU|Mux1~1_combout\ : std_logic;
SIGNAL \CU|Mux1~0_combout\ : std_logic;
SIGNAL \CU|Mux1~1_combout\ : std_logic;
SIGNAL \immediate[0]~input_o\ : std_logic;
SIGNAL \rs2[1]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \RF|registers[2][0]~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \CU|Mux0~0_combout\ : std_logic;
SIGNAL \CU|Mux0~1_combout\ : std_logic;
SIGNAL \CU|Mux0~2_combout\ : std_logic;
SIGNAL \rd[1]~input_o\ : std_logic;
SIGNAL \rd[0]~input_o\ : std_logic;
SIGNAL \RF|Decoder0~0_combout\ : std_logic;
SIGNAL \RF|registers[2][0]~q\ : std_logic;
SIGNAL \RF|registers[3][0]~feeder_combout\ : std_logic;
SIGNAL \RF|Decoder0~3_combout\ : std_logic;
SIGNAL \RF|registers[3][0]~q\ : std_logic;
SIGNAL \rs2[0]~input_o\ : std_logic;
SIGNAL \RF|Decoder0~2_combout\ : std_logic;
SIGNAL \RF|registers[0][0]~q\ : std_logic;
SIGNAL \RF|Decoder0~1_combout\ : std_logic;
SIGNAL \RF|registers[1][0]~q\ : std_logic;
SIGNAL \MuxALU|output[0]~0_combout\ : std_logic;
SIGNAL \MuxALU|output[0]~1_combout\ : std_logic;
SIGNAL \MuxALU|output[0]~2_combout\ : std_logic;
SIGNAL \rs1[1]~input_o\ : std_logic;
SIGNAL \rs1[0]~input_o\ : std_logic;
SIGNAL \RF|Mux1~0_combout\ : std_logic;
SIGNAL \RF|Mux1~1_combout\ : std_logic;
SIGNAL \ALU|Mux1~2_combout\ : std_logic;
SIGNAL \immediate[1]~input_o\ : std_logic;
SIGNAL \RF|registers[3][1]~q\ : std_logic;
SIGNAL \RF|registers[1][1]~q\ : std_logic;
SIGNAL \RF|registers[2][1]~q\ : std_logic;
SIGNAL \RF|registers[0][1]~q\ : std_logic;
SIGNAL \MuxALU|output[1]~3_combout\ : std_logic;
SIGNAL \MuxALU|output[1]~4_combout\ : std_logic;
SIGNAL \RF|Mux0~0_combout\ : std_logic;
SIGNAL \RF|Mux0~1_combout\ : std_logic;
SIGNAL \ALU|Add0~0_combout\ : std_logic;
SIGNAL \ALU|Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_opcode <= opcode;
ww_rs1 <= rs1;
ww_rs2 <= rs2;
ww_rd <= rd;
ww_immediate <= immediate;
result <= ww_result;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: IOOBUF_X7_Y0_N2
\result[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU|Mux1~2_combout\,
	devoe => ww_devoe,
	o => \result[0]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\result[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \result[1]~output_o\);

-- Location: IOIBUF_X18_Y0_N15
\opcode[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(2),
	o => \opcode[2]~input_o\);

-- Location: IOIBUF_X28_Y0_N22
\opcode[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(5),
	o => \opcode[5]~input_o\);

-- Location: IOIBUF_X18_Y0_N22
\opcode[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(4),
	o => \opcode[4]~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\opcode[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(6),
	o => \opcode[6]~input_o\);

-- Location: IOIBUF_X23_Y0_N8
\opcode[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(3),
	o => \opcode[3]~input_o\);

-- Location: LCCOMB_X14_Y1_N28
\ALU|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU|Mux1~0_combout\ = (!\opcode[3]~input_o\ & ((\opcode[4]~input_o\ & ((!\opcode[6]~input_o\))) # (!\opcode[4]~input_o\ & (\opcode[5]~input_o\ & \opcode[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[5]~input_o\,
	datab => \opcode[4]~input_o\,
	datac => \opcode[6]~input_o\,
	datad => \opcode[3]~input_o\,
	combout => \ALU|Mux1~0_combout\);

-- Location: IOIBUF_X23_Y0_N15
\opcode[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(1),
	o => \opcode[1]~input_o\);

-- Location: IOIBUF_X21_Y0_N8
\opcode[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(0),
	o => \opcode[0]~input_o\);

-- Location: LCCOMB_X14_Y1_N30
\ALU|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU|Mux1~1_combout\ = (!\opcode[2]~input_o\ & (\ALU|Mux1~0_combout\ & (\opcode[1]~input_o\ & \opcode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \ALU|Mux1~0_combout\,
	datac => \opcode[1]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \ALU|Mux1~1_combout\);

-- Location: LCCOMB_X14_Y1_N16
\CU|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CU|Mux1~0_combout\ = (\opcode[1]~input_o\ & (\opcode[0]~input_o\ & ((!\opcode[4]~input_o\) # (!\opcode[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[5]~input_o\,
	datab => \opcode[4]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \CU|Mux1~0_combout\);

-- Location: LCCOMB_X14_Y1_N14
\CU|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CU|Mux1~1_combout\ = (!\opcode[2]~input_o\ & (\CU|Mux1~0_combout\ & (!\opcode[6]~input_o\ & !\opcode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \CU|Mux1~0_combout\,
	datac => \opcode[6]~input_o\,
	datad => \opcode[3]~input_o\,
	combout => \CU|Mux1~1_combout\);

-- Location: IOIBUF_X5_Y0_N15
\immediate[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(0),
	o => \immediate[0]~input_o\);

-- Location: IOIBUF_X13_Y0_N1
\rs2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs2(1),
	o => \rs2[1]~input_o\);

-- Location: IOIBUF_X0_Y11_N8
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

-- Location: LCCOMB_X13_Y1_N20
\RF|registers[2][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|registers[2][0]~feeder_combout\ = \ALU|Mux1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALU|Mux1~2_combout\,
	combout => \RF|registers[2][0]~feeder_combout\);

-- Location: IOIBUF_X0_Y11_N15
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

-- Location: LCCOMB_X14_Y1_N26
\CU|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CU|Mux0~0_combout\ = (\opcode[5]~input_o\ & !\opcode[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[5]~input_o\,
	datab => \opcode[4]~input_o\,
	combout => \CU|Mux0~0_combout\);

-- Location: LCCOMB_X14_Y1_N12
\CU|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CU|Mux0~1_combout\ = (\opcode[2]~input_o\ & (((!\opcode[3]~input_o\) # (!\opcode[6]~input_o\)) # (!\CU|Mux0~0_combout\))) # (!\opcode[2]~input_o\ & ((\CU|Mux0~0_combout\) # ((\opcode[6]~input_o\) # (\opcode[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \CU|Mux0~0_combout\,
	datac => \opcode[6]~input_o\,
	datad => \opcode[3]~input_o\,
	combout => \CU|Mux0~1_combout\);

-- Location: LCCOMB_X14_Y1_N20
\CU|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CU|Mux0~2_combout\ = (!\CU|Mux0~1_combout\ & (\opcode[1]~input_o\ & \opcode[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux0~1_combout\,
	datab => \opcode[1]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \CU|Mux0~2_combout\);

-- Location: IOIBUF_X13_Y0_N15
\rd[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd(1),
	o => \rd[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\rd[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd(0),
	o => \rd[0]~input_o\);

-- Location: LCCOMB_X13_Y1_N28
\RF|Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Decoder0~0_combout\ = (\CU|Mux0~2_combout\ & (\rd[1]~input_o\ & !\rd[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux0~2_combout\,
	datab => \rd[1]~input_o\,
	datad => \rd[0]~input_o\,
	combout => \RF|Decoder0~0_combout\);

-- Location: FF_X13_Y1_N21
\RF|registers[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RF|registers[2][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \RF|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[2][0]~q\);

-- Location: LCCOMB_X13_Y1_N14
\RF|registers[3][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|registers[3][0]~feeder_combout\ = \ALU|Mux1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALU|Mux1~2_combout\,
	combout => \RF|registers[3][0]~feeder_combout\);

-- Location: LCCOMB_X13_Y1_N16
\RF|Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Decoder0~3_combout\ = (\CU|Mux0~2_combout\ & (\rd[1]~input_o\ & \rd[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux0~2_combout\,
	datab => \rd[1]~input_o\,
	datad => \rd[0]~input_o\,
	combout => \RF|Decoder0~3_combout\);

-- Location: FF_X13_Y1_N15
\RF|registers[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \RF|registers[3][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \RF|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[3][0]~q\);

-- Location: IOIBUF_X16_Y0_N8
\rs2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs2(0),
	o => \rs2[0]~input_o\);

-- Location: LCCOMB_X14_Y1_N22
\RF|Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Decoder0~2_combout\ = (\CU|Mux0~2_combout\ & (!\rd[1]~input_o\ & !\rd[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux0~2_combout\,
	datab => \rd[1]~input_o\,
	datad => \rd[0]~input_o\,
	combout => \RF|Decoder0~2_combout\);

-- Location: FF_X14_Y1_N23
\RF|registers[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ALU|Mux1~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \RF|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[0][0]~q\);

-- Location: LCCOMB_X14_Y1_N0
\RF|Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Decoder0~1_combout\ = (\CU|Mux0~2_combout\ & (!\rd[1]~input_o\ & \rd[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux0~2_combout\,
	datab => \rd[1]~input_o\,
	datad => \rd[0]~input_o\,
	combout => \RF|Decoder0~1_combout\);

-- Location: FF_X14_Y1_N21
\RF|registers[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ALU|Mux1~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \RF|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[1][0]~q\);

-- Location: LCCOMB_X14_Y1_N18
\MuxALU|output[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxALU|output[0]~0_combout\ = (\rs2[0]~input_o\ & ((\rs2[1]~input_o\) # ((\RF|registers[1][0]~q\)))) # (!\rs2[0]~input_o\ & (!\rs2[1]~input_o\ & (\RF|registers[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs2[0]~input_o\,
	datab => \rs2[1]~input_o\,
	datac => \RF|registers[0][0]~q\,
	datad => \RF|registers[1][0]~q\,
	combout => \MuxALU|output[0]~0_combout\);

-- Location: LCCOMB_X13_Y1_N18
\MuxALU|output[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxALU|output[0]~1_combout\ = (\rs2[1]~input_o\ & ((\MuxALU|output[0]~0_combout\ & ((\RF|registers[3][0]~q\))) # (!\MuxALU|output[0]~0_combout\ & (\RF|registers[2][0]~q\)))) # (!\rs2[1]~input_o\ & (((\MuxALU|output[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs2[1]~input_o\,
	datab => \RF|registers[2][0]~q\,
	datac => \RF|registers[3][0]~q\,
	datad => \MuxALU|output[0]~0_combout\,
	combout => \MuxALU|output[0]~1_combout\);

-- Location: LCCOMB_X13_Y1_N4
\MuxALU|output[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxALU|output[0]~2_combout\ = (\CU|Mux1~1_combout\ & (\immediate[0]~input_o\)) # (!\CU|Mux1~1_combout\ & ((\MuxALU|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux1~1_combout\,
	datac => \immediate[0]~input_o\,
	datad => \MuxALU|output[0]~1_combout\,
	combout => \MuxALU|output[0]~2_combout\);

-- Location: IOIBUF_X16_Y0_N22
\rs1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs1(1),
	o => \rs1[1]~input_o\);

-- Location: IOIBUF_X25_Y0_N1
\rs1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs1(0),
	o => \rs1[0]~input_o\);

-- Location: LCCOMB_X14_Y1_N4
\RF|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Mux1~0_combout\ = (\rs1[0]~input_o\ & ((\rs1[1]~input_o\) # ((\RF|registers[1][0]~q\)))) # (!\rs1[0]~input_o\ & (!\rs1[1]~input_o\ & (\RF|registers[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs1[0]~input_o\,
	datab => \rs1[1]~input_o\,
	datac => \RF|registers[0][0]~q\,
	datad => \RF|registers[1][0]~q\,
	combout => \RF|Mux1~0_combout\);

-- Location: LCCOMB_X13_Y1_N8
\RF|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Mux1~1_combout\ = (\rs1[1]~input_o\ & ((\RF|Mux1~0_combout\ & ((\RF|registers[3][0]~q\))) # (!\RF|Mux1~0_combout\ & (\RF|registers[2][0]~q\)))) # (!\rs1[1]~input_o\ & (((\RF|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs1[1]~input_o\,
	datab => \RF|registers[2][0]~q\,
	datac => \RF|registers[3][0]~q\,
	datad => \RF|Mux1~0_combout\,
	combout => \RF|Mux1~1_combout\);

-- Location: LCCOMB_X13_Y1_N26
\ALU|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU|Mux1~2_combout\ = (!\ALU|Mux1~1_combout\ & (\MuxALU|output[0]~2_combout\ $ (\RF|Mux1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU|Mux1~1_combout\,
	datac => \MuxALU|output[0]~2_combout\,
	datad => \RF|Mux1~1_combout\,
	combout => \ALU|Mux1~2_combout\);

-- Location: IOIBUF_X5_Y0_N22
\immediate[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(1),
	o => \immediate[1]~input_o\);

-- Location: FF_X13_Y1_N17
\RF|registers[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ALU|Mux0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \RF|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[3][1]~q\);

-- Location: FF_X14_Y1_N1
\RF|registers[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ALU|Mux0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \RF|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[1][1]~q\);

-- Location: FF_X13_Y1_N29
\RF|registers[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ALU|Mux0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \RF|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[2][1]~q\);

-- Location: FF_X14_Y1_N27
\RF|registers[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ALU|Mux0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \RF|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RF|registers[0][1]~q\);

-- Location: LCCOMB_X13_Y1_N2
\MuxALU|output[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxALU|output[1]~3_combout\ = (\rs2[0]~input_o\ & (((\rs2[1]~input_o\)))) # (!\rs2[0]~input_o\ & ((\rs2[1]~input_o\ & (\RF|registers[2][1]~q\)) # (!\rs2[1]~input_o\ & ((\RF|registers[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs2[0]~input_o\,
	datab => \RF|registers[2][1]~q\,
	datac => \rs2[1]~input_o\,
	datad => \RF|registers[0][1]~q\,
	combout => \MuxALU|output[1]~3_combout\);

-- Location: LCCOMB_X13_Y1_N22
\MuxALU|output[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxALU|output[1]~4_combout\ = (\rs2[0]~input_o\ & ((\MuxALU|output[1]~3_combout\ & (\RF|registers[3][1]~q\)) # (!\MuxALU|output[1]~3_combout\ & ((\RF|registers[1][1]~q\))))) # (!\rs2[0]~input_o\ & (((\MuxALU|output[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs2[0]~input_o\,
	datab => \RF|registers[3][1]~q\,
	datac => \RF|registers[1][1]~q\,
	datad => \MuxALU|output[1]~3_combout\,
	combout => \MuxALU|output[1]~4_combout\);

-- Location: LCCOMB_X14_Y1_N24
\RF|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Mux0~0_combout\ = (\rs1[0]~input_o\ & (\rs1[1]~input_o\)) # (!\rs1[0]~input_o\ & ((\rs1[1]~input_o\ & ((\RF|registers[2][1]~q\))) # (!\rs1[1]~input_o\ & (\RF|registers[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs1[0]~input_o\,
	datab => \rs1[1]~input_o\,
	datac => \RF|registers[0][1]~q\,
	datad => \RF|registers[2][1]~q\,
	combout => \RF|Mux0~0_combout\);

-- Location: LCCOMB_X14_Y1_N6
\RF|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RF|Mux0~1_combout\ = (\rs1[0]~input_o\ & ((\RF|Mux0~0_combout\ & ((\RF|registers[3][1]~q\))) # (!\RF|Mux0~0_combout\ & (\RF|registers[1][1]~q\)))) # (!\rs1[0]~input_o\ & (((\RF|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs1[0]~input_o\,
	datab => \RF|registers[1][1]~q\,
	datac => \RF|registers[3][1]~q\,
	datad => \RF|Mux0~0_combout\,
	combout => \RF|Mux0~1_combout\);

-- Location: LCCOMB_X13_Y1_N0
\ALU|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU|Add0~0_combout\ = \RF|Mux0~1_combout\ $ (((\CU|Mux1~1_combout\ & (\immediate[1]~input_o\)) # (!\CU|Mux1~1_combout\ & ((\MuxALU|output[1]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CU|Mux1~1_combout\,
	datab => \immediate[1]~input_o\,
	datac => \MuxALU|output[1]~4_combout\,
	datad => \RF|Mux0~1_combout\,
	combout => \ALU|Add0~0_combout\);

-- Location: LCCOMB_X13_Y1_N6
\ALU|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALU|Mux0~0_combout\ = (!\ALU|Mux1~1_combout\ & (\ALU|Add0~0_combout\ $ (((\RF|Mux1~1_combout\ & \MuxALU|output[0]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU|Mux1~1_combout\,
	datab => \RF|Mux1~1_combout\,
	datac => \MuxALU|output[0]~2_combout\,
	datad => \ALU|Add0~0_combout\,
	combout => \ALU|Mux0~0_combout\);

ww_result(0) <= \result[0]~output_o\;

ww_result(1) <= \result[1]~output_o\;
END structure;


