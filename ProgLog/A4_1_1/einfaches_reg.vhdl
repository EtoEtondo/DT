library ieee;
use ieee.std_logic_1164.all;

ENTITY einfaches_reg IS
	PORT(
	    LD, D, CLK, CLR : IN std_logic;
	    Q, nQ : OUT std_logic
	    );
END einfaches_reg;

ARCHITECTURE e_reg OF einfaches_reg IS

SIGNAL sig_and1, sig_and2, sig_or, q0 : std_logic;

BEGIN
	sig_and1 <= LD AND D;
        sig_and2 <= q0 AND NOT LD;
        sig_or <= sig_and1 OR sig_and2;

	Process(CLK, CLR)
	BEGIN
		IF(CLR = '1') then
			q0 <= '0';
		ELSIF(CLK'event AND CLK = '1') then
			q0 <= sig_or;
		END IF;	
	END PROCESS;

	Q <= q0;
	nQ <= NOT q0;

END e_reg;
