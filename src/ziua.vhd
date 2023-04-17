library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;

entity litere is	
port( 
	year: in integer;
    month: in integer;
	day: in integer;
	ziua: out string( 10 downto 1));
end entity;


architecture arhi_litere of litere is 
--static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4}; 
type secv is array( 0 to 11) of integer;

signal t : secv ; 
signal y: integer :=0;	
signal m: integer :=0;
signal d: integer :=0;
signal final: integer :=0 ;	
signal aux: integer:=0;	

begin 
	
t(0) <= 0;	
t(1) <= 3;
t(2) <= 2;
t(3) <= 5;
t(4) <= 0;
t(5) <= 3;
t(6) <= 5;
t(7) <= 1;
t(8) <= 4;
t(9) <= 6;
t(10)<= 2;
t(11)<= 4;

m<= month;
d<= day; 		
y <= year;	


process(y, m, d)
begin 		
	if(m < 3) then 
		aux <= -1;
	else aux<=year;
	end if;
  	if(m>0) then  final<=((aux+ aux/4- aux/100+ aux/400+ t(m-1)+d) mod 7);
	end if;

end process;

process(final) 		  
begin
	case final is
		when 0 => ziua <= "SUNDAY    ";
		when 1 =>	ziua<= "MONDAY    ";	
		when 2 =>	ziua<= "TUESDAY   ";
		when 3 =>	ziua <= "WEDNESDAY ";	
		when 4 =>	ziua <= "THURSDAY  ";	 
		when 5 =>	ziua <= "FRIDAY    ";  
		when others => ziua <= "SATURDAY  ";   
	end case; 	
end process;
end architecture ;