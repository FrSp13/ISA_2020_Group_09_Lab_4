LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Mux IS

	PORT( in_00, in_01, in_10, in_11: IN STD_LOGIC_VECTOR(32 DOWNTO 0);
		  sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      output : OUT STD_LOGIC_VECTOR(32 DOWNTO 0));

END Mux;

ARCHITECTURE Behavior OF Mux IS

	BEGIN

		output <= in_00 WHEN sel = "00" ELSE
              in_01 WHEN sel = "01" ELSE
              in_10 WHEN sel = "10" ELSE
              in_11 WHEN sel = "11";

END Behavior;
