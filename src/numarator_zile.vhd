library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity	counter_day is	
	port(CLK_day: in std_logic;
	RST_day: in std_logic;
	val: in integer ;
	carry_day: out std_logic; 
	paralel: in std_logic;
	iesire:out integer;
	year: in integer;
	month: in integer);
end entity ; 

architecture arhi_day of counter_day is
signal numara : std_logic_vector (4 downto 0) := (others=>'0');
signal semnal : std_logic := '0';
signal nr_zile : std_logic_vector(4 downto 0) := (others=>'0');
signal nr : integer := 0;

component days_in_month is
	port( month_in : in integer;  
		c_year: in integer;
	days_nr: out integer);
end component;


begin 
	c1: days_in_month port map (month, year, nr);	
	process(nr)	
	begin
	 nr_zile <= std_logic_vector(to_unsigned(nr, 5));
	 end process;
	iesire <= to_integer(unsigned(numara));	
	carry_day <= semnal;
	process(CLK_day, RST_day , paralel)
	begin 
		if RST_day = '1' then numara <= "00000" ; 
		else if	paralel = '1' then   numara <= std_logic_vector(to_unsigned(val, 5));
		else if ( clk_day'event and clk_day='1') then numara <= numara + '1'; 
			if(numara = nr_zile ) then semnal <= '1' ; numara<= "00001"; 
			else semnal <= '0';
			end if;	
		end if ;
		end if;	
		end if;
		
	
	end process;
	end architecture arhi_day;