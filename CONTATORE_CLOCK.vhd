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

entity OPMODE is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (4 downto 0));
end ClockCounter;

architecture Behavioral of ClockCounter is

signal ncount: STD_LOGIC_VECTOR (4 downto 0) := "00000";

begin
 
	process(clk) begin 
		if rising_edge(clk) then 
			if (rst='1') then 
				ncount<="00000";
			else
				if(ncount = "11111") then
					ncount <= "00000";
				else
					ncount <= std_logic_vector(unsigned(ncount) + 1);
				end if;		
			end if;
		end if;
	end process;

	count <= ncount; --std_logic_vector(to_unsigned(ncount, count'length)); 

end Behavioral;

