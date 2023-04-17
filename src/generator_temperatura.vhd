library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity generator is 
	port( Reset_temp: in std_logic;
	CLK_temp: in std_logic;
	TEMP: out integer);
end entity generator;

architecture arhi_temp of generator is

signal out_gen : std_logic_vector( 4 downto 0) :=(others=>'0');
signal feedback : std_logic;

begin
	feedback <= not (out_gen(4) xor out_gen(3));
	process(Reset_temp, CLK_temp)
	begin 
	if (reset_temp = '1') then out_gen <=  (others=>'0');
	else if (CLK_temp'event and CLK_temp='1') then out_gen <= out_gen (3 downto 0 ) & feedback;
	end if;
	end if;
	end process;
	TEMP <= to_integer(unsigned(out_gen));	
end architecture ;