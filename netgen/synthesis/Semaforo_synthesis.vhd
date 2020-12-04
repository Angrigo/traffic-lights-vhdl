--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: Semaforo_synthesis.vhd
-- /___/   /\     Timestamp: Fri Dec 04 09:48:40 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm Semaforo -w -dir netgen/synthesis -ofmt vhdl -sim Semaforo.ngc Semaforo_synthesis.vhd 
-- Device	: xc3s50-5-pq208
-- Input file	: Semaforo.ngc
-- Output file	: C:\Users\angri\Documents\XILINX PROJECTS\SEMAFORO\netgen\synthesis\Semaforo_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: Semaforo
-- Xilinx	: D:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity Semaforo is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    op_mode : in STD_LOGIC := 'X'; 
    debug_count : out STD_LOGIC_VECTOR ( 4 downto 0 ); 
    debug_op_mode : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    sem1 : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    sem2 : out STD_LOGIC_VECTOR ( 2 downto 0 ) 
  );
end Semaforo;

architecture Structure of Semaforo is
  signal CLK_COUNTER_ncount_or0000 : STD_LOGIC; 
  signal CLK_COUNTER_ncount_or000010_6 : STD_LOGIC; 
  signal CLK_COUNTER_ncount_or000016_7 : STD_LOGIC; 
  signal CLK_COUNTER_ncount_or000021_8 : STD_LOGIC; 
  signal CLK_COUNTER_ncount_or000023_9 : STD_LOGIC; 
  signal CLK_COUNTER_ncount_or000032_10 : STD_LOGIC; 
  signal CLK_COUNTER_ncount_or00005_11 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N17 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal OP_MODE_MANAGER_ncount_or0000 : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_4_1_39 : STD_LOGIC; 
  signal Result_4_2_40 : STD_LOGIC; 
  signal clk_BUFGP_42 : STD_LOGIC; 
  signal current_state_FSM_FFd1_43 : STD_LOGIC; 
  signal current_state_FSM_FFd1_In : STD_LOGIC; 
  signal current_state_FSM_FFd2_45 : STD_LOGIC; 
  signal current_state_FSM_FFd2_In : STD_LOGIC; 
  signal current_state_FSM_FFd3_47 : STD_LOGIC; 
  signal current_state_FSM_FFd3_In : STD_LOGIC; 
  signal current_state_FSM_FFd4_49 : STD_LOGIC; 
  signal current_state_FSM_FFd4_In : STD_LOGIC; 
  signal current_state_FSM_FFd5_51 : STD_LOGIC; 
  signal current_state_FSM_FFd5_In_52 : STD_LOGIC; 
  signal current_state_FSM_FFd6_53 : STD_LOGIC; 
  signal current_state_FSM_FFd6_In1 : STD_LOGIC; 
  signal current_state_FSM_FFd7_55 : STD_LOGIC; 
  signal current_state_FSM_FFd7_In : STD_LOGIC; 
  signal current_state_cmp_eq0002 : STD_LOGIC; 
  signal current_state_cmp_eq00022 : STD_LOGIC; 
  signal current_state_cmp_eq00024 : STD_LOGIC; 
  signal current_state_cmp_eq0003 : STD_LOGIC; 
  signal current_state_cmp_eq0004 : STD_LOGIC; 
  signal current_state_or0000 : STD_LOGIC; 
  signal op_mode_IBUF_71 : STD_LOGIC; 
  signal rst_IBUF_73 : STD_LOGIC; 
  signal sem1_1_OBUF_77 : STD_LOGIC; 
  signal sem1_2_OBUF_78 : STD_LOGIC; 
  signal sem2_1_OBUF_82 : STD_LOGIC; 
  signal sem2_2_OBUF_83 : STD_LOGIC; 
  signal temp_cmp_eq0000 : STD_LOGIC; 
  signal CLK_COUNTER_ncount : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal OP_MODE_MANAGER_ncount : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 4 downto 0 ); 
begin
  OP_MODE_MANAGER_ncount_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      CE => op_mode_IBUF_71,
      D => Result(0),
      R => OP_MODE_MANAGER_ncount_or0000,
      Q => OP_MODE_MANAGER_ncount(0)
    );
  OP_MODE_MANAGER_ncount_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      CE => op_mode_IBUF_71,
      D => Result(1),
      R => OP_MODE_MANAGER_ncount_or0000,
      Q => OP_MODE_MANAGER_ncount(1)
    );
  CLK_COUNTER_ncount_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => Result_0_1,
      R => CLK_COUNTER_ncount_or0000,
      Q => CLK_COUNTER_ncount(0)
    );
  CLK_COUNTER_ncount_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => Result_1_1,
      R => CLK_COUNTER_ncount_or0000,
      Q => CLK_COUNTER_ncount(1)
    );
  CLK_COUNTER_ncount_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => Result(2),
      R => CLK_COUNTER_ncount_or0000,
      Q => CLK_COUNTER_ncount(2)
    );
  CLK_COUNTER_ncount_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => Result(3),
      R => CLK_COUNTER_ncount_or0000,
      Q => CLK_COUNTER_ncount(3)
    );
  CLK_COUNTER_ncount_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => Result(4),
      R => CLK_COUNTER_ncount_or0000,
      Q => CLK_COUNTER_ncount(4)
    );
  current_state_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd1_In,
      R => current_state_or0000,
      Q => current_state_FSM_FFd1_43
    );
  current_state_FSM_FFd2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd2_In,
      R => current_state_or0000,
      Q => current_state_FSM_FFd2_45
    );
  current_state_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd3_In,
      R => current_state_or0000,
      Q => current_state_FSM_FFd3_47
    );
  current_state_FSM_FFd4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd4_In,
      R => current_state_or0000,
      Q => current_state_FSM_FFd4_49
    );
  current_state_FSM_FFd7 : FDS
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd7_In,
      S => current_state_or0000,
      Q => current_state_FSM_FFd7_55
    );
  current_state_FSM_FFd5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd5_In_52,
      R => current_state_or0000,
      Q => current_state_FSM_FFd5_51
    );
  current_state_FSM_Out81 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => current_state_FSM_FFd5_51,
      I1 => current_state_FSM_FFd7_55,
      O => sem2_1_OBUF_82
    );
  current_state_FSM_Out101 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => current_state_FSM_FFd2_45,
      I1 => current_state_FSM_FFd7_55,
      O => sem1_1_OBUF_77
    );
  current_state_FSM_Out91 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => current_state_FSM_FFd6_53,
      I1 => current_state_FSM_FFd1_43,
      I2 => current_state_FSM_FFd4_49,
      I3 => current_state_FSM_FFd5_51,
      O => sem1_2_OBUF_78
    );
  current_state_FSM_Out71 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => current_state_FSM_FFd4_49,
      I1 => current_state_FSM_FFd1_43,
      I2 => current_state_FSM_FFd2_45,
      I3 => current_state_FSM_FFd3_47,
      O => sem2_2_OBUF_83
    );
  OP_MODE_MANAGER_Mcount_ncount_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => OP_MODE_MANAGER_ncount(1),
      I1 => OP_MODE_MANAGER_ncount(0),
      O => Result(1)
    );
  CLK_COUNTER_Mcount_ncount_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => CLK_COUNTER_ncount(1),
      I1 => CLK_COUNTER_ncount(0),
      O => Result_1_1
    );
  current_state_FSM_FFd7_In1 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => OP_MODE_MANAGER_ncount(1),
      I1 => OP_MODE_MANAGER_ncount(0),
      I2 => current_state_FSM_FFd7_55,
      O => current_state_FSM_FFd7_In
    );
  CLK_COUNTER_Mcount_ncount_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => CLK_COUNTER_ncount(2),
      I1 => CLK_COUNTER_ncount(1),
      I2 => CLK_COUNTER_ncount(0),
      O => Result(2)
    );
  Result_3_1 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => CLK_COUNTER_ncount(3),
      I1 => CLK_COUNTER_ncount(2),
      I2 => CLK_COUNTER_ncount(1),
      I3 => CLK_COUNTER_ncount(0),
      O => Result(3)
    );
  current_state_or00001 : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => rst_IBUF_73,
      I1 => OP_MODE_MANAGER_ncount(0),
      I2 => OP_MODE_MANAGER_ncount(1),
      O => current_state_or0000
    );
  OP_MODE_MANAGER_ncount_or00001 : LUT4
    generic map(
      INIT => X"AEAA"
    )
    port map (
      I0 => rst_IBUF_73,
      I1 => OP_MODE_MANAGER_ncount(1),
      I2 => OP_MODE_MANAGER_ncount(0),
      I3 => op_mode_IBUF_71,
      O => OP_MODE_MANAGER_ncount_or0000
    );
  current_state_FSM_FFd4_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => N15,
      I1 => current_state_FSM_FFd5_51,
      I2 => current_state_cmp_eq0003,
      I3 => current_state_FSM_FFd4_49,
      O => current_state_FSM_FFd4_In
    );
  current_state_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => N20,
      I1 => current_state_FSM_FFd4_49,
      I2 => current_state_cmp_eq0004,
      I3 => current_state_FSM_FFd3_47,
      O => current_state_FSM_FFd3_In
    );
  current_state_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => N14,
      I1 => current_state_FSM_FFd3_47,
      I2 => current_state_cmp_eq0002,
      I3 => current_state_FSM_FFd2_45,
      O => current_state_FSM_FFd2_In
    );
  current_state_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => current_state_cmp_eq0002,
      I1 => current_state_FSM_FFd2_45,
      I2 => current_state_cmp_eq0003,
      I3 => current_state_FSM_FFd1_43,
      O => current_state_FSM_FFd1_In
    );
  current_state_FSM_FFd5_In : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => N21,
      I1 => N3,
      I2 => current_state_cmp_eq0002,
      I3 => current_state_FSM_FFd5_51,
      O => current_state_FSM_FFd5_In_52
    );
  CLK_COUNTER_ncount_or000012 : LUT4
    generic map(
      INIT => X"FF8A"
    )
    port map (
      I0 => current_state_FSM_FFd7_55,
      I1 => OP_MODE_MANAGER_ncount(1),
      I2 => OP_MODE_MANAGER_ncount(0),
      I3 => N19,
      O => N2
    );
  CLK_COUNTER_ncount_or00005 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => CLK_COUNTER_ncount(4),
      I1 => CLK_COUNTER_ncount(2),
      I2 => CLK_COUNTER_ncount(0),
      I3 => N16,
      O => CLK_COUNTER_ncount_or00005_11
    );
  CLK_COUNTER_ncount_or000016 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => current_state_FSM_FFd5_51,
      I1 => current_state_FSM_FFd2_45,
      O => CLK_COUNTER_ncount_or000016_7
    );
  CLK_COUNTER_ncount_or0000211 : LUT4
    generic map(
      INIT => X"EAC0"
    )
    port map (
      I0 => current_state_FSM_FFd3_47,
      I1 => CLK_COUNTER_ncount_or000016_7,
      I2 => N18,
      I3 => N3,
      O => CLK_COUNTER_ncount_or000021_8
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_73
    );
  op_mode_IBUF : IBUF
    port map (
      I => op_mode,
      O => op_mode_IBUF_71
    );
  debug_count_4_OBUF : OBUF
    port map (
      I => CLK_COUNTER_ncount(4),
      O => debug_count(4)
    );
  debug_count_3_OBUF : OBUF
    port map (
      I => CLK_COUNTER_ncount(3),
      O => debug_count(3)
    );
  debug_count_2_OBUF : OBUF
    port map (
      I => CLK_COUNTER_ncount(2),
      O => debug_count(2)
    );
  debug_count_1_OBUF : OBUF
    port map (
      I => CLK_COUNTER_ncount(1),
      O => debug_count(1)
    );
  debug_count_0_OBUF : OBUF
    port map (
      I => CLK_COUNTER_ncount(0),
      O => debug_count(0)
    );
  debug_op_mode_1_OBUF : OBUF
    port map (
      I => OP_MODE_MANAGER_ncount(1),
      O => debug_op_mode(1)
    );
  debug_op_mode_0_OBUF : OBUF
    port map (
      I => OP_MODE_MANAGER_ncount(0),
      O => debug_op_mode(0)
    );
  sem1_2_OBUF : OBUF
    port map (
      I => sem1_2_OBUF_78,
      O => sem1(2)
    );
  sem1_1_OBUF : OBUF
    port map (
      I => sem1_1_OBUF_77,
      O => sem1(1)
    );
  sem1_0_OBUF : OBUF
    port map (
      I => current_state_FSM_FFd3_47,
      O => sem1(0)
    );
  sem2_2_OBUF : OBUF
    port map (
      I => sem2_2_OBUF_83,
      O => sem2(2)
    );
  sem2_1_OBUF : OBUF
    port map (
      I => sem2_1_OBUF_82,
      O => sem2(1)
    );
  sem2_0_OBUF : OBUF
    port map (
      I => current_state_FSM_FFd6_53,
      O => sem2(0)
    );
  current_state_FSM_FFd6 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_42,
      D => current_state_FSM_FFd6_In1,
      R => current_state_or0000,
      S => N2,
      Q => current_state_FSM_FFd6_53
    );
  CLK_COUNTER_ncount_or000068 : LUT4
    generic map(
      INIT => X"F0E2"
    )
    port map (
      I0 => N6,
      I1 => N41,
      I2 => N7,
      I3 => CLK_COUNTER_ncount_or000032_10,
      O => CLK_COUNTER_ncount_or0000
    );
  current_state_cmp_eq0001511 : LUT4
    generic map(
      INIT => X"0801"
    )
    port map (
      I0 => CLK_COUNTER_ncount(4),
      I1 => CLK_COUNTER_ncount(2),
      I2 => CLK_COUNTER_ncount(0),
      I3 => N17,
      O => N3
    );
  CLK_COUNTER_ncount_or000010_SW1 : LUT4
    generic map(
      INIT => X"F35F"
    )
    port map (
      I0 => current_state_FSM_FFd6_53,
      I1 => current_state_FSM_FFd4_49,
      I2 => CLK_COUNTER_ncount(4),
      I3 => CLK_COUNTER_ncount(0),
      O => N10
    );
  CLK_COUNTER_ncount_or000010 : LUT4
    generic map(
      INIT => X"0A11"
    )
    port map (
      I0 => CLK_COUNTER_ncount(2),
      I1 => N9,
      I2 => N10,
      I3 => temp_cmp_eq0000,
      O => CLK_COUNTER_ncount_or000010_6
    );
  CLK_COUNTER_ncount_or000012_SW1 : LUT4
    generic map(
      INIT => X"FF82"
    )
    port map (
      I0 => current_state_FSM_FFd7_55,
      I1 => OP_MODE_MANAGER_ncount(1),
      I2 => OP_MODE_MANAGER_ncount(0),
      I3 => CLK_COUNTER_ncount_or00005_11,
      O => N6
    );
  CLK_COUNTER_ncount_or000023 : LUT4
    generic map(
      INIT => X"C081"
    )
    port map (
      I0 => OP_MODE_MANAGER_ncount(0),
      I1 => CLK_COUNTER_ncount(1),
      I2 => CLK_COUNTER_ncount(3),
      I3 => OP_MODE_MANAGER_ncount(1),
      O => CLK_COUNTER_ncount_or000023_9
    );
  CLK_COUNTER_ncount_or000012_SW2 : LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      I0 => OP_MODE_MANAGER_ncount(1),
      I1 => OP_MODE_MANAGER_ncount(0),
      I2 => CLK_COUNTER_ncount_or00005_11,
      O => N7
    );
  current_state_cmp_eq000241 : LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => CLK_COUNTER_ncount(3),
      I1 => OP_MODE_MANAGER_ncount(0),
      I2 => OP_MODE_MANAGER_ncount(1),
      O => current_state_cmp_eq00024
    );
  current_state_cmp_eq000211 : LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => CLK_COUNTER_ncount(1),
      I1 => OP_MODE_MANAGER_ncount(0),
      I2 => OP_MODE_MANAGER_ncount(1),
      O => current_state_cmp_eq00022
    );
  current_state_FSM_FFd5_In_SW0 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => CLK_COUNTER_ncount(1),
      I1 => CLK_COUNTER_ncount(3),
      I2 => current_state_FSM_FFd6_53,
      O => N21
    );
  current_state_FSM_FFd6_In11 : LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => current_state_FSM_FFd6_53,
      I1 => N3,
      I2 => CLK_COUNTER_ncount(1),
      I3 => CLK_COUNTER_ncount(3),
      O => current_state_FSM_FFd6_In1
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_42
    );
  OP_MODE_MANAGER_Mcount_ncount_xor_0_11_INV_0 : INV
    port map (
      I => OP_MODE_MANAGER_ncount(0),
      O => Result(0)
    );
  CLK_COUNTER_Mcount_ncount_xor_0_11_INV_0 : INV
    port map (
      I => CLK_COUNTER_ncount(0),
      O => Result_0_1
    );
  Result_4_1 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => CLK_COUNTER_ncount(2),
      I1 => CLK_COUNTER_ncount(3),
      I2 => CLK_COUNTER_ncount(1),
      I3 => CLK_COUNTER_ncount(0),
      O => Result_4_1_39
    );
  Result_4_2 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => CLK_COUNTER_ncount(1),
      I1 => CLK_COUNTER_ncount(0),
      I2 => CLK_COUNTER_ncount(2),
      I3 => CLK_COUNTER_ncount(3),
      O => Result_4_2_40
    );
  Result_4_f5 : MUXF5
    port map (
      I0 => Result_4_2_40,
      I1 => Result_4_1_39,
      S => CLK_COUNTER_ncount(4),
      O => Result(4)
    );
  current_state_cmp_eq000451 : LUT3_D
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => N3,
      I1 => current_state_cmp_eq00024,
      I2 => current_state_cmp_eq00022,
      LO => N14,
      O => current_state_cmp_eq0004
    );
  current_state_cmp_eq000252 : LUT3_D
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => N4,
      I1 => current_state_cmp_eq00024,
      I2 => current_state_cmp_eq00022,
      LO => N15,
      O => current_state_cmp_eq0002
    );
  CLK_COUNTER_ncount_or000021 : LUT2_D
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => CLK_COUNTER_ncount(1),
      I1 => CLK_COUNTER_ncount(3),
      LO => N16,
      O => N5
    );
  temp_cmp_eq00001 : LUT2_D
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => OP_MODE_MANAGER_ncount(1),
      I1 => OP_MODE_MANAGER_ncount(0),
      LO => N17,
      O => temp_cmp_eq0000
    );
  CLK_COUNTER_ncount_or000032 : LUT4_L
    generic map(
      INIT => X"EAC0"
    )
    port map (
      I0 => CLK_COUNTER_ncount_or000023_9,
      I1 => N5,
      I2 => CLK_COUNTER_ncount_or000010_6,
      I3 => CLK_COUNTER_ncount_or000021_8,
      LO => CLK_COUNTER_ncount_or000032_10
    );
  current_state_cmp_eq0002511 : LUT4_D
    generic map(
      INIT => X"4001"
    )
    port map (
      I0 => CLK_COUNTER_ncount(4),
      I1 => CLK_COUNTER_ncount(2),
      I2 => CLK_COUNTER_ncount(0),
      I3 => temp_cmp_eq0000,
      LO => N18,
      O => N4
    );
  CLK_COUNTER_ncount_or000010_SW0 : LUT4_L
    generic map(
      INIT => X"FFF1"
    )
    port map (
      I0 => current_state_FSM_FFd4_49,
      I1 => current_state_FSM_FFd6_53,
      I2 => CLK_COUNTER_ncount(4),
      I3 => CLK_COUNTER_ncount(0),
      LO => N9
    );
  CLK_COUNTER_ncount_or000012_SW0 : LUT4_D
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => current_state_FSM_FFd1_43,
      I1 => CLK_COUNTER_ncount(1),
      I2 => CLK_COUNTER_ncount(3),
      I3 => N4,
      LO => N19,
      O => N41
    );
  current_state_cmp_eq000351 : LUT3_D
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => N4,
      I1 => CLK_COUNTER_ncount(1),
      I2 => CLK_COUNTER_ncount(3),
      LO => N20,
      O => current_state_cmp_eq0003
    );

end Structure;

