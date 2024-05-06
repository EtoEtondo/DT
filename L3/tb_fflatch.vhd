library ieee;
use ieee.std_logic_1164.ALL;

ENTITY tb_fflatch IS -- keine Schnittstellen
END tb_fflatch ;

ARCHITECTURE testbench OF tb_fflatch IS

COMPONENT dt_dflipflop
	PORT (D	:	in std_logic;
			clk:	in std_logic;
			Q	:	out std_logic
	);
END COMPONENT;

COMPONENT dt_dlatch
	PORT (D	:	in std_logic;
			E	:	in std_logic;
			Q	:	out std_logic
	);
END COMPONENT;

SIGNAL s_clk : std_logic := '0';
SIGNAL s_data: std_logic := '0';
SIGNAL out1	 : std_logic := '0';
SIGNAL out2	 : std_logic := '0';

BEGIN

dut : dt_dflipflop
PORT MAP ( D => s_data,
			 clk=> s_clk,
			 Q	 => out1
);

dut2: dt_dlatch
PORT MAP ( D => s_data,
			  E => s_clk,
			  Q => out2
);


clockstimuli : PROCESS

	BEGIN
		s_clk <= '0'; WAIT FOR 20 ns;
		s_clk <= '1'; WAIT FOR 20 ns;
		s_clk <= '1'; WAIT FOR 20 ns;
	END PROCESS ;

datastimuli : PROCESS
	BEGIN
		s_data <= '1'; WAIT FOR 10 ns;
		s_data <= '0'; WAIT FOR 10 ns;
		s_data <= '1'; WAIT FOR 10 ns;
	END PROCESS ;
END testbench ;