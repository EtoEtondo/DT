library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arithmetik is
	port(
		x, y : IN std_logic_vector (3 downto 0);
		AS : IN std_logic;
		C_OUT: OUT std_logic;
		sd : OUT std_logic_vector (3 downto 0)
	);
end arithmetik; 

architecture beha of arithmetik is

signal sc : std_logic_vector (2 downto 0);
signal sas, temp_yas : std_logic_vector (3 downto 0);

begin

sas <= (others => AS); -- Addierer/Subtrahierer
temp_yas <= y xor sas;


A1: for i in 0 to 3 generate
	A2: if i = 0 generate --start
		A22: entity work.fulladd
		port map(x(i), temp_yas(i), as, sd(i), sc(i));
	end generate A2;

	A4: if i = 3 generate --ende
		A44: entity work.fulladd
		port map(x(i), temp_yas(i), sc(2), sd(i), C_OUT);
	end generate A4;

	A3: if (i<3 and i>0) generate --mitte
		A33: entity work.fulladd
		port map(x(i), temp_yas(i), sc(i-1), sd(i), sc(i));
	end generate A3;
end generate A1;
	
end beha;
