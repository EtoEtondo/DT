library ieee;
use ieee.std_logic_1164.all;

entity piso_tb is
end piso_tb;

architecture beh of piso_tb is

component piso
	generic(N: integer := 4);
	port(
	CLK, CLR : IN std_logic;
	P_INP : IN std_logic_vector (N-1 downto 0);
	S_OUT: OUT std_logic
	);
end component;

constant X : integer := 4;
signal s_CLK : std_logic := '0';
signal s_CLR : std_logic := '1';
signal s_P_INP : std_logic_vector (X-1 downto 0) := "0000";
signal s_S_OUT: std_logic;

begin

	piso_map: piso
	generic map (N=>X)
	Port Map(CLK => s_CLK, 
		 CLR => s_CLR, 
		 P_INP => s_P_INP, 
		 S_OUT => s_S_OUT
		 );

	s_CLR <= '1' after 0 ns, '0' after 10 ns;

	clock_stim : process
	begin
		s_CLK <= '0'; wait for 10 ns;
		s_CLK <= '1'; wait for 10 ns;
	end PROCESS;

	serial_inp: process
	begin
		s_P_INP <= "1001"; wait for 80 ns;
		s_P_INP <= "0000"; wait for 80 ns;
		s_P_INP <= "1010"; wait for 80 ns;
	end process;

end beh;
