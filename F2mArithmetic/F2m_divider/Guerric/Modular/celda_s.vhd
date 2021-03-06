library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_unsigned.all; 
use IEEE.STD_LOGIC_arith.all;
----------------------------------------------------------------------------------------------------
entity celda_s is
	generic(       
		NUM_BITS : positive := 163
	);
	 port(
	  	 R : in STD_LOGIC_VECTOR(NUM_BITS downto 0); 
	 	 X2 : in STD_LOGIC_VECTOR(NUM_BITS downto 0);
		 c_1  : in STD_LOGIC; 
		 c_2  : in STD_LOGIC; 
		 en  : in STD_LOGIC;
		 clk  : in STD_LOGIC;
		 S    : out STD_LOGIC_VECTOR(NUM_BITS downto 0)	-- U = x/y mod Fx,
	     );
end;
----------------------------------------------------------------------------------------------------
architecture behave of celda_s is		
----------------------------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------			
-- Finite state machine 
----------------------------------------------------------------------------------------------------
Celda_s_process: process (clk)
	begin -- syncronous reset
		if CLK'event and CLK = '1' then
			if en = '1' then 
				if c_1 = '0' and c_2 = '0' then
					S <= X2;
				elsif c_1 = '0' and c_2 = '1' then
					S <= (others => '0');
				else
					S <= R;
				end if;
			end if;			 
		end if;			
	end process;
end behave;