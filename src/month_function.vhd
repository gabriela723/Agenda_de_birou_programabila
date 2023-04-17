library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;  

entity days_in_month is
	port( month_in : in integer;  
		c_year: in integer;
	days_nr: out integer:=0);
end entity;

architecture Days_In_Month_combinatorial of days_in_month is

   signal month_30d : std_logic;
   signal month_28d : std_logic;
   signal month_31d : std_logic;
   signal month_29d : std_logic; 
   signal bisect: std_logic;
   
 	component an_bisect is 
	port( year : in integer;
	bisect: out std_logic);
end component ;
begin
	
   c1: an_bisect port map (c_year, bisect);
   month_30d <= '1' when month_in = 9 or
                         month_in= 4 or
                         month_in = 6 or
                         month_in = 11 
                    else '0';

   month_28d <= '1' when month_in = 2 and
                         bisect= '0'
                    else '0';
   month_29d <= '1' when month_in= 2 and
                         bisect = '1'
                    else '0';
   month_31d <= '1' when month_30d = '0' and
                         month_28d = '0' and
                         month_29d = '0'
                    else '0';
	days_nr <= 	30 when month_30d = '1' else
				28 when month_28d = '1' else 
				29 when month_29d = '1' else  
				31 when month_31d = '1' else   
				0;
	

end architecture Days_In_Month_combinatorial;