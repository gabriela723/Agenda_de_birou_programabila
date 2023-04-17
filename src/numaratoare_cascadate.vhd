library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity numaratoare is 
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
	
end entity ; 

architecture cascada of numaratoare is

signal carry_sec: std_logic;
signal carry_min:std_logic;
signal carry_ora:std_logic;
signal carry_zi: std_logic;
signal carry_luna: std_logic; 	 
signal reset_an:std_logic; 
signal CLK_bun: std_logic;

signal in_plus: integer;

component  counter_60 is
	port( clk: in std_logic;
	val: in integer ;
	carry: out std_logic; 
	reset: in std_logic;
	paralel: in std_logic;
	iesire:out integer );
end component ;

component counter_24 is
	port( clk: in std_logic;
	val: in integer ;
	carry: out std_logic; 
	reset: in std_logic;
	paralel: in std_logic;
	iesire:out integer );
end component ;

component	counter_day is	
	port(CLK_day: in std_logic;
	RST_day: in std_logic;
	val: in integer ;
	carry_day: out std_logic; 
	paralel: in std_logic;
	iesire:out integer;
	year: in integer;
	month: in integer);
end component; 

component   counter_month is
	port( clk: in std_logic;
	val: in integer ;
	carry: out std_logic; 
	reset: in std_logic;
	paralel: in std_logic;
	iesire: out integer);
end component ;

component   counter_year is
	port( clk: in std_logic;
	val: in integer ;
	carry: out std_logic; 
	reset: in std_logic;
	paralel: in std_logic;
	iesire: out integer);
end component ;	

component generator is 
	port( Reset_temp: in std_logic;
	CLK_temp: in std_logic;
	TEMP: out integer);
end component generator;

signal i1, i2, i3, i4, i5: integer;

begin													 
	c1: counter_60 port map (CLOCK_C, 0, carry_sec, RESET_C, START_C, in_plus);	   
	c2: counter_60 port map( carry_sec, min_init, carry_min, RESET_C, START_C,i1);
	c3: counter_24 port map (carry_min, ora_init, carry_ora	, RESET_C,START_C, i2);
	c4: counter_day port map(carry_ora, RESET_C, ziua_init, carry_zi, START_C, i3,i5, i4);
	c5: counter_month port map (carry_zi, luna_init, carry_luna, RESET_C, START_C, i4);
	c6: counter_year port map (carry_luna, an_init, reset_an ,RESET_C, START_C, i5);
	c7:	generator port map (RESET_C, carry_min, TEMPERATURA);
	min_o <= i1;
	ora_o <= i2;
	ziua_o <= i3;
	luna_o <= i4;
	an_o <= i5;
end architecture ;
	
