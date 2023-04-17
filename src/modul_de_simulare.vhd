library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity MS_agenda is 
end entity;

architecture arhi_MS_agenda of MS_agenda is	 
component agenda is  
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
	
end component; 	

signal CLK, RST, ST: std_logic;
signal h_alarma, m_alarma: integer;
signal m_init, h_init, d_init, mo_init, y_init: integer;
signal m_a, h_a, d_a, mo_a, y_a: integer;
signal tmp : integer;
signal al: std_logic;
signal day: string( 10 downto 1);

begin
	c1: agenda port map (CLK, RST, ST, h_alarma, m_alarma, m_init, h_init, d_init, mo_init, y_init, m_a, h_a, d_a, mo_a, y_a, tmp, al, day);
	RST <= '0';
	ST <='0', '1' after 50 ns, '0' after 100 ns;
	h_alarma <= 1;
	m_alarma <= 5;
	m_init <= 58;
	h_init <= 23;
	d_init <= 24;
	mo_init <= 5;
	y_init <= 2022;
	process
	begin  
		CLK<='0' ;
		wait for 50 ns;
		CLK<='1' ;
		wait  for 50 ns;
	end process;
	
end architecture ;
