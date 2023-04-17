library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity comparator_ora is
	port( 
	ora_o: in integer ;
	ora_a: in integer ;	
	min_a: in integer ;
	min_o: in integer;
	validare: out std_logic);
end entity	;
	
architecture arhi_comp_ora of comparator_ora is 
signal val : std_logic := '0';
begin 
	process(ora_o, min_o,ora_a, min_a)
	begin
	if (ora_o = ora_a and min_o = min_a)
			then val <= '1';
		else val <= '0'; 
	end if;	
	
	end process;
	validare <= val;
end architecture ;
		