----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:25 11/24/2020 
-- Design Name: 
-- Module Name:    Semaforo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Semaforo IS --Dichiarazione input e output semaforo
	PORT (
		clk : IN STD_LOGIC; --clock
		rst : IN STD_LOGIC; --reset (sincrono)
		op_mode : IN STD_LOGIC; -- segnale impulsivo che permette l'aggiornamento dell' op_mode tramite l'OpModeManager
		sem1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); -- vettore che rappresenta il semaforo 1 (100=rosso;010=giallo;001=verde)
		sem2 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); -- vettore che rappresenta il semaforo 2 (100=rosso;010=giallo;001=verde)
		debug_op_mode : OUT STD_LOGIC_VECTOR (1 DOWNTO 0); -- output che mostra in che modalità sta funzionando il semaforo (00=modalità notturna;01=modalità diurna;10=modalità di prova)
		debug_count : OUT STD_LOGIC_VECTOR (4 DOWNTO 0) -- output che mostra il numero di cicli di clock avvenuti dall'ultima modifica dello stato o dal reset
		);
END Semaforo;

ARCHITECTURE Behavioral OF Semaforo IS 

	component ClockCounter -- Codice relativo e commenti presenti nel rispettivo file
			 port (		
							clk:in std_logic;
							rst:in std_logic;
							count:out std_logic_vector (4 downto 0)
					);
	end component;
	
	component OpModeManager -- Codice relativo e commenti presenti nel rispettivo file
			 port (		
							clk :in std_logic;
							rst :in std_logic;
							op_mode :in std_logic;
							current_op_mode :out std_logic_vector (1 downto 0)
					);
	end component;
	
	-- dichiarazione segnali interni e stati
	TYPE state IS (G1, G2, G3, G4, G5, G6, N); -- i primi 6 stati gestiscono modalità diurna e di prova,l'ultimo gestisce la modalità notturna
	SIGNAL current_state : state := N; -- stato corrente
	SIGNAL next_state: state := N; -- stato prossimo
	SIGNAL internal_sem1 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000"; -- semaforo 1 interno (necessario per l'aggiornamento di sem1)
   SIGNAL internal_sem2 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000"; -- semaforo 2 interno (necessario per l'aggiornamento di sem2)
	
	SIGNAL current_op_mode : STD_LOGIC_VECTOR (1 DOWNTO 0); -- determina la 
	-- 00 è la modalità di funzionamento diurna
	-- 01 è la modalità di funzionamento in prova che permette di passare su tutti gli stati diurni con tempi uguali e ridotti per ogni passaggio di stato
	-- 10 è la modalità di funzionamento notturna
	-- 11 è una modalità proibita, il componente che gestisce la current_op_mode non fornirà mai questo output
	SIGNAL count : STD_LOGIC_VECTOR (4 DOWNTO 0); -- vettore che contiene il numero di cicli di clock  avvenuti dall'ultima modifica dello stato o dal reset
	SIGNAL count_rst : STD_LOGIC := '0'; -- variabile che permette l'azzeramento del conteggio ad ogni passaggio di stato
BEGIN

	CLK_COUNTER: ClockCounter port map(clk, count_rst, count);
	OP_MODE_MANAGER: OpModeManager port map(clk, rst, op_mode, current_op_mode);

	current_state_update : PROCESS (clk) BEGIN -- processo che gestisce reset e aggiornamento stato
		IF rising_edge(clk) THEN  
			IF rst = '1' THEN -- implementazione reset (porta in modalità notturna a prescindere dalla modalità in uso)
				current_state <= N;
			ELSE 
				current_state <= next_state; -- aggiornamento stato
			END IF;
		END IF;
	END PROCESS;

	next_state_and_output_moore : PROCESS (current_state, count,current_op_mode) -- processo che determina il comportamento per ogni stato
		variable temp : std_logic_vector (4 downto 0) := "01010"; -- variabile che determina la durata in cicli di clock di ogni stato
	BEGIN
			CASE current_state IS
				WHEN N => -- stato notte (uscite=giallo-giallo)
					internal_sem1 <= "010";
					internal_sem2 <= "010";			
											
					CASE current_op_mode IS
						WHEN "01" => 
							next_state <= N;
							count_rst <= '0';
						WHEN OTHERS => 
							next_state <= G1;
							count_rst <= '1';
					END CASE;
				WHEN G1 => -- stato giorno1 / prova1 (uscite=rosso-verde)
					CASE current_op_mode IS
						WHEN "00" => -- caso giorno
							temp := "11110"; -- 30
						WHEN OTHERS => 
							temp := "01010";
					END CASE;
					
					IF (count = (temp) ) THEN
						next_state <= G2;
						count_rst <= '1';
					ELSE
						next_state <= G1;
						count_rst <= '0';
					END IF;
					internal_sem1 <= "100";
					internal_sem2 <= "001";
				WHEN G2 => -- stato giorno2 / prova2 (uscite=rosso-giallo)
					CASE current_op_mode IS
						WHEN "00" => -- caso giorno
							temp := "00101"; -- 5
						WHEN OTHERS => 
							temp := "01010";
					END CASE;
					
					IF (count = (temp) ) THEN
						next_state <= G3;
						count_rst <= '1';
					ELSE
						next_state <= G2;
						count_rst <= '0';
					END IF;
					internal_sem1 <= "100";
					internal_sem2 <= "010";
				WHEN G3 => -- stato giorno3 / prova3 (uscite=rosso-rosso)
					CASE current_op_mode IS
						WHEN "00" => -- caso giorno
							temp := "01111"; -- 15
						WHEN OTHERS => 
							temp := "01010";
					END CASE;
									
					IF (count = (temp) ) THEN
						next_state <= G4;
						count_rst <= '1';
					ELSE
						next_state <= G3;
						count_rst <= '0';
					END IF;
					internal_sem1 <= "100";
					internal_sem2 <= "100";
				WHEN G4 => -- stato giorno4 / prova4 (uscite=verde-rosso)
					CASE current_op_mode IS
						WHEN "00" => -- caso giorno
							temp := "10100"; -- 20
						WHEN OTHERS => 
							temp := "01010";
					END CASE;
					
					IF (count = (temp) ) THEN
						next_state <= G5;
						count_rst <= '1';
					ELSE
						next_state <= G4;
						count_rst <= '0';
					END IF;
					internal_sem1 <= "001";
					internal_sem2 <= "100";
				WHEN G5 => -- stato giorno5 / prova5 (uscite=giallo-rosso)
					CASE current_op_mode IS
						WHEN "00" => -- caso giorno
							temp := "00101"; -- 5
						WHEN OTHERS => 
							temp := "01010";
					END CASE;
					
					IF (count = (temp) ) THEN
						next_state <= G6;
						count_rst <= '1';
					ELSE
						next_state <= G5;
						count_rst <= '0';
					END IF;
					internal_sem1 <= "010";
					internal_sem2 <= "100";
				WHEN G6 => -- stato giorno1 / prova1 (uscite=rosso-rosso)
					CASE current_op_mode IS
						WHEN "00" => -- caso giorno
							temp := "01111"; -- 15
						WHEN OTHERS => 
							temp := "01010";
					END CASE;
					
					IF (count = temp) THEN
						next_state <= G1;
						count_rst <= '1';
					ELSE
						next_state <= G6;
						count_rst <= '0';
					END IF;
					internal_sem1 <= "100"; 
					internal_sem2 <= "100";
				END CASE;	

				if(current_op_mode = "10") then
					next_state <= N;
					count_rst <= '0';
				end if;
				
			END PROCESS;
			
			debug_count <= count; -- inserimento di count in debug_count
			debug_op_mode <= current_op_mode; -- inserimento di current_op_mode in debug_op_mode

			sem1 <= internal_sem1; -- aggiornamento uscite
			sem2 <= internal_sem2;
END Behavioral;