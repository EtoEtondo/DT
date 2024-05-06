library ieee;
use ieee.std_logic_1164.all;

ENTITY einfaches_reg_tb IS
END einfaches_reg_tb;

ARCHITECTURE behavior OF einfaches_reg_tb IS

COMPONENT einfaches_reg
	PORT( LD, D, CLK, CLR : IN std_logic;
	      Q, nQ : OUT std_logic	
     	);
END COMPONENT;
	
SIGNAL s_LD : std_logic := '0';
SIGNAL s_D : std_logic := '0'; 
SIGNAL s_CLK : std_logic := '0'; 
SIGNAL s_CLR : std_logic := '1'; 
SIGNAL s_Q, s_nQ : std_logic;

BEGIN
	reg_map : einfaches_reg
	port map(LD => s_LD,
		 D => s_D,
		 CLK => s_CLK,
		 CLR => s_CLR,
		 Q => s_Q,
		 nQ => s_nQ
		); 

	s_CLR <= '1' after 0 ns, '0' after 10 ns; 

	clock_stim : PROCESS
	BEGIN
		s_CLK <= '0'; wait for 10 ns;
		s_CLK <= '1'; wait for 10 ns;
	END PROCESS;

	LD_stim : PROCESS
	BEGIN
		s_LD <= '0'; wait for 25 ns;
		s_LD <= '0'; wait for 25 ns;
		s_LD <= '1'; wait for 25 ns;
		s_LD <= '1'; wait for 25 ns;
	END PROCESS;

	D_stim : PROCESS
	BEGIN
		s_D <= '0'; wait for 25 ns;
		s_D <= '1'; wait for 25 ns;
		s_D <= '0'; wait for 25 ns;
		s_D <= '1'; wait for 25 ns;
	END PROCESS;

END behavior;
