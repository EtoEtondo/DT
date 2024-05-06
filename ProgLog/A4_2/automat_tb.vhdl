LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity automat_tb is
end automat_tb;

architecture ver of automat_tb is
	
SIGNAL s_clk, s_reset, s_x: std_logic := '0';
SIGNAL s_y : std_logic;
	
begin
	at: entity work.automat
	port map(s_clk, s_reset, s_x, s_y);
	
	s_reset <= '1' after 0 ns, '0' after 5 ns;
	
	clock_stim : PROCESS
	BEGIN
		s_clk <= '0'; wait for 10 ns;
		s_clk <= '1'; wait for 10 ns;
	END PROCESS;
	
	s_x <= '1' after 0 ns, '0' after 60 ns, '1' after 100 ns, '0' after 120 ns;
	
END ver;
