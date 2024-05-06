Library IEEE;
use IEEE.STD_logic_1164.all;

entity tb_Parity4x_Modded is
end tb_Parity4x_Modded;

architecture testbench of tb_Parity4x_Modded is

	component Parity4x_Modded
		port(x3, x2, x1, x0 	: in std_logic;
			  y   				: out std_logic_vector(4 downto 0)
			 );		
	end component;	

	signal e0		: std_logic :='0';		
	signal e1		: std_logic :='0';
	signal e2		: std_logic :='0';
	signal e3		: std_logic :='0';
	signal output  : std_logic_vector(4 downto 0); 

begin

	dut1: Parity4x_Modded
	port map(x0	=> e0,
				x1	=> e1,
				x2	=> e2,
				x3	=> e3,
				y		=> output
				);
				  
	e0 <= '0' after 0ns,   '1' after 20ns,  '0' after 40ns,  '1' after 60ns,
			'0' after 80ns,  '1' after 100ns, '0' after 120ns, '1' after 140ns,
			'0' after 160ns, '1' after 180ns, '0'after 181ns, '1' after 182ns, '0'after 183ns, '1' after 184ns, '0'after 185ns, '1' after 186ns, '0' after 200ns, '1' after 220ns,
			'0' after 240ns, '1' after 260ns, '0' after 280ns, '1' after 300ns;
			
	e1 <= '0' after 0ns,   '1' after 40ns,  '0' after 80ns,  '1' after 120ns,
			'0' after 160ns, '1' after 200ns, '0' after 240ns, '1' after 280ns;
	
	e2 <= '0' after 0ns,   '1' after 80ns,	 '0' after 160ns, '1' after 240ns;
	  
	e3 <= '0' after 0ns,   '1' after 160ns;
	
		
end testbench;