library ieee;
use ieee.std_logic_1164.all;

entity tb_delays is
end tb_delays;

architecture ablauf of tb_delays is

	component delta_delays
		port( x	: in std_logic;
				clk: in std_logic;
				rst: in std_logic;
				y	: out std_logic :='0'
				);
	end component;
	
	signal X, CLK, RST, Y	: std_logic :='0';
	
begin
	
	dut: delta_delays
		port map( x 	=> X,
					 clk	=> CLK,
					 rst	=> RST,
					 y		=> Y
					);
		
	RST 	<= '1' after 0ps, '0' after 160ps;
	
	CLK 	<= not CLK after 50ps;
	
	X		<= not X after 210ps;
				
end ablauf;