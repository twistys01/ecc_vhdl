library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_unsigned.all; 
use IEEE.STD_LOGIC_arith.all;
----------------------------------------------------------------------------------------------------
entity celda_V is
	generic(       
		NUM_BITS : positive := 163
	);
	 port(
	  	 R : in STD_LOGIC_VECTOR(NUM_BITS downto 0); 
	 	 X2 : in STD_LOGIC_VECTOR(NUM_BITS downto 0);
		 c_1  : in STD_LOGIC; 
		 c_2  : in STD_LOGIC; 
		 toV    : out STD_LOGIC_VECTOR(NUM_BITS downto 0)	-- U = x/y mod Fx,
	     );
end;
----------------------------------------------------------------------------------------------------
architecture behave of celda_V is		
----------------------------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------			
-- Finite state machine 
----------------------------------------------------------------------------------------------------
toV <= X2 when c_1 = '0' and c_2 = '0' else
	   (others => '0') when c_1 = '0' and c_2 = '1' else
		R;
				
end behave;