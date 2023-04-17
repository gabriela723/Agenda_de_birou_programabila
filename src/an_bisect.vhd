library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;  

entity an_bisect is 
	port( year : in integer;
	bisect: out std_logic);
end entity ;

architecture  arhi_bisect of an_bisect is 	
begin 
	process(year) 
	begin 
		if((year mod 4) = 0 and (year mod 100) > 0 )  then bisect <= '1'; 
			else if ( (year mod 400) = 0	) then bisect <= '1';
		else bisect <='0';
		end if;	
		end if;
	end process;  
end architecture ;