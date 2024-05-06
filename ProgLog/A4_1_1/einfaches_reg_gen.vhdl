library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY einfaches_reg_gen IS
	GENERIC (N: integer := 4);
	PORT(
	    CLK, CLR : IN std_logic;
	    LD : IN std_logic_vector (N-1 downto 0);
	    D : IN std_logic_vector (N-1 downto 0);
	    Q : OUT std_logic_vector (N-1 downto 0)
	    );
END einfaches_reg_gen;

ARCHITECTURE e_reg_gen OF einfaches_reg_gen IS

SIGNAL sig_and1, sig_and2, sig_or, q0 : std_logic_vector (N-1 downto 0);

BEGIN
	sig_and1 <= LD AND D;
        sig_and2 <= q0 AND NOT LD;
        sig_or <= sig_and1 OR sig_and2;

	Process(CLK, CLR)
	BEGIN
		IF(CLR = '1') then
			q0 <= (others => '0');
		ELSIF(CLK'event AND CLK = '1') then
			q0 <= sig_or;
		END IF;	
	END PROCESS;

	Q <= q0;

END e_reg_gen;
