entity tb_parity is
end tb_parity;

architecture testbench of tb_parity is

	component Parity4x
		port(	x0, x1, x2, x3	: in bit;
			podd				: out bit_vector(4 downto 0)
		);
	end component;
	
	component P_Checker
		port(	data	:	in bit_vector(4 downto 0);
			check	:	out bit
		);
	end component;
	
	signal input_p_checker			: bit_vector(4 downto 0);
	signal tmp_output_p_generator	: bit_vector(4 downto 0);
	signal output_p_checker			: bit;
	
begin
	
	eins : Parity4x
	port map(x3 => input_p_checker(3),
				x2 => input_p_checker(2),
				x1 => input_p_checker(1),
				x0 => input_p_checker(0),
				podd => tmp_output_p_generator
	);
	
	zwei : P_Checker
	port map(data => input_p_checker,
				check => output_p_checker
	);
	
	
	input_p_checker <= "00000" after 0ns, "00001" after 40ns, "00010" after 80ns, "00011" after 120ns, 
							 "00100" after 160ns, "00101" after 200ns, "00110" after 240ns, "00111" after 280ns, 
							 "01000" after 320ns, "01001" after 360ns, "01010" after 400ns, "01011" after 440ns, 
							 "01100" after 480ns, "01101" after 520ns, "01110" after 560ns, "01111" after 600ns;
							 
end testbench;