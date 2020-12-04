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
use ieee.std_logic_unsigned.all;

entity ClockCounter is -- dichiarazione input e output di ClockCounter
    Port ( clk : in  STD_LOGIC; -- clock
           rst : in  STD_LOGIC; -- reset
           count : out  STD_LOGIC_VECTOR (4 downto 0)); -- vettore che contiene il numero di cicli di clock avvenuti dall'ultima modifica dello stato o dal reset
end ClockCounter;

architecture Behavioral of ClockCounter is

signal ncount: STD_LOGIC_VECTOR (4 downto 0) := (others=>'0'); -- segnale di appoggio per l'aggiornamento di count

begin
 
    process(clk) begin -- processo che determina come si effettua il conteggio dei cicli di clock
        if rising_edge(clk) then 
            if (rst='1') then -- con reset pari a 1 viene effettuato il reset sincrono che porta all'azzeramento del conteggio
                ncount <= (others=>'0');
            else --  si incrementa di 1 il valore di ncount ad ogni colpo di clock finchè non si ritorna al'azzeramento di ncount
                if(ncount = "11111") then 
                    ncount <= (others=>'0');
                else
                    ncount <= ncount + 1;
                end if;
            end if;
        end if;
    end process;

    count <= ncount; -- aggiornamento ncount

end Behavioral;