library ieee;
use ieee.std_logic_1164.ALL;

entity dt_dflipflop is
	port(	D	:	in std_logic;
			clk:	in std_logic;
			Q	:	out std_logic
	);
end dt_dflipflop;

architecture DFF of dt_dflipflop is
Begin
	process(clk)
		Begin
			if(clk='1' and clk'event) then
				Q	<=	D;
			end if;
	end process;
end DFF;