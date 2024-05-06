library ieee;
use ieee.std_logic_1164.all;

entity halfadd is
	port(
		A, B : IN std_logic;
		S, C: OUT std_logic
	);
end halfadd; 

architecture verhalten of halfadd is

begin
	S <= A xor B;
	C <= A and B;
end verhalten;
