library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
	port(
		A, B, C_IN : IN std_logic;
		S, C_OUT: OUT std_logic
	);
end fulladd; 

architecture beh of fulladd is
	
signal c1, c2 , sum : std_logic;

begin
	A1: entity work.halfadd
	port map(A, B, sum, c1);

	A2: entity work.halfadd
	port map(sum, C_IN, S, c2);

	C_OUT <= c1 or c2;
end beh;
