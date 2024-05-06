entity Parity4x is
	port(	x0, x1, x2, x3	: in bit;
			podd				: out bit_vector(4 downto 0));
end Parity4x;

architecture Parity of Parity4x is
signal odd		: bit;

Begin
	odd <= not(x3 XOR x2 XOR x1 XOR x0);
	podd <= odd & x3 & x2 & x1 & x0;
end parity;