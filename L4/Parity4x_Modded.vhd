library ieee;
use ieee.std_logic_1164.all;

entity Parity4x_Modded IS

	port(x3, x2, x1, x0 : in std_logic;
	     y   : out std_logic_vector(4 downto 0)
		  );
			
end Parity4x_Modded;
	
architecture Parity of Parity4x_Modded IS	

	signal a, b, c					:std_logic :='X';
	signal in0, in1, in2, in3 	:boolean;
	signal sig1, sig2				:boolean;
	signal g1, g2, g3				:boolean;

	
	Begin
		in0  <= x0'stable(3ns);
		in1  <= x1'stable(3ns);
		g1	  <= in0 and in1;
		
		in2  <= x2'stable(3ns);
		sig1 <= a'stable(3ns);
		g2	  <= in2 and sig1;
		
		in3  <= x3'stable(3ns);
		sig2 <= b'stable(3ns);
		g3	  <= in3 and sig2;

		process(g1)
		begin
			if(g1=false and g1'event) then
				a <= 'X' after 5ns;
			else	
				a <= x0 xnor x1 after 5ns;
			end if;
		end process;
		
		process(g2)
		begin
			if(g2=false and g2'event) then
				b <='X' after 5ns;
			else
				b <= x2 xnor a after 5ns;
			end if;
		end process;
	
		process(g3)
		begin
			if(g3=false and g3'event) then
				c <='X' after 5ns;
			else			
				c <= x3 xnor b after 5ns;
			end if;
		end process;
		y	<= c & x3 & x2 & x1 & x0;	
	 
end Parity;