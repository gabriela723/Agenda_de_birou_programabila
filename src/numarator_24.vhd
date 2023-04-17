library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity  counter_24 is
	port( clk: in std_logic;
	val: in integer ;
	carry: out std_logic; 
	reset: in std_logic;
	paralel: in std_logic;
	iesire:out integer );
end entity ;

architecture arhi1 of counter_24 is  
signal numara : std_logic_vector (4 downto 0) := (others=>'0');
signal semnal : std_logic := '0';	
begin 
	
	iesire <= to_integer(unsigned(numara));	
	carry <= semnal;
	process(CLK, reset, paralel)
	begin 
		if reset = '1' then numara <= "00000" ; 
		else if	paralel = '1' then   numara <= std_logic_vector(to_unsigned(val, 5));
		else if ( clk'event and clk='1') then numara <= numara + '1';
			if(numara = "10111"  ) then semnal <= '1' ; numara<= "00000";
			else semnal <='0';
			end if;	
		end if ;
		end if;	
		end if;
		
	 --iesire <= to_integer(unsigned(numara));
	end process;
	end architecture arhi1;
			
