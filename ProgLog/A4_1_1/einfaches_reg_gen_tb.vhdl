library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY einfaches_reg_gen_tb IS
END einfaches_reg_gen_tb;

ARCHITECTURE behavior OF einfaches_reg_gen_tb IS

COMPONENT einfaches_reg_gen
	GENERIC (N: integer := 4);
	PORT( CLK, CLR : IN std_logic;
	      LD : IN std_logic_vector (N-1 downto 0);
	      D : IN std_logic_vector (N-1 downto 0);
	      Q : OUT std_logic_vector (N-1 downto 0)	
     	);
END COMPONENT;
	
CONSTANT X : integer := 4; 
SIGNAL s_LD : std_logic_vector (X-1 downto 0);
SIGNAL s_D : std_logic_vector (X-1 downto 0); 
SIGNAL s_CLK : std_logic := '0'; 
SIGNAL s_CLR : std_logic := '1'; 
SIGNAL s_Q : std_logic_vector (X-1 downto 0);

BEGIN
	reg_map : einfaches_reg_gen
	GENERIC MAP (N => X)
	Port Map(LD => s_LD,
		 D => s_D,
		 CLK => s_CLK,
		 CLR => s_CLR,
		 Q => s_Q
		); 

	s_CLR <= '1' after 0 ns, '0' after 10 ns; 

	clock_stim : PROCESS
	BEGIN
		s_CLK <= '0'; wait for 10 ns;
		s_CLK <= '1'; wait for 10 ns;
	END PROCESS;

	LD_stim : PROCESS
	BEGIN
		s_LD <= "0000"; wait for 25 ns;
		s_LD <= "0000"; wait for 25 ns;
		s_LD <= "1111"; wait for 25 ns;
		s_LD <= "1111"; wait for 25 ns;
	END PROCESS;

	D_stim : PROCESS
	BEGIN
		s_D <= "0000"; wait for 25 ns;
		s_D <= "1111"; wait for 25 ns;
		s_D <= "0000"; wait for 25 ns;
		s_D <= "1111"; wait for 25 ns;
	END PROCESS;

END behavior;
