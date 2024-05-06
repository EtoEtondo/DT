library ieee;
use ieee.std_logic_1164.ALL;

entity sreg8x is
	port(	data	:	in std_logic_vector(7 downto 0);--paralleles laden
			S		:	in std_logic_vector(1 downto 0);--steuereingänge
			input, EN:	in std_logic;							--verschiebungsbit ob seriell oder normal
			Q		:	out std_logic_vector(7 downto 0)--ausgänge
	);
end sreg8x;

architecture sr of sreg8x is
	signal clk	: std_logic := '0';
	signal Q_Q	: std_logic_vector(7 downto 0) := "00000000";
	signal en_in: std_logic;

Begin
	clk <= not clk after 10ns;
	en_in <= input and EN;
	
	process(clk)
	begin
		if(clk = '1' and clk'event) then
			case s is
				when "00" => Q_Q <= Q_Q;--nop
				
				when "01" => Q_Q <= data;--paralleles laden
				
				when "10" =>Q_Q(7) <= Q_Q(6);--rechts schieben
								Q_Q(6) <= Q_Q(5);								
								Q_Q(5) <= Q_Q(4);
								Q_Q(4) <= Q_Q(3);
								Q_Q(3) <= Q_Q(2);
								Q_Q(2) <= Q_Q(1);
								Q_Q(1) <= Q_Q(0);
								Q_Q(0) <= en_in;

				when "11" =>Q_Q(0) <= Q_Q(1);--links schieben
								Q_Q(1) <= Q_Q(2);								
								Q_Q(2) <= Q_Q(3);
								Q_Q(3) <= Q_Q(4);
								Q_Q(4) <= Q_Q(5);
								Q_Q(5) <= Q_Q(6);
								Q_Q(6) <= Q_Q(7);
								Q_Q(7) <= en_in;
			end case;
		end if;
	end process;
	Q <= Q_Q;
end sr;