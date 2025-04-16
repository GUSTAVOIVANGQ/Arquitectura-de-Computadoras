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

-- DATE "04/15/2025 22:18:38"

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

ENTITY 	RAM_Distribuida IS
    PORT (
	clk : IN std_logic;
	we : IN std_logic;
	fila : IN std_logic_vector(9 DOWNTO 0);
	columna : IN std_logic_vector(3 DOWNTO 0);
	data_in : IN std_logic_vector(7 DOWNTO 0);
	data_out : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END RAM_Distribuida;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[1]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[2]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[3]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[4]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[5]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[6]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[7]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- we	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[9]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columna[0]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columna[1]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columna[2]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columna[3]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[0]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[1]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[2]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[3]	=>  Location: PIN_J5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[4]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[5]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[6]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[7]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila[8]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RAM_Distribuida IS
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
SIGNAL ww_we : std_logic;
SIGNAL ww_fila : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_columna : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_data_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_out : std_logic_vector(7 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a15_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_out[0]~output_o\ : std_logic;
SIGNAL \data_out[1]~output_o\ : std_logic;
SIGNAL \data_out[2]~output_o\ : std_logic;
SIGNAL \data_out[3]~output_o\ : std_logic;
SIGNAL \data_out[4]~output_o\ : std_logic;
SIGNAL \data_out[5]~output_o\ : std_logic;
SIGNAL \data_out[6]~output_o\ : std_logic;
SIGNAL \data_out[7]~output_o\ : std_logic;
SIGNAL \fila[9]~input_o\ : std_logic;
SIGNAL \we~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \columna[0]~input_o\ : std_logic;
SIGNAL \columna[1]~input_o\ : std_logic;
SIGNAL \columna[2]~input_o\ : std_logic;
SIGNAL \columna[3]~input_o\ : std_logic;
SIGNAL \fila[0]~input_o\ : std_logic;
SIGNAL \fila[1]~input_o\ : std_logic;
SIGNAL \fila[2]~input_o\ : std_logic;
SIGNAL \fila[3]~input_o\ : std_logic;
SIGNAL \fila[4]~input_o\ : std_logic;
SIGNAL \fila[5]~input_o\ : std_logic;
SIGNAL \fila[6]~input_o\ : std_logic;
SIGNAL \fila[7]~input_o\ : std_logic;
SIGNAL \fila[8]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[0]~0_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[1]~1_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[2]~2_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[3]~3_combout\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[4]~4_combout\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[5]~5_combout\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[6]~6_combout\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|mux2|result_node[7]~7_combout\ : std_logic;
SIGNAL \memoria_rtl_0|auto_generated|address_reg_a\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \memoria_rtl_0|auto_generated|decode3|eq_node\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_fila[9]~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_we <= we;
ww_fila <= fila;
ww_columna <= columna;
ww_data_in <= data_in;
data_out <= ww_data_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\memoria_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \data_in[0]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a8~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \data_in[0]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \data_in[1]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a9~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \data_in[1]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a1~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \data_in[2]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a10~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \data_in[2]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a2~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \data_in[3]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a11~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \data_in[3]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a3~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \data_in[4]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a12~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \data_in[4]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a4~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \data_in[5]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a13~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \data_in[5]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a5~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \data_in[6]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a14~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \data_in[6]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a6~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \data_in[7]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a15~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a15_PORTADATAOUT_bus\(0);

\memoria_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \data_in[7]~input_o\;

\memoria_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\fila[8]~input_o\ & \fila[7]~input_o\ & \fila[6]~input_o\ & \fila[5]~input_o\ & \fila[4]~input_o\ & \fila[3]~input_o\ & \fila[2]~input_o\ & \fila[1]~input_o\ & \fila[0]~input_o\ & 
\columna[3]~input_o\ & \columna[2]~input_o\ & \columna[1]~input_o\ & \columna[0]~input_o\);

\memoria_rtl_0|auto_generated|ram_block1a7~portadataout\ <= \memoria_rtl_0|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_fila[9]~input_o\ <= NOT \fila[9]~input_o\;

-- Location: IOOBUF_X35_Y73_N23
\data_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[0]~0_combout\,
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X0_Y47_N2
\data_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[1]~1_combout\,
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X0_Y47_N16
\data_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[2]~2_combout\,
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X35_Y73_N16
\data_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[3]~3_combout\,
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X0_Y48_N2
\data_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[4]~4_combout\,
	devoe => ww_devoe,
	o => \data_out[4]~output_o\);

-- Location: IOOBUF_X0_Y47_N23
\data_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[5]~5_combout\,
	devoe => ww_devoe,
	o => \data_out[5]~output_o\);

-- Location: IOOBUF_X0_Y48_N9
\data_out[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[6]~6_combout\,
	devoe => ww_devoe,
	o => \data_out[6]~output_o\);

-- Location: IOOBUF_X0_Y46_N23
\data_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \memoria_rtl_0|auto_generated|mux2|result_node[7]~7_combout\,
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

-- Location: IOIBUF_X0_Y44_N1
\fila[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(9),
	o => \fila[9]~input_o\);

-- Location: IOIBUF_X0_Y46_N15
\we~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_we,
	o => \we~input_o\);

-- Location: LCCOMB_X36_Y47_N8
\memoria_rtl_0|auto_generated|decode3|eq_node[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|decode3|eq_node\(1) = (\fila[9]~input_o\ & \we~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fila[9]~input_o\,
	datad => \we~input_o\,
	combout => \memoria_rtl_0|auto_generated|decode3|eq_node\(1));

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

-- Location: IOIBUF_X0_Y51_N15
\data_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: IOIBUF_X49_Y73_N22
\columna[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_columna(0),
	o => \columna[0]~input_o\);

-- Location: IOIBUF_X40_Y73_N1
\columna[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_columna(1),
	o => \columna[1]~input_o\);

-- Location: IOIBUF_X45_Y73_N8
\columna[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_columna(2),
	o => \columna[2]~input_o\);

-- Location: IOIBUF_X38_Y0_N8
\columna[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_columna(3),
	o => \columna[3]~input_o\);

-- Location: IOIBUF_X38_Y73_N1
\fila[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(0),
	o => \fila[0]~input_o\);

-- Location: IOIBUF_X0_Y42_N1
\fila[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(1),
	o => \fila[1]~input_o\);

-- Location: IOIBUF_X42_Y73_N1
\fila[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(2),
	o => \fila[2]~input_o\);

-- Location: IOIBUF_X0_Y50_N22
\fila[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(3),
	o => \fila[3]~input_o\);

-- Location: IOIBUF_X45_Y73_N1
\fila[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(4),
	o => \fila[4]~input_o\);

-- Location: IOIBUF_X49_Y0_N15
\fila[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(5),
	o => \fila[5]~input_o\);

-- Location: IOIBUF_X42_Y73_N8
\fila[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(6),
	o => \fila[6]~input_o\);

-- Location: IOIBUF_X38_Y73_N8
\fila[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(7),
	o => \fila[7]~input_o\);

-- Location: IOIBUF_X0_Y44_N8
\fila[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila(8),
	o => \fila[8]~input_o\);

-- Location: M9K_X37_Y47_N0
\memoria_rtl_0|auto_generated|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: FF_X36_Y47_N17
\memoria_rtl_0|auto_generated|address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fila[9]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memoria_rtl_0|auto_generated|address_reg_a\(0));

-- Location: LCCOMB_X36_Y47_N18
\memoria_rtl_0|auto_generated|decode3|eq_node[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|decode3|eq_node\(0) = (!\fila[9]~input_o\ & \we~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fila[9]~input_o\,
	datad => \we~input_o\,
	combout => \memoria_rtl_0|auto_generated|decode3|eq_node\(0));

-- Location: M9K_X37_Y48_N0
\memoria_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N2
\memoria_rtl_0|auto_generated|mux2|result_node[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[0]~0_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & (\memoria_rtl_0|auto_generated|ram_block1a8~portadataout\)) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\memoria_rtl_0|auto_generated|ram_block1a0~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \memoria_rtl_0|auto_generated|ram_block1a8~portadataout\,
	datab => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	datad => \memoria_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[0]~0_combout\);

-- Location: IOIBUF_X52_Y73_N8
\data_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: M9K_X51_Y47_N0
\memoria_rtl_0|auto_generated|ram_block1a1\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: M9K_X51_Y48_N0
\memoria_rtl_0|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N28
\memoria_rtl_0|auto_generated|mux2|result_node[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[1]~1_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & ((\memoria_rtl_0|auto_generated|ram_block1a9~portadataout\))) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\memoria_rtl_0|auto_generated|ram_block1a1~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \memoria_rtl_0|auto_generated|ram_block1a1~portadataout\,
	datac => \memoria_rtl_0|auto_generated|ram_block1a9~portadataout\,
	datad => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[1]~1_combout\);

-- Location: IOIBUF_X0_Y43_N15
\data_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: M9K_X37_Y43_N0
\memoria_rtl_0|auto_generated|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y44_N0
\memoria_rtl_0|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N22
\memoria_rtl_0|auto_generated|mux2|result_node[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[2]~2_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & (\memoria_rtl_0|auto_generated|ram_block1a10~portadataout\)) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\memoria_rtl_0|auto_generated|ram_block1a2~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \memoria_rtl_0|auto_generated|ram_block1a10~portadataout\,
	datac => \memoria_rtl_0|auto_generated|ram_block1a2~portadataout\,
	datad => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[2]~2_combout\);

-- Location: IOIBUF_X52_Y73_N15
\data_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: M9K_X51_Y46_N0
\memoria_rtl_0|auto_generated|ram_block1a3\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: M9K_X51_Y44_N0
\memoria_rtl_0|auto_generated|ram_block1a11\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N24
\memoria_rtl_0|auto_generated|mux2|result_node[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[3]~3_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & ((\memoria_rtl_0|auto_generated|ram_block1a11~portadataout\))) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\memoria_rtl_0|auto_generated|ram_block1a3~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \memoria_rtl_0|auto_generated|ram_block1a3~portadataout\,
	datac => \memoria_rtl_0|auto_generated|ram_block1a11~portadataout\,
	datad => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[3]~3_combout\);

-- Location: IOIBUF_X0_Y45_N22
\data_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: M9K_X51_Y45_N0
\memoria_rtl_0|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y45_N0
\memoria_rtl_0|auto_generated|ram_block1a12\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N26
\memoria_rtl_0|auto_generated|mux2|result_node[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[4]~4_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & ((\memoria_rtl_0|auto_generated|ram_block1a12~portadataout\))) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\memoria_rtl_0|auto_generated|ram_block1a4~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	datac => \memoria_rtl_0|auto_generated|ram_block1a4~portadataout\,
	datad => \memoria_rtl_0|auto_generated|ram_block1a12~portadataout\,
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[4]~4_combout\);

-- Location: IOIBUF_X52_Y73_N22
\data_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: M9K_X51_Y50_N0
\memoria_rtl_0|auto_generated|ram_block1a5\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: M9K_X51_Y49_N0
\memoria_rtl_0|auto_generated|ram_block1a13\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a13_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N20
\memoria_rtl_0|auto_generated|mux2|result_node[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[5]~5_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & ((\memoria_rtl_0|auto_generated|ram_block1a13~portadataout\))) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\memoria_rtl_0|auto_generated|ram_block1a5~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \memoria_rtl_0|auto_generated|ram_block1a5~portadataout\,
	datac => \memoria_rtl_0|auto_generated|ram_block1a13~portadataout\,
	datad => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[5]~5_combout\);

-- Location: IOIBUF_X0_Y49_N8
\data_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: M9K_X37_Y50_N0
\memoria_rtl_0|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y49_N0
\memoria_rtl_0|auto_generated|ram_block1a14\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N6
\memoria_rtl_0|auto_generated|mux2|result_node[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[6]~6_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & ((\memoria_rtl_0|auto_generated|ram_block1a14~portadataout\))) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\memoria_rtl_0|auto_generated|ram_block1a6~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	datac => \memoria_rtl_0|auto_generated|ram_block1a6~portadataout\,
	datad => \memoria_rtl_0|auto_generated|ram_block1a14~portadataout\,
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[6]~6_combout\);

-- Location: IOIBUF_X0_Y45_N15
\data_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: M9K_X37_Y46_N0
\memoria_rtl_0|auto_generated|ram_block1a7\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(0),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y42_N0
\memoria_rtl_0|auto_generated|ram_block1a15\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RAM_Distribuida.ram0_RAM_Distribuida_4e7a9f8c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:memoria_rtl_0|altsyncram_are1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \memoria_rtl_0|auto_generated|decode3|eq_node\(1),
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \fila[9]~input_o\,
	portadatain => \memoria_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \memoria_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoria_rtl_0|auto_generated|ram_block1a15_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y47_N16
\memoria_rtl_0|auto_generated|mux2|result_node[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \memoria_rtl_0|auto_generated|mux2|result_node[7]~7_combout\ = (\memoria_rtl_0|auto_generated|address_reg_a\(0) & ((\memoria_rtl_0|auto_generated|ram_block1a15~portadataout\))) # (!\memoria_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\memoria_rtl_0|auto_generated|ram_block1a7~portadataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \memoria_rtl_0|auto_generated|ram_block1a7~portadataout\,
	datac => \memoria_rtl_0|auto_generated|address_reg_a\(0),
	datad => \memoria_rtl_0|auto_generated|ram_block1a15~portadataout\,
	combout => \memoria_rtl_0|auto_generated|mux2|result_node[7]~7_combout\);

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_data_out(4) <= \data_out[4]~output_o\;

ww_data_out(5) <= \data_out[5]~output_o\;

ww_data_out(6) <= \data_out[6]~output_o\;

ww_data_out(7) <= \data_out[7]~output_o\;
END structure;


