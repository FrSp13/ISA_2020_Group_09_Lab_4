LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dadda_Layer_2 IS

PORT(PP_in_0: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    PP_in_1: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    PP_in_2: IN STD_LOGIC_VECTOR(63 DOWNTO 2);

    PP_out_0: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    PP_out_1: OUT STD_LOGIC_VECTOR(63 DOWNTO 0));


END Dadda_Layer_2;

ARCHITECTURE Behavior OF Dadda_Layer_2 IS

  COMPONENT MCSA IS

    GENERIC(N : INTEGER); -- number of Full Adders
    PORT(FA_a_inputs: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         FA_b_inputs: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         FA_cin_inputs: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         FA_s_outputs : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         FA_cout_outputs : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);

         HA_a_inputs : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- HA(2) FA(N-1) FA(N-2) ... FA(0) HA(1) HA(0)
         HA_b_inputs : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         HA_s_outputs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         HA_cout_outputs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));

  END COMPONENT;

------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_0, FA_b_inputs_0, FA_cin_inputs_0 : STD_LOGIC_VECTOR(59 DOWNTO 0);
	SIGNAL FA_s_outputs_0, FA_cout_outputs_0: STD_LOGIC_VECTOR(59 DOWNTO 0);
  SIGNAL HA_a_inputs_0, HA_b_inputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HA_s_outputs_0, HA_cout_outputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);


	BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_0 <= PP_in_0(63 DOWNTO 4);
    FA_b_inputs_0 <= PP_in_1(63 DOWNTO 4);
  	FA_cin_inputs_0 <= PP_in_2(63 DOWNTO 4);
	  HA_a_inputs_0 <= '0' & PP_in_0(3 DOWNTO 2);
    HA_b_inputs_0 <= '0' & PP_in_1(3 DOWNTO 2);


    MCSA_0: MCSA GENERIC MAP(N => 60)
                 PORT MAP(FA_a_inputs => FA_a_inputs_0,
                          FA_b_inputs => FA_b_inputs_0,
                          FA_cin_inputs => FA_cin_inputs_0,
                          FA_s_outputs => FA_s_outputs_0,
                          FA_cout_outputs => FA_cout_outputs_0,
                          HA_a_inputs => HA_a_inputs_0,
                          HA_b_inputs => HA_b_inputs_0,
                          HA_s_outputs => HA_s_outputs_0,
                          HA_cout_outputs => HA_cout_outputs_0);

		PP_out_0(63 DOWNTO 2) <= FA_s_outputs_0 & HA_s_outputs_0(1 DOWNTO 0);
    PP_out_1(63 DOWNTO 3) <= FA_cout_outputs_0(58 DOWNTO 0) & HA_cout_outputs_0(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	PP_out_0(1 DOWNTO 0) <= PP_in_0(1 DOWNTO 0);

	PP_out_1(2 DOWNTO 0) <= PP_in_2(2) & PP_in_1(1 DOWNTO 0);


END Behavior;
