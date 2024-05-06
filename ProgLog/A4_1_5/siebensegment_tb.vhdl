library ieee;
use ieee.std_logic_1164.all;

ENTITY siebensegment_tb IS
END siebensegment_tb;

ARCHITECTURE behavior OF siebensegment_tb IS

COMPONENT siebensegment
	port(
		LTN, BLN, HB : IN std_logic;
		B : IN std_logic_vector (3 downto 0);
		seg: OUT std_logic_vector (0 to 6)
	);
END COMPONENT;
	
SIGNAL s_LTN : std_logic := '0';
SIGNAL s_BLN : std_logic := '0'; 
SIGNAL s_HB : std_logic := '0'; 
SIGNAL s_B : std_logic_vector (3 downto 0) := "0000"; 
SIGNAL s_seg : std_logic_vector (0 to 6);

BEGIN
	seg_map : siebensegment
	port map(LTN => s_LTN,
		 BLN => s_BLN,
		 HB => s_HB,
		 B => s_B,
		 seg => s_seg
		); 

	s_LTN <= '0' after 0 ns, '1' after 20 ns;
	s_BLN <= '1' after 0 ns, '0' after 10 ns;
	s_HB <= '0' after 0 ns, '1' after 100 ns;
	s_B <= "1111" after 0 ns, "1001" after 50 ns, "0100" after 100 ns;

END behavior;
