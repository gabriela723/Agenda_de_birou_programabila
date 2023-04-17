library	 IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity agenda is  
	port(
	CLK_ag: in std_logic;
	RESET_ag: in std_logic;
	START_ag: in std_logic;
	
	ora_alarma: in integer;
	min_alarma: in integer;
	
	min_initial: in integer;
	ora_initial: in integer;
	ziua_initial: in integer; 
	luna_initial: in integer;
	an_initial: in integer;
	
	min_out: out integer;
	ora_out: out integer;
	ziua_out: out integer;
	luna_out: out integer;
	an_out: out integer;
	temp: out integer;
	alarma: out std_logic;
	ziua: out string( 10 downto 1));
	
end entity ; 

architecture principal of agenda is	

signal ora_iesire: integer;
signal min_iesire: integer;

component numaratoare is 
	port(
	CLOCK_C: in std_logic;
	RESET_C: in std_logic;
	START_C: in std_logic;
	
	min_init: in integer;
	ora_init: in integer;
	ziua_init: in integer; 
	luna_init: in integer;
	an_init: in integer;
	
	min_o: out integer;
	ora_o: out integer;
	ziua_o: out integer;
	luna_o: out integer;
	an_o: out integer;
	
	TEMPERATURA: out integer);
	
end component;

component comparator_ora is
	port( 
	ora_o: in integer ;
	ora_a: in integer ;	
	min_a: in integer ;
	min_o: in integer;																																
	validare: out std_logic);
end component;

component litere is
	port( 
	year: in integer;
	month: in integer;
	day: in integer;
	ziua: out string( 10 downto 1));
end component;

	signal s1, s2, s3: integer;

begin  

	c1:numaratoare port map (CLK_ag	, RESET_ag, START_ag, min_initial, ora_initial, ziua_initial, luna_initial, an_initial, min_iesire, ora_iesire, s1, s2, s3, TEMP);
	c2:comparator_ora port map (ora_iesire, ora_alarma, min_alarma	, min_iesire, alarma);	
	c5: litere port map ( s3, s2, s1, ziua);
	ziua_out <= s1;	
	luna_out <= s2 ;
	an_out <= s3;
	ora_out <= ora_iesire;
	min_out <= min_iesire;
end architecture ;