library ieee;
use ieee.std_logic_1164.all;

entity piso is
	generic(N: integer := 4);
	port(
	CLK, CLR : IN std_logic;
	P_INP : IN std_logic_vector (N-1 downto 0);
	S_OUT: OUT std_logic
	);
end piso;

architecture behavior of piso is

signal temp : std_logic_vector (N-1 downto 0);
signal q_int : std_logic;

begin
	process(CLR, CLK)
	variable counter: integer := 0;
	begin
		if (CLR='1') then
			counter:=0;
			q_int <= '0';
			temp <= (others => '0');
		elsif (rising_edge(CLK)) then
			q_int <= temp(N-1);
			if(counter MOD N = 0) then
				counter:=0;
				temp <= P_INP; --laden
			else
				temp <= temp(N-2 downto 0) & '0'; --shiften beim tackt quelle: embdev.net
			end if;
			counter:=counter+1;		
		end if;
	end process;
	S_OUT <= q_int;
end behavior;
