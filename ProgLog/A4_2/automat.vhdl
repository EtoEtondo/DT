LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY automat IS
	PORT ( clk, reset, x : IN std_logic;
			y : OUT std_logic);
END ENTITY;

ARCHITECTURE beh OF automat IS
TYPE Zustaende IS (a,b,c,d,e,f,g,h);
SIGNAL Zustand, Folgezustand: Zustaende;

BEGIN
	Zustandsspeicher: PROCESS (clk,reset)
	BEGIN
		IF (reset = '1') THEN
			Zustand <= a;
		ELSIF (rising_edge(clk)) THEN
			Zustand <= Folgezustand; 
		END IF;
	END PROCESS Zustandsspeicher;
	
	Uebergang: PROCESS (x,Zustand)
	BEGIN
		CASE Zustand IS
			WHEN a => IF x='1' THEN Folgezustand <= f;
					  ELSE Folgezustand <= b;
					  END IF;
			WHEN b => IF x='1' THEN Folgezustand <= c;
					  ELSE Folgezustand <= b;
					  END IF;
			WHEN c => IF x='0' THEN Folgezustand <= d;
					  ELSE Folgezustand <= g;
					  END IF;
			WHEN d => IF x='0' THEN Folgezustand <= e;
					  ELSE Folgezustand <= c;
					  END IF;
			WHEN e => IF x='0' THEN Folgezustand <= b;
					  ELSE Folgezustand <= f;
					  END IF;
			WHEN f => IF x='1' THEN Folgezustand <= g;
					  ELSE Folgezustand <= b;
					  END IF;
			WHEN g => IF x='1' THEN Folgezustand <= h;
					  ELSE Folgezustand <= b;
					  END IF;
			WHEN h => IF x='1' THEN Folgezustand <= h;
					  ELSE Folgezustand <= e;
					  END IF;
			WHEN OTHERS => Folgezustand <= a; -- verhindert Blockierung
		END CASE;
	END PROCESS Uebergang;

	Ausgang: PROCESS (Zustand) 
	BEGIN
		CASE Zustand IS
			WHEN e => y <= '1';
			WHEN OTHERS => y <= '0';
		END CASE;
	END PROCESS Ausgang;

END beh;