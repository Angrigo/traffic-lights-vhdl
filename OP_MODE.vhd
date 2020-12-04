----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:10 12/01/2020 
-- Design Name: 
-- Module Name:    ClockCounter - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OpModeManager is -- dichiarazione input e output OpModeManager
    Port ( clk : in  STD_LOGIC; -- clock
           rst : in  STD_LOGIC; -- reset
              op_mode: in  STD_LOGIC; -- valore del segnale impulsivo op_mode
           current_op_mode : out  STD_LOGIC_VECTOR (1 downto 0)); -- vettore che determina in che modalità deve funzionare il semaforo (00=modalità diurna;01=modalità prova;10=modalità notturna)
end OpModeManager;

architecture Behavioral of OpModeManager is 

signal ncount: STD_LOGIC_VECTOR (1 downto 0) := "00"; -- segnale di appoggio utilizzato per aggiornare current_op_mode

begin
 
    process(clk) begin -- processo che determina come viene cambiata la modalità
        if rising_edge(clk) then 
            if (rst='1') then -- con reset pari a 1 viene effettuato il reset sincrono che porta alla modalità notturna
                ncount<="00"; 
            else -- con op_mode pari a 1 si incrementa di 1 il valore di ncount ad ogni colpo di clock finchè non si ritorna nella modalità notturna (00)
                if op_mode = '1' then 
                    if(ncount = "10") then
                        ncount <= "00";
                    else
                        ncount <= std_logic_vector(unsigned(ncount) + 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    current_op_mode <= ncount;  -- aggiornamento current_op_mode

end Behavioral;