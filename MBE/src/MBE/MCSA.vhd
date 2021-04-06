LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MCSA IS

  GENERIC(N : INTEGER); -- number of Full Adders
	PORT(FA_a_inputs: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		   FA_b_inputs: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       FA_cin_inputs: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       FA_s_outputs : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       FA_cout_outputs : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);

       HA_a_inputs : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- structure: HA(2) FA(N-1) FA(N-2) ... FA(0) HA(1) HA(0)
       HA_b_inputs : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       HA_s_outputs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
       HA_cout_outputs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));

END MCSA;

ARCHITECTURE Behavior OF MCSA IS

  COMPONENT HA IS

    PORT( a, b: IN STD_LOGIC;
        s, cout: OUT STD_LOGIC);

  END COMPONENT;

  COMPONENT FA IS

    PORT( a, b, cin: IN STD_LOGIC;
        s, cout: OUT STD_LOGIC);

  END COMPONENT;


	BEGIN

  HA_2: HA PORT MAP(a => HA_a_inputs(2),
                        b => HA_b_inputs(2),
                        s => HA_s_outputs(2),
                        cout => HA_cout_outputs(2));

	FA_Generation: FOR i IN 0 TO N-1 GENERATE

		Full_adders: FA PORT MAP (a => FA_a_inputs(i),
										          b => FA_b_inputs(i),
                              cin => FA_cin_inputs(i),
                              s => FA_s_outputs(i),
                              cout => FA_cout_outputs(i));
  END GENERATE;

  HA_1: HA PORT MAP(a => HA_a_inputs(1),
                      b => HA_b_inputs(1),
                      s => HA_s_outputs(1),
                      cout => HA_cout_outputs(1));

  HA_0: HA PORT MAP(a => HA_a_inputs(0),
                        b => HA_b_inputs(0),
                        s => HA_s_outputs(0),
                        cout => HA_cout_outputs(0));

END Behavior;
