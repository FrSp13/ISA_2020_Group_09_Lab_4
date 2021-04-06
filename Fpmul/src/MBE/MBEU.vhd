LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MBEU IS

	PORT(A: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		   selected_bits: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       output : OUT STD_LOGIC_VECTOR(32 DOWNTO 0);
       sign : BUFFER STD_LOGIC);

END MBEU;

ARCHITECTURE Behavior OF MBEU IS

  COMPONENT Mux IS

    PORT( in_00, in_01, in_10, in_11: IN STD_LOGIC_VECTOR(32 DOWNTO 0);
  		  sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(32 DOWNTO 0));

  END COMPONENT;

  SIGNAL shifted_2_A, extended_A, zeros_A, output_mux, sign_extension : STD_LOGIC_VECTOR(32 DOWNTO 0);
  SIGNAL mux_sel, sign_extension_mux : STD_LOGIC_VECTOR(1 DOWNTO 0);

	BEGIN

    shifted_2_A <= A & '0';
    extended_A <= '0' & A;
    zeros_A <= (OTHERS => '0');

	sign_extension_mux <= (OTHERS => sign);
    mux_sel <= selected_bits(1 DOWNTO 0) XOR sign_extension_mux;
    sign <= selected_bits(2);

		Multiplexer: Mux PORT MAP(in_00 => zeros_A,
                              in_01 => extended_A,
                              in_10 => extended_A,
                              in_11 => shifted_2_A,
                              sel => mux_sel,
                              output => output_mux);

	sign_extension <= (OTHERS => sign);
	output <= output_mux XOR sign_extension;

END Behavior;
