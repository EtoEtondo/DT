library ieee;
use ieee.std_logic_1164.ALL;

entity dt_dlatch is
	port(	D	:	in std_logic;
			E	:	in std_logic;
			Q	:	out std_logic
	);
end dt_dlatch;

architecture DL of dt_dlatch is
Begin
	process(D,E)
		Begin
			if(E='1') then
				Q	<=	D;
			end if;
	end process;
end DL;