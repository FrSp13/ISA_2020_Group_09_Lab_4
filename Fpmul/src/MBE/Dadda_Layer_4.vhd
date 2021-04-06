LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dadda_Layer_4 IS

PORT(PP_in_0: IN STD_LOGIC_VECTOR(58 DOWNTO 0);
    PP_in_1: IN STD_LOGIC_VECTOR(60 DOWNTO 0);
    PP_in_2: IN STD_LOGIC_VECTOR(62 DOWNTO 2);
    PP_in_3: IN STD_LOGIC_VECTOR(63 DOWNTO 4);
    PP_in_4: IN STD_LOGIC_VECTOR(63 DOWNTO 6);
    PP_in_5: IN STD_LOGIC_VECTOR(57 DOWNTO 8);

    PP_out_0: OUT STD_LOGIC_VECTOR(61 DOWNTO 0);
    PP_out_1: OUT STD_LOGIC_VECTOR(62 DOWNTO 0);
    PP_out_2: OUT STD_LOGIC_VECTOR(63 DOWNTO 2);
    PP_out_3: OUT STD_LOGIC_VECTOR(63 DOWNTO 4));


END Dadda_Layer_4;

ARCHITECTURE Behavior OF Dadda_Layer_4 IS

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
	SIGNAL FA_a_inputs_0, FA_b_inputs_0, FA_cin_inputs_0 : STD_LOGIC_VECTOR(51 DOWNTO 0);
	SIGNAL FA_s_outputs_0, FA_cout_outputs_0: STD_LOGIC_VECTOR(51 DOWNTO 0);
  SIGNAL HA_a_inputs_0, HA_b_inputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HA_s_outputs_0, HA_cout_outputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_1, FA_b_inputs_1, FA_cin_inputs_1 : STD_LOGIC_VECTOR(47 DOWNTO 0);
	SIGNAL FA_s_outputs_1, FA_cout_outputs_1: STD_LOGIC_VECTOR(47 DOWNTO 0);
	SIGNAL HA_a_inputs_1, HA_b_inputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_1, HA_cout_outputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);

	BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_0 <= PP_in_1(59) & PP_in_0(58 DOWNTO 8);
    FA_b_inputs_0 <= PP_in_2(59) & PP_in_1(58 DOWNTO 8);
  	FA_cin_inputs_0 <= PP_in_3(59) & PP_in_2(58 DOWNTO 8);
	  HA_a_inputs_0 <= PP_in_1(60) & PP_in_0(7 DOWNTO 6);
    HA_b_inputs_0 <= PP_in_2(60) & PP_in_1(7 DOWNTO 6);


    MCSA_0: MCSA GENERIC MAP(N => 52)
                 PORT MAP(FA_a_inputs => FA_a_inputs_0,
                          FA_b_inputs => FA_b_inputs_0,
                          FA_cin_inputs => FA_cin_inputs_0,
                          FA_s_outputs => FA_s_outputs_0,
                          FA_cout_outputs => FA_cout_outputs_0,
                          HA_a_inputs => HA_a_inputs_0,
                          HA_b_inputs => HA_b_inputs_0,
                          HA_s_outputs => HA_s_outputs_0,
                          HA_cout_outputs => HA_cout_outputs_0);

		PP_out_0(60 DOWNTO 6) <= HA_s_outputs_0(2) & FA_s_outputs_0 & HA_s_outputs_0(1 DOWNTO 0);
    PP_out_1(61 DOWNTO 7) <= HA_cout_outputs_0(2) & FA_cout_outputs_0 & HA_cout_outputs_0(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_1 <= PP_in_3(57 DOWNTO 10);
    FA_b_inputs_1 <= PP_in_4(57 DOWNTO 10);
  	FA_cin_inputs_1 <= PP_in_5(57 DOWNTO 10);

    HA_a_inputs_1 <= PP_in_3(58) & PP_in_3(9 DOWNTO 8);
    HA_b_inputs_1 <= PP_in_4(58) & PP_in_4(9 DOWNTO 8);


    MCSA_1: MCSA GENERIC MAP(N => 48)
                 PORT MAP(FA_a_inputs => FA_a_inputs_1,
                          FA_b_inputs => FA_b_inputs_1,
                          FA_cin_inputs => FA_cin_inputs_1,
                          FA_s_outputs => FA_s_outputs_1,
                          FA_cout_outputs => FA_cout_outputs_1,
                          HA_a_inputs => HA_a_inputs_1,
                          HA_b_inputs => HA_b_inputs_1,
                          HA_s_outputs => HA_s_outputs_1,
                          HA_cout_outputs => HA_cout_outputs_1);

    PP_out_2(58 DOWNTO 8) <= HA_s_outputs_1(2) & FA_s_outputs_1 & HA_s_outputs_1(1 DOWNTO 0);
    PP_out_3(59 DOWNTO 9) <= HA_cout_outputs_1(2) & FA_cout_outputs_1 & HA_cout_outputs_1(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	PP_out_0(61) <= PP_in_2(61);
	PP_out_0(5 DOWNTO 0) <= PP_in_0(5 DOWNTO 0);

	PP_out_1(62) <= PP_in_2(62);
	PP_out_1(6 DOWNTO 0) <= PP_in_2(6) & PP_in_1(5 DOWNTO 0);

	PP_out_2(63 DOWNTO 59) <= PP_in_4(63 DOWNTO 59);
	PP_out_2(7 DOWNTO 2) <= PP_in_3(7 DOWNTO 6) & PP_in_2(5 DOWNTO 2);

	PP_out_3(63 DOWNTO 60) <= PP_in_3(63 DOWNTO 60);
	PP_out_3(8 DOWNTO 4) <= PP_in_5(8) & PP_in_2(7) & PP_in_4(6) & PP_in_3(5 DOWNTO 4);


END Behavior;
