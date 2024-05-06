library ieee;
use ieee.std_logic_1164.all;

entity delta_delays is
	port( x	: in std_logic;
			clk: in std_logic;
			rst: in std_logic;
			y	: out std_logic :='0'
			);
end delta_delays;

architecture aufbau of delta_delays is


signal a, b			: std_logic :='0';
signal c				: std_logic :='1';

begin

	process(clk)
	begin
		if(clk='1' and clk'event) then
			a <= x;
		end if;
	end process;
	
	c <= a xnor b;										
	
	process(clk, rst)
	begin
		if(rst='1') then
			b <= '0';
		elsif(clk='1' and clk'event) then
			b <= c;
		end if;
	end process;
	
	y <= b;
	
end aufbau;