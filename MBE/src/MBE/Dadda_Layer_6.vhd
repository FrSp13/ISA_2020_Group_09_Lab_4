LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dadda_Layer_6 IS

	PORT(PP_in_0: IN STD_LOGIC_VECTOR(44 DOWNTO 0);
      PP_in_1: IN STD_LOGIC_VECTOR(46 DOWNTO 0);
      PP_in_2: IN STD_LOGIC_VECTOR(48 DOWNTO 2);
      PP_in_3: IN STD_LOGIC_VECTOR(50 DOWNTO 4);
      PP_in_4: IN STD_LOGIC_VECTOR(52 DOWNTO 6);
      PP_in_5: IN STD_LOGIC_VECTOR(54 DOWNTO 8);
      PP_in_6: IN STD_LOGIC_VECTOR(56 DOWNTO 10);
      PP_in_7: IN STD_LOGIC_VECTOR(58 DOWNTO 12);
      PP_in_8: IN STD_LOGIC_VECTOR(60 DOWNTO 14);
      PP_in_9: IN STD_LOGIC_VECTOR(62 DOWNTO 16);
      PP_in_10: IN STD_LOGIC_VECTOR(63 DOWNTO 18);
      PP_in_11: IN STD_LOGIC_VECTOR(63 DOWNTO 20);
      PP_in_12: IN STD_LOGIC_VECTOR(43 DOWNTO 22);

      PP_out_0: OUT STD_LOGIC_VECTOR(52 DOWNTO 0);
      PP_out_1: OUT STD_LOGIC_VECTOR(54 DOWNTO 0);
      PP_out_2: OUT STD_LOGIC_VECTOR(56 DOWNTO 2);
      PP_out_3: OUT STD_LOGIC_VECTOR(58 DOWNTO 4);
      PP_out_4: OUT STD_LOGIC_VECTOR(60 DOWNTO 6);
      PP_out_5: OUT STD_LOGIC_VECTOR(62 DOWNTO 8);
      PP_out_6: OUT STD_LOGIC_VECTOR(63 DOWNTO 10);
      PP_out_7: OUT STD_LOGIC_VECTOR(63 DOWNTO 12);
      PP_out_8: OUT STD_LOGIC_VECTOR(51 DOWNTO 14));

END Dadda_Layer_6;

ARCHITECTURE Behavior OF Dadda_Layer_6 IS

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
	SIGNAL FA_a_inputs_0, FA_b_inputs_0, FA_cin_inputs_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL FA_s_outputs_0, FA_cout_outputs_0: STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL HA_a_inputs_0, HA_b_inputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HA_s_outputs_0, HA_cout_outputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_1, FA_b_inputs_1, FA_cin_inputs_1 : STD_LOGIC_VECTOR(27 DOWNTO 0);
	SIGNAL FA_s_outputs_1, FA_cout_outputs_1: STD_LOGIC_VECTOR(27 DOWNTO 0);
	SIGNAL HA_a_inputs_1, HA_b_inputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_1, HA_cout_outputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);

------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_2, FA_b_inputs_2, FA_cin_inputs_2 : STD_LOGIC_VECTOR(23 DOWNTO 0);
	SIGNAL FA_s_outputs_2, FA_cout_outputs_2: STD_LOGIC_VECTOR(23 DOWNTO 0);
	SIGNAL HA_a_inputs_2, HA_b_inputs_2: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_2, HA_cout_outputs_2: STD_LOGIC_VECTOR(2 DOWNTO 0);

------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_3, FA_b_inputs_3, FA_cin_inputs_3 : STD_LOGIC_VECTOR(19 DOWNTO 0);
	SIGNAL FA_s_outputs_3, FA_cout_outputs_3: STD_LOGIC_VECTOR(19 DOWNTO 0);
	SIGNAL HA_a_inputs_3, HA_b_inputs_3: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_3, HA_cout_outputs_3: STD_LOGIC_VECTOR(2 DOWNTO 0);

	BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_0 <= PP_in_3(49) & PP_in_2(48 DOWNTO 47) & PP_in_1(46 DOWNTO 45) & PP_in_0(44 DOWNTO 18);
    FA_b_inputs_0 <= PP_in_4(49) & PP_in_3(48 DOWNTO 47) & PP_in_2(46 DOWNTO 45) & PP_in_1(44 DOWNTO 18);
  	FA_cin_inputs_0 <= PP_in_5(49) & PP_in_4(48 DOWNTO 47) & PP_in_3(46 DOWNTO 45) & PP_in_2(44 DOWNTO 18);
	  HA_a_inputs_0 <= PP_in_3(50) & PP_in_0(17) & PP_in_0(16);
    HA_b_inputs_0 <= PP_in_4(50) & PP_in_1(17) & PP_in_1(16);


    MCSA_0: MCSA GENERIC MAP(N => 32)
                 PORT MAP(FA_a_inputs => FA_a_inputs_0,
                          FA_b_inputs => FA_b_inputs_0,
                          FA_cin_inputs => FA_cin_inputs_0,
                          FA_s_outputs => FA_s_outputs_0,
                          FA_cout_outputs => FA_cout_outputs_0,
                          HA_a_inputs => HA_a_inputs_0,
                          HA_b_inputs => HA_b_inputs_0,
                          HA_s_outputs => HA_s_outputs_0,
                          HA_cout_outputs => HA_cout_outputs_0);

		PP_out_0(50 DOWNTO 16) <= HA_s_outputs_0(2) & FA_s_outputs_0 & HA_s_outputs_0(1 DOWNTO 0);
    PP_out_1(51 DOWNTO 17) <= HA_cout_outputs_0(2) & FA_cout_outputs_0 & HA_cout_outputs_0(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_1 <= PP_in_5(47) & PP_in_4(46 DOWNTO 45) & PP_in_3(44 DOWNTO 20);
    FA_b_inputs_1 <= PP_in_6(47) & PP_in_5(46 DOWNTO 45) & PP_in_4(44 DOWNTO 20);
  	FA_cin_inputs_1 <= PP_in_7(47) & PP_in_6(46 DOWNTO 45) & PP_in_5(44 DOWNTO 20);

    HA_a_inputs_1 <= PP_in_5(48) & PP_in_3(19) & PP_in_3(18);
    HA_b_inputs_1 <= PP_in_6(48) & PP_in_4(19) & PP_in_4(18);


    MCSA_1: MCSA GENERIC MAP(N => 28)
                 PORT MAP(FA_a_inputs => FA_a_inputs_1,
                          FA_b_inputs => FA_b_inputs_1,
                          FA_cin_inputs => FA_cin_inputs_1,
                          FA_s_outputs => FA_s_outputs_1,
                          FA_cout_outputs => FA_cout_outputs_1,
                          HA_a_inputs => HA_a_inputs_1,
                          HA_b_inputs => HA_b_inputs_1,
                          HA_s_outputs => HA_s_outputs_1,
                          HA_cout_outputs => HA_cout_outputs_1);

    PP_out_2(48 DOWNTO 18) <= HA_s_outputs_1(2) & FA_s_outputs_1 & HA_s_outputs_1(1 DOWNTO 0);
    PP_out_3(49 DOWNTO 19) <= HA_cout_outputs_1(2) & FA_cout_outputs_1 & HA_cout_outputs_1(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	FA_a_inputs_2 <= PP_in_7(45) & PP_in_6(44 DOWNTO 22);
	FA_b_inputs_2 <= PP_in_8(45) & PP_in_7(44 DOWNTO 22);
	FA_cin_inputs_2 <= PP_in_9(45) & PP_in_8(44 DOWNTO 22);
	HA_a_inputs_2 <= PP_in_7(46) & PP_in_6(21) & PP_in_6(20);
	HA_b_inputs_2 <= PP_in_8(46) & PP_in_7(21) & PP_in_7(20);


	MCSA_2: MCSA GENERIC MAP(N => 24)
							 PORT MAP(FA_a_inputs => FA_a_inputs_2,
												FA_b_inputs => FA_b_inputs_2,
												FA_cin_inputs => FA_cin_inputs_2,
												FA_s_outputs => FA_s_outputs_2,
												FA_cout_outputs => FA_cout_outputs_2,
												HA_a_inputs => HA_a_inputs_2,
												HA_b_inputs => HA_b_inputs_2,
												HA_s_outputs => HA_s_outputs_2,
												HA_cout_outputs => HA_cout_outputs_2);

	PP_out_4(46 DOWNTO 20) <= HA_s_outputs_2(2) & FA_s_outputs_2 & HA_s_outputs_2(1 DOWNTO 0);
	PP_out_5(47 DOWNTO 21) <= HA_cout_outputs_2(2) & FA_cout_outputs_2 & HA_cout_outputs_2(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	FA_a_inputs_3 <= PP_in_9(43 DOWNTO 24);
	FA_b_inputs_3 <= PP_in_10(43 DOWNTO 24);
	FA_cin_inputs_3 <= PP_in_11(43 DOWNTO 24);
	HA_a_inputs_3 <= PP_in_9(44) & PP_in_9(23) & PP_in_9(22);
	HA_b_inputs_3 <= PP_in_10(44) & PP_in_10(23) & PP_in_10(22);


	MCSA_3: MCSA GENERIC MAP(N => 20)
							 PORT MAP(FA_a_inputs => FA_a_inputs_3,
												FA_b_inputs => FA_b_inputs_3,
												FA_cin_inputs => FA_cin_inputs_3,
												FA_s_outputs => FA_s_outputs_3,
												FA_cout_outputs => FA_cout_outputs_3,
												HA_a_inputs => HA_a_inputs_3,
												HA_b_inputs => HA_b_inputs_3,
												HA_s_outputs => HA_s_outputs_3,
												HA_cout_outputs => HA_cout_outputs_3);

	PP_out_6(44 DOWNTO 22) <= HA_s_outputs_3(2) & FA_s_outputs_3 & HA_s_outputs_3(1 DOWNTO 0);
	PP_out_7(45 DOWNTO 23) <= HA_cout_outputs_3(2) & FA_cout_outputs_3 & HA_cout_outputs_3(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	PP_out_0(52 DOWNTO 51) <= PP_in_4(52 DOWNTO 51);
	PP_out_0(15 DOWNTO 0) <= PP_in_0(15 DOWNTO 0);

	PP_out_1(54 DOWNTO 52) <= PP_in_5(54 DOWNTO 52);
	PP_out_1(16 DOWNTO 0) <= PP_in_2(16) & PP_in_1(15 DOWNTO 0);

	PP_out_2(56 DOWNTO 49) <= PP_in_6(56 DOWNTO 49);
	PP_out_2(17 DOWNTO 2) <= PP_in_3(17 DOWNTO 16) & PP_in_2(15 DOWNTO 2);

	PP_out_3(58 DOWNTO 50) <= PP_in_7(58 DOWNTO 50);
	PP_out_3(18 DOWNTO 4) <= PP_in_5(18 DOWNTO 16) & PP_in_3(15 DOWNTO 4);

	PP_out_4(60 DOWNTO 47) <= PP_in_8(60 DOWNTO 47);
	PP_out_4(19 DOWNTO 6) <= PP_in_6(19 DOWNTO 18) & PP_in_4(17 DOWNTO 6);

	PP_out_5(62 DOWNTO 48) <= PP_in_9(62 DOWNTO 48);
	PP_out_5(20 DOWNTO 8) <= PP_in_8(20 DOWNTO 16) & PP_in_5(15 DOWNTO 8);

	PP_out_6(63 DOWNTO 45) <= PP_in_10(63 DOWNTO 45);
	PP_out_6(21 DOWNTO 10) <= PP_in_9(21 DOWNTO 18) & PP_in_6(17 DOWNTO 10);

	PP_out_7(63 DOWNTO 46) <= PP_in_11(63 DOWNTO 46);
	PP_out_7(22 DOWNTO 12) <= PP_in_11(22) & PP_in_10(21 DOWNTO 20) & PP_in_7(19 DOWNTO 12);

	PP_out_8(51 DOWNTO 14) <= PP_in_5(51 DOWNTO 50) & PP_in_7(49 DOWNTO 48) & PP_in_9(47 DOWNTO 46) & PP_in_11(45 DOWNTO 44) & PP_in_12(43 DOWNTO 24) & PP_in_11(23) & PP_in_12(22) & PP_in_8(21) & PP_in_11(20) & PP_in_5(19) & PP_in_10(18) & PP_in_2(17) & PP_in_9(16) & PP_in_8(15 DOWNTO 14);


END Behavior;
