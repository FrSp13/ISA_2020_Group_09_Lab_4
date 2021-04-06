LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FA IS

	PORT( a, b, cin: IN STD_LOGIC;
		  s, cout: OUT STD_LOGIC);

END FA;

ARCHITECTURE Behavior OF FA IS

	BEGIN

		s <= a XOR b XOR cin;
      cout <= (a AND b) OR (a AND cin) OR (b AND cin);

END Behavior;
