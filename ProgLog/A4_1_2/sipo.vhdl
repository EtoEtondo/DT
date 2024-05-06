library ieee;
use ieee.std_logic_1164.all;

entity sipo is
	generic(N: integer := 4);
	port(
	CLK, CLR : IN std_logic;
	S_INP : IN std_logic;
	P_OUT: OUT std_logic_vector (N-1 downto 0)
	);
end sipo;

architecture behavior of sipo is

signal q_int, temp : std_logic_vector (N-1 downto 0);

begin
	process(CLR, CLK)
	variable counter: integer := 0;
	begin
		if (CLR='1') then
			counter:=0;
			--S_INP <= '0';
			q_int <= (others => '0');
		elsif (rising_edge(CLK)) then
			if(counter=4) then
				q_int <= temp;
				counter:=0;
			end if;
			temp <= temp(N-2 downto 0) & S_INP;
			counter:=counter+1;
		end if;
	end process;
	P_OUT <= q_int;
end behavior;
