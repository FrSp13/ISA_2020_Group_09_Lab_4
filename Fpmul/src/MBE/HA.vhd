LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY HA IS

	PORT( a, b: IN STD_LOGIC;
		  s, cout: OUT STD_LOGIC);

END HA;

ARCHITECTURE Behavior OF HA IS

	BEGIN

		s <= a XOR b;
      cout <= (a AND b);
      
END Behavior;
