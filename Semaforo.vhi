
-- VHDL Instantiation Created from source file Semaforo.vhd -- 11:57:16 11/24/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Semaforo
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		op_mode : IN std_logic;          
		sem1 : OUT std_logic_vector(2 downto 0);
		sem2 : OUT std_logic_vector(2 downto 0);
		debug_op_mode : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	Inst_Semaforo: Semaforo PORT MAP(
		clk => ,
		rst => ,
		op_mode => ,
		sem1 => ,
		sem2 => ,
		debug_op_mode => 
	);


