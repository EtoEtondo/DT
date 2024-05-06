entity tb_Mux2x1 is
end tb_Mux2x1;

architecture testbench of tb_Mux2x1 is
	component Mux2x1
	port(	ia, ib		: in bit;
			s				: in bit;
			e				: in bit;
			y1, y2, y3	: out bit);
	end component;
	
	signal ia	: bit := '0';
	signal ib	: bit := '0';
	signal s		: bit := '0';
	signal e		: bit := '0';
	signal y1	: bit;
	signal y2	: bit;
	signal y3	: bit;
	
	signal input: bit;
	signal output1: bit;
	signal output2: bit;
	signal output3: bit;
	
begin
	dut: Mux2x1
	port map(	ia => ia,
					ib => ib,
					s 	=> s,
					e  => e,
					y1 => y1,
					y2 => y2,
					y3 => y3);
					
	ia <= '0' after 0ns, '1' after 40ns, '0' after 80ns, '1' after 120ns, 
		   '0' after 160ns, 	'1' after 200ns, 	'0' after 240ns, 	'1' after 280ns,
			'0' after 320ns, 	'1' after 360ns, 	'0' after 400ns, 	'1' after 440ns, 
		   '0' after 480ns, 	'1' after 520ns, 	'0' after 560ns, 	'1' after 600ns,
			'1' after 640ns;
			
	ib <= '0' after 0ns, 	'0' after 40ns, 	'1' after 80ns, 	'1' after 120ns, 
		   '0' after 160ns, 	'0' after 200ns, 	'1' after 240ns, 	'1' after 280ns,
			'0' after 320ns, 	'0' after 360ns, 	'1' after 400ns, 	'1' after 440ns, 
		   '0' after 480ns, 	'0' after 520ns, 	'1' after 560ns, 	'1' after 600ns,
			'1' after 640ns;
			
	s <=  '0' after 0ns, 	'0' after 40ns, 	'0' after 80ns, 	'0' after 120ns, 
		   '1' after 160ns, 	'1' after 200ns, 	'1' after 240ns, 	'1' after 280ns,
			'0' after 320ns, 	'0' after 360ns, 	'0' after 400ns, 	'0' after 440ns, 
		   '1' after 480ns, 	'1' after 520ns, 	'1' after 560ns, 	'1' after 600ns,
			'1' after 640ns;
			
	e <=  '0' after 0ns, 	'0' after 40ns, 	'0' after 80ns, 	'0' after 120ns, 
		   '0' after 160ns, 	'0' after 200ns, 	'0' after 240ns, 	'0' after 280ns,
			'1' after 320ns, 	'1' after 360ns, 	'1' after 400ns, 	'1' after 440ns, 
		   '1' after 480ns, 	'1' after 520ns, 	'1' after 560ns, 	'1' after 600ns,
			'1' after 640ns;
			
	input <= '0' after 0ns, '1' after 360ns, '0' after 400ns, '1' after 440ns, 
				'0' after 480ns, '1' after 560ns, '0' after 640ns;
				
	output1 <= y1 XOR input; 
	output2 <= y2 XOR input;
	output3 <= y3 XOR input;
end testbench;