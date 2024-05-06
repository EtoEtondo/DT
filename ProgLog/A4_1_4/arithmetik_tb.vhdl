library ieee;
use ieee.std_logic_1164.all;

entity arithmetik_tb is
end arithmetik_tb;

architecture verh of arithmetik_tb is

signal s_x, s_y : std_logic_vector(3 downto 0) := "0000";
signal s_AS : std_logic := '0';
signal s_sd : std_logic_vector(3 downto 0);
signal s_C_OUT : std_logic;

begin

	A: entity work.arithmetik
	port map(s_x, s_y, s_AS, s_C_OUT, s_sd);

	s_AS <= '0' after 0 ns, '1' after 200 ns;
	s_x <= "0000" after 0 ns, "0001" after 50 ns, "1111" after 150 ns, "1001" after 200 ns, "1100" after 250 ns, "1101" after 300 ns;
	s_y <= "1111" after 0 ns, "0011" after 50 ns, "0001" after 150 ns, "1001" after 200 ns, "0010" after 250 ns, "1100" after 300 ns;

end verh;
