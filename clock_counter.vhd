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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockCounter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR ( 5 downto 0));
end ClockCounter;

architecture Behavioral of ClockCounter is

signal ncount: integer range 0 to 29;

begin
 
	process(clk) begin 
		if rising_edge(clk) then 
			if (rst='1') then 
				ncount<=0;
			else
				if(ncount = 29) then
					ncount <= ncount+1;
				else
					ncount <= 0; 				
				end if;
		end if;
	end process;

	count <= std_logic_vector(to_unsigned(ncount, count'length)); 

end Behavioral;

