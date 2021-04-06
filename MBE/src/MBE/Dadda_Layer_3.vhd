LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dadda_Layer_3 IS

PORT(PP_in_0: IN STD_LOGIC_VECTOR(61 DOWNTO 0);
    PP_in_1: IN STD_LOGIC_VECTOR(62 DOWNTO 0);
    PP_in_2: IN STD_LOGIC_VECTOR(63 DOWNTO 2);
    PP_in_3: IN STD_LOGIC_VECTOR(63 DOWNTO 4);

    PP_out_0: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    PP_out_1: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    PP_out_2: OUT STD_LOGIC_VECTOR(63 DOWNTO 2));


END Dadda_Layer_3;

ARCHITECTURE Behavior OF Dadda_Layer_3 IS

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
	SIGNAL FA_a_inputs_0, FA_b_inputs_0, FA_cin_inputs_0 : STD_LOGIC_VECTOR(55 DOWNTO 0);
	SIGNAL FA_s_outputs_0, FA_cout_outputs_0: STD_LOGIC_VECTOR(55 DOWNTO 0);
  SIGNAL HA_a_inputs_0, HA_b_inputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HA_s_outputs_0, HA_cout_outputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);


	BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_0 <= PP_in_0(61 DOWNTO 6);
    FA_b_inputs_0 <= PP_in_1(61 DOWNTO 6);
  	FA_cin_inputs_0 <= PP_in_2(61 DOWNTO 6);
	  HA_a_inputs_0 <= PP_in_1(62) & PP_in_0(5 DOWNTO 4);
    HA_b_inputs_0 <= PP_in_2(62) & PP_in_1(5 DOWNTO 4);


    MCSA_0: MCSA GENERIC MAP(N => 56)
                 PORT MAP(FA_a_inputs => FA_a_inputs_0,
                          FA_b_inputs => FA_b_inputs_0,
                          FA_cin_inputs => FA_cin_inputs_0,
                          FA_s_outputs => FA_s_outputs_0,
                          FA_cout_outputs => FA_cout_outputs_0,
                          HA_a_inputs => HA_a_inputs_0,
                          HA_b_inputs => HA_b_inputs_0,
                          HA_s_outputs => HA_s_outputs_0,
                          HA_cout_outputs => HA_cout_outputs_0);

		PP_out_0(62 DOWNTO 4) <= HA_s_outputs_0(2) & FA_s_outputs_0 & HA_s_outputs_0(1 DOWNTO 0);
    PP_out_1(63 DOWNTO 5) <= HA_cout_outputs_0(2) & FA_cout_outputs_0 & HA_cout_outputs_0(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	PP_out_0(63) <= PP_in_2(63);
	PP_out_0(3 DOWNTO 0) <= PP_in_0(3 DOWNTO 0);

	PP_out_1(4 DOWNTO 0) <= PP_in_2(4) & PP_in_1(3 DOWNTO 0);

	PP_out_2(63 DOWNTO 2) <= PP_in_3(63 DOWNTO 6) & PP_in_2(5) & PP_in_3(4) & PP_in_2(3 DOWNTO 2);


END Behavior;
