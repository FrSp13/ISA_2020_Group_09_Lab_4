LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dadda_Layer_5 IS

	PORT(PP_in_0: IN STD_LOGIC_VECTOR(52 DOWNTO 0);
      PP_in_1: IN STD_LOGIC_VECTOR(54 DOWNTO 0);
      PP_in_2: IN STD_LOGIC_VECTOR(56 DOWNTO 2);
      PP_in_3: IN STD_LOGIC_VECTOR(58 DOWNTO 4);
      PP_in_4: IN STD_LOGIC_VECTOR(60 DOWNTO 6);
      PP_in_5: IN STD_LOGIC_VECTOR(62 DOWNTO 8);
      PP_in_6: IN STD_LOGIC_VECTOR(63 DOWNTO 10);
      PP_in_7: IN STD_LOGIC_VECTOR(63 DOWNTO 12);
      PP_in_8: IN STD_LOGIC_VECTOR(51 DOWNTO 14);

      PP_out_0: OUT STD_LOGIC_VECTOR(58 DOWNTO 0);
      PP_out_1: OUT STD_LOGIC_VECTOR(60 DOWNTO 0);
      PP_out_2: OUT STD_LOGIC_VECTOR(62 DOWNTO 2);
      PP_out_3: OUT STD_LOGIC_VECTOR(63 DOWNTO 4);
      PP_out_4: OUT STD_LOGIC_VECTOR(63 DOWNTO 6);
      PP_out_5: OUT STD_LOGIC_VECTOR(57 DOWNTO 8));


END Dadda_Layer_5;

ARCHITECTURE Behavior OF Dadda_Layer_5 IS

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
	SIGNAL FA_a_inputs_0, FA_b_inputs_0, FA_cin_inputs_0 : STD_LOGIC_VECTOR(43 DOWNTO 0);
	SIGNAL FA_s_outputs_0, FA_cout_outputs_0: STD_LOGIC_VECTOR(43 DOWNTO 0);
  SIGNAL HA_a_inputs_0, HA_b_inputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HA_s_outputs_0, HA_cout_outputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_1, FA_b_inputs_1, FA_cin_inputs_1 : STD_LOGIC_VECTOR(39 DOWNTO 0);
	SIGNAL FA_s_outputs_1, FA_cout_outputs_1: STD_LOGIC_VECTOR(39 DOWNTO 0);
	SIGNAL HA_a_inputs_1, HA_b_inputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_1, HA_cout_outputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);

------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_2, FA_b_inputs_2, FA_cin_inputs_2 : STD_LOGIC_VECTOR(35 DOWNTO 0);
	SIGNAL FA_s_outputs_2, FA_cout_outputs_2: STD_LOGIC_VECTOR(35 DOWNTO 0);
	SIGNAL HA_a_inputs_2, HA_b_inputs_2: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_2, HA_cout_outputs_2: STD_LOGIC_VECTOR(2 DOWNTO 0);

	BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_0 <= PP_in_2(55) & PP_in_1(54 DOWNTO 53) & PP_in_0(52 DOWNTO 12);
    FA_b_inputs_0 <= PP_in_3(55) & PP_in_2(54 DOWNTO 53) & PP_in_1(52 DOWNTO 12);
  	FA_cin_inputs_0 <= PP_in_4(55) & PP_in_3(54 DOWNTO 53) & PP_in_2(52 DOWNTO 12);
	  HA_a_inputs_0 <= PP_in_2(56) & PP_in_0(11 DOWNTO 10);
    HA_b_inputs_0 <= PP_in_3(56) & PP_in_1(11 DOWNTO 10);


    MCSA_0: MCSA GENERIC MAP(N => 44)
                 PORT MAP(FA_a_inputs => FA_a_inputs_0,
                          FA_b_inputs => FA_b_inputs_0,
                          FA_cin_inputs => FA_cin_inputs_0,
                          FA_s_outputs => FA_s_outputs_0,
                          FA_cout_outputs => FA_cout_outputs_0,
                          HA_a_inputs => HA_a_inputs_0,
                          HA_b_inputs => HA_b_inputs_0,
                          HA_s_outputs => HA_s_outputs_0,
                          HA_cout_outputs => HA_cout_outputs_0);

		PP_out_0(56 DOWNTO 10) <= HA_s_outputs_0(2) & FA_s_outputs_0 & HA_s_outputs_0(1 DOWNTO 0);
    PP_out_1(57 DOWNTO 11) <= HA_cout_outputs_0(2) & FA_cout_outputs_0 & HA_cout_outputs_0(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_1 <= PP_in_4(53) & PP_in_3(52 DOWNTO 14);
    FA_b_inputs_1 <= PP_in_5(53) & PP_in_4(52 DOWNTO 14);
  	FA_cin_inputs_1 <= PP_in_6(53) & PP_in_5(52 DOWNTO 14);

    HA_a_inputs_1 <= PP_in_4(54) & PP_in_3(13 DOWNTO 12);
    HA_b_inputs_1 <= PP_in_5(54) & PP_in_4(13 DOWNTO 12);


    MCSA_1: MCSA GENERIC MAP(N => 40)
                 PORT MAP(FA_a_inputs => FA_a_inputs_1,
                          FA_b_inputs => FA_b_inputs_1,
                          FA_cin_inputs => FA_cin_inputs_1,
                          FA_s_outputs => FA_s_outputs_1,
                          FA_cout_outputs => FA_cout_outputs_1,
                          HA_a_inputs => HA_a_inputs_1,
                          HA_b_inputs => HA_b_inputs_1,
                          HA_s_outputs => HA_s_outputs_1,
                          HA_cout_outputs => HA_cout_outputs_1);

    PP_out_2(54 DOWNTO 12) <= HA_s_outputs_1(2) & FA_s_outputs_1 & HA_s_outputs_1(1 DOWNTO 0);
    PP_out_3(55 DOWNTO 13) <= HA_cout_outputs_1(2) & FA_cout_outputs_1 & HA_cout_outputs_1(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	FA_a_inputs_2 <= PP_in_6(51 DOWNTO 16);
	FA_b_inputs_2 <= PP_in_7(51 DOWNTO 16);
	FA_cin_inputs_2 <= PP_in_8(51 DOWNTO 16);
	HA_a_inputs_2 <= PP_in_6(52) & PP_in_6(15 DOWNTO 14);
	HA_b_inputs_2 <= PP_in_7(52) & PP_in_7(15 DOWNTO 14);


	MCSA_2: MCSA GENERIC MAP(N => 36)
							 PORT MAP(FA_a_inputs => FA_a_inputs_2,
												FA_b_inputs => FA_b_inputs_2,
												FA_cin_inputs => FA_cin_inputs_2,
												FA_s_outputs => FA_s_outputs_2,
												FA_cout_outputs => FA_cout_outputs_2,
												HA_a_inputs => HA_a_inputs_2,
												HA_b_inputs => HA_b_inputs_2,
												HA_s_outputs => HA_s_outputs_2,
												HA_cout_outputs => HA_cout_outputs_2);

	PP_out_4(52 DOWNTO 14) <= HA_s_outputs_2(2) & FA_s_outputs_2 & HA_s_outputs_2(1 DOWNTO 0);
	PP_out_5(53 DOWNTO 15) <= HA_cout_outputs_2(2) & FA_cout_outputs_2 & HA_cout_outputs_2(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	PP_out_0(58 DOWNTO 57) <= PP_in_3(58 DOWNTO 57);
	PP_out_0(9 DOWNTO 0) <= PP_in_0(9 DOWNTO 0);

	PP_out_1(60 DOWNTO 58) <= PP_in_4(60 DOWNTO 58);
	PP_out_1(10 DOWNTO 0) <= PP_in_2(10) & PP_in_1(9 DOWNTO 0);

	PP_out_2(62 DOWNTO 55) <= PP_in_5(62 DOWNTO 55);
	PP_out_2(11 DOWNTO 2) <= PP_in_3(11 DOWNTO 10) & PP_in_2(9 DOWNTO 2);

	PP_out_3(63 DOWNTO 56) <= PP_in_6(63 DOWNTO 56);
	PP_out_3(12 DOWNTO 4) <= PP_in_5(12 DOWNTO 10) & PP_in_3(9 DOWNTO 4);

	PP_out_4(63 DOWNTO 53) <= PP_in_7(63 DOWNTO 53);
	PP_out_4(13 DOWNTO 6) <= PP_in_6(13 DOWNTO 12) & PP_in_4(11 DOWNTO 6);

	PP_out_5(57 DOWNTO 54) <= PP_in_4(57 DOWNTO 56) & PP_in_6(55 DOWNTO 54);
	PP_out_5(14 DOWNTO 8) <= PP_in_8(14) & PP_in_5(13) & PP_in_7(12) & PP_in_2(11) & PP_in_6(10) & PP_in_5(9 DOWNTO 8);

END Behavior;
