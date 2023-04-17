library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity divizor_de_frecv is 
	port( CLK_100: in STD_LOGIC;
	CLK_1Hz:  out STD_LOGIC);
end entity ;

architecture arhi of divizor_de_frecv is 
signal c: std_logic := '0';
begin
process(CLK_100)
variable v: STD_LOGIC_VECTOR (26 downto 0 ) := (others => '0');
begin
	if CLK_100'EVENT and CLK_100='0' then 
		v:=v+1;
	end if;
	if v= "10111110101111000010000000" then c<= not CLK_100; v := (others => '0');
	else c <= CLK_100;
		end if;
end process; 
CLK_1Hz <= c;
end architecture ;