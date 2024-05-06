entity P_checker is
	port(	data	:	in bit_vector(4 downto 0);
			check	:	out bit
	);
end P_checker;




architecture check of P_checker is
		
	component Parity4x is
		port(	x3, x2, x1, x0	:	in bit;
				podd				:	out bit_vector(4 downto 0)
		);
	end component;
	
	
	
	
	
	
	
	signal tmp					: bit_vector(4 downto 0); --um den ausgang von podd später
																	  --als ausgang nutzen zu können
	begin
		P_checker_MSB: Parity4x
			port map( x3 	=> data(3),
						 x2 	=> data(2),
						 x1 	=> data(1),
						 x0 	=> data(0),
						 podd	=> tmp
			);
	check		<= tmp(4) XOR data(4);
	
end check;