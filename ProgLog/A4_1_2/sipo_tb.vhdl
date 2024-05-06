library ieee;
use ieee.std_logic_1164.all;

entity sipo_tb is
end sipo_tb;

architecture beh of sipo_tb is

component sipo
	generic(N: integer := 4);
	port(
	CLK, CLR : IN std_logic;
	S_INP : IN std_logic;
	P_OUT: OUT std_logic_vector (N-1 downto 0)
	);
end component;

constant X : integer := 4;
signal s_CLK : std_logic := '0';
signal s_CLR : std_logic := '1';
signal s_S_INP : std_logic := '0';
signal s_P_OUT: std_logic_vector (X-1 downto 0);

begin

	sipo_map: sipo
	generic map (N=>X)
	Port Map(CLK => s_CLK, 
		 CLR => s_CLR, 
		 S_INP => s_S_INP, 
		 P_OUT => s_P_OUT
		 );

	s_CLR <= '1' after 0 ns, '0' after 10 ns;

	clock_stim : process
	begin
		s_CLK <= '0'; wait for 10 ns;
		s_CLK <= '1'; wait for 10 ns;
	end PROCESS;

	serial_inp: process
	begin
		s_S_INP <= '1'; wait for 20 ns;
		s_S_INP <= '0'; wait for 40 ns;
		s_S_INP <= '1'; wait for 40 ns;
		s_S_INP <= '0'; wait for 20 ns;
		s_S_INP <= '1'; wait for 20 ns;
		s_S_INP <= '0'; wait for 20 ns;
	end process;

end beh;
