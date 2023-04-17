library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity reg_ora is
	port( RESET_reg, LOAD_reg, CLK_reg : in std_logic;
	ora_intrare: in integer;
	ora_alarma: out std_logic_vector(5 downto 0);
	min_intrare: in integer;
	min_alarma: out std_logic_vector(5 downto 0));
end entity ;

architecture arhi_reg_ora of reg_ora is	
type alarma is array (0 to 1) of std_logic_vector( 5 downto 0);
signal r : alarma  := (others =>"000000") ;
begin  
	process(LOAD_reg, CLK_reg) 
	begin 
		if(RESET_reg ='1') then r(0) <= "000000"; r(1) <= "000000";
		else if (CLK_reg'event and CLK_reg='1') then
		if( LOAD_reg ='1') then r(0) <= std_logic_vector(to_unsigned(ora_intrare, 6)); r(1) <= std_logic_vector(to_unsigned(min_intrare, 6));
		end if;	
		end if;
		end if;
end process;
ora_alarma <= r(0);
min_alarma <= r(1);
end architecture ;
	
	