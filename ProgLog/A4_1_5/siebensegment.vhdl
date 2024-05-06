library ieee;
use ieee.std_logic_1164.all;

entity siebensegment is --low active sieben segment!
	port(
		LTN, BLN, HB : IN std_logic;
		B : IN std_logic_vector (3 downto 0);
		seg: OUT std_logic_vector (0 to 6)
	);
end siebensegment; 

architecture beh of siebensegment is

begin
	process(LTN, BLN, HB, B)
	begin
		if(LTN = '0' and BLN = '1') then
			seg <= "0000000";
		elsif(LTN = '0' and BLN = '0') then
			seg <= "1111111";
		else
			if(HB = '0') then
				case B is
					when "0000" => seg <= "0000001"; --0
					when "0001" => seg <= "1001111"; --1
					when "0010" => seg <= "0010010"; --2
					when "0011" => seg <= "0000110"; --3
					when "0100" => seg <= "1001100"; --4
					when "0101" => seg <= "0100100"; --5
					when "0110" => seg <= "0100000"; --6
					when "0111" => seg <= "0001111"; --7
					when "1000" => seg <= "0000000"; --8
					when "1001" => seg <= "0000100"; --9
					when "1010" => seg <= "0000010"; --A
					when "1011" => seg <= "1100000"; --B
					when "1100" => seg <= "0110001"; --C
					when "1101" => seg <= "1000010"; --D
					when "1110" => seg <= "0110000"; --E
					when "1111" => seg <= "0111000"; --F
					when others => seg <= "1111111";
				end case;
			else
				case B is
					when "0000" => seg <= "0000001"; --0
					when "0001" => seg <= "1001111"; --1
					when "0010" => seg <= "0010010"; --2
					when "0011" => seg <= "0000110"; --3
					when "0100" => seg <= "1001100"; --4
					when "0101" => seg <= "0100100"; --5
					when "0110" => seg <= "0100000"; --6
					when "0111" => seg <= "0001111"; --7
					when "1000" => seg <= "0000000"; --8
					when "1001" => seg <= "0000100"; --9
					when "1010" => seg <= "1111111"; --A
					when "1011" => seg <= "1111111"; --B
					when "1100" => seg <= "1111111"; --C
					when "1101" => seg <= "1111111"; --D
					when "1110" => seg <= "1111111"; --E
					when "1111" => seg <= "1111111"; --F
					when others => seg <= "1111111";
				end case;
			end if;
		end if;
	end process;
end beh;
