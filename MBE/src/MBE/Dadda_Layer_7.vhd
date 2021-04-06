LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Dadda_Layer_7 IS

	PORT(PP_in_0: IN STD_LOGIC_VECTOR(35 DOWNTO 0);
      PP_in_1: IN STD_LOGIC_VECTOR(36 DOWNTO 0);
      PP_in_2: IN STD_LOGIC_VECTOR(38 DOWNTO 2);
      PP_in_3: IN STD_LOGIC_VECTOR(40 DOWNTO 4);
      PP_in_4: IN STD_LOGIC_VECTOR(42 DOWNTO 6);
      PP_in_5: IN STD_LOGIC_VECTOR(44 DOWNTO 8);
      PP_in_6: IN STD_LOGIC_VECTOR(46 DOWNTO 10);
      PP_in_7: IN STD_LOGIC_VECTOR(48 DOWNTO 12);
      PP_in_8: IN STD_LOGIC_VECTOR(50 DOWNTO 14);
      PP_in_9: IN STD_LOGIC_VECTOR(52 DOWNTO 16);
      PP_in_10: IN STD_LOGIC_VECTOR(54 DOWNTO 18);
      PP_in_11: IN STD_LOGIC_VECTOR(56 DOWNTO 20);
      PP_in_12: IN STD_LOGIC_VECTOR(58 DOWNTO 22);
      PP_in_13: IN STD_LOGIC_VECTOR(60 DOWNTO 24);
      PP_in_14: IN STD_LOGIC_VECTOR(62 DOWNTO 26);
      PP_in_15: IN STD_LOGIC_VECTOR(63 DOWNTO 28);
      PP_in_16: IN STD_LOGIC_VECTOR(63 DOWNTO 30);

      PP_out_0: OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      PP_out_1: OUT STD_LOGIC_VECTOR(46 DOWNTO 0);
      PP_out_2: OUT STD_LOGIC_VECTOR(48 DOWNTO 2);
      PP_out_3: OUT STD_LOGIC_VECTOR(50 DOWNTO 4);
      PP_out_4: OUT STD_LOGIC_VECTOR(52 DOWNTO 6);
      PP_out_5: OUT STD_LOGIC_VECTOR(54 DOWNTO 8);
      PP_out_6: OUT STD_LOGIC_VECTOR(56 DOWNTO 10);
      PP_out_7: OUT STD_LOGIC_VECTOR(58 DOWNTO 12);
      PP_out_8: OUT STD_LOGIC_VECTOR(60 DOWNTO 14);
      PP_out_9: OUT STD_LOGIC_VECTOR(62 DOWNTO 16);
      PP_out_10: OUT STD_LOGIC_VECTOR(63 DOWNTO 18);
      PP_out_11: OUT STD_LOGIC_VECTOR(63 DOWNTO 20);
      PP_out_12: OUT STD_LOGIC_VECTOR(43 DOWNTO 22));

END Dadda_Layer_7;

ARCHITECTURE Behavior OF Dadda_Layer_7 IS

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
	SIGNAL FA_a_inputs_0, FA_b_inputs_0, FA_cin_inputs_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL FA_s_outputs_0, FA_cout_outputs_0: STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL HA_a_inputs_0, HA_b_inputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HA_s_outputs_0, HA_cout_outputs_0: STD_LOGIC_VECTOR(2 DOWNTO 0);
------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_1, FA_b_inputs_1, FA_cin_inputs_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL FA_s_outputs_1, FA_cout_outputs_1: STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL HA_a_inputs_1, HA_b_inputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_1, HA_cout_outputs_1: STD_LOGIC_VECTOR(2 DOWNTO 0);

------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_2, FA_b_inputs_2, FA_cin_inputs_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL FA_s_outputs_2, FA_cout_outputs_2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL HA_a_inputs_2, HA_b_inputs_2: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_2, HA_cout_outputs_2: STD_LOGIC_VECTOR(2 DOWNTO 0);

------------------------------------------------------------------------------------------
	SIGNAL FA_a_inputs_3, FA_b_inputs_3, FA_cin_inputs_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL FA_s_outputs_3, FA_cout_outputs_3: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL HA_a_inputs_3, HA_b_inputs_3: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL HA_s_outputs_3, HA_cout_outputs_3: STD_LOGIC_VECTOR(2 DOWNTO 0);

	BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_0 <= PP_in_4(41) & PP_in_3(40) & PP_in_3(39) & PP_in_2(38) & PP_in_2(37) & PP_in_1(36) & PP_in_0(35 DOWNTO 26); -- input combination from the excel, considering the correct weights
    FA_b_inputs_0 <= PP_in_5(41) & PP_in_4(40) & PP_in_4(39) & PP_in_3(38) & PP_in_3(37) & PP_in_2(36) & PP_in_1(35 DOWNTO 26);
  	 FA_cin_inputs_0 <= PP_in_6(41) & PP_in_5(40) & PP_in_5(39) & PP_in_4(38) & PP_in_4(37) & PP_in_3(36) & PP_in_2(35 DOWNTO 26);

	 HA_a_inputs_0 <= PP_in_4(42) & PP_in_0(25) & PP_in_0(24);
    HA_b_inputs_0 <= PP_in_5(42) & PP_in_1(25) & PP_in_1(24);


    MCSA_0: MCSA GENERIC MAP(N => 16)
                 PORT MAP(FA_a_inputs => FA_a_inputs_0,
                          FA_b_inputs => FA_b_inputs_0,
                          FA_cin_inputs => FA_cin_inputs_0,
                          FA_s_outputs => FA_s_outputs_0,
                          FA_cout_outputs => FA_cout_outputs_0,
                          HA_a_inputs => HA_a_inputs_0,
                          HA_b_inputs => HA_b_inputs_0,
                          HA_s_outputs => HA_s_outputs_0,
                          HA_cout_outputs => HA_cout_outputs_0);

		PP_out_0(42 DOWNTO 24) <= HA_s_outputs_0(2) & FA_s_outputs_0 & HA_s_outputs_0(1 DOWNTO 0); -- output positions assigned following the excel
    PP_out_1(43 DOWNTO 25) <= HA_cout_outputs_0(2) & FA_cout_outputs_0 & HA_cout_outputs_0(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FA_a_inputs_1 <= PP_in_6(39) & PP_in_5(38) & PP_in_5(37) & PP_in_4(36) & PP_in_3(35 DOWNTO 28);
    FA_b_inputs_1 <= PP_in_7(39) & PP_in_6(38) & PP_in_6(37) & PP_in_5(36) & PP_in_4(35 DOWNTO 28);
  	FA_cin_inputs_1 <= PP_in_8(39) & PP_in_7(38) & PP_in_7(37) & PP_in_6(36) & PP_in_5(35 DOWNTO 28);

    HA_a_inputs_1 <= PP_in_6(40) & PP_in_3(27) & PP_in_3(26);
    HA_b_inputs_1 <= PP_in_7(40) & PP_in_4(27) & PP_in_4(26);


    MCSA_1: MCSA GENERIC MAP(N => 12)
                 PORT MAP(FA_a_inputs => FA_a_inputs_1,
                          FA_b_inputs => FA_b_inputs_1,
                          FA_cin_inputs => FA_cin_inputs_1,
                          FA_s_outputs => FA_s_outputs_1,
                          FA_cout_outputs => FA_cout_outputs_1,
                          HA_a_inputs => HA_a_inputs_1,
                          HA_b_inputs => HA_b_inputs_1,
                          HA_s_outputs => HA_s_outputs_1,
                          HA_cout_outputs => HA_cout_outputs_1);

    PP_out_2(40 DOWNTO 26) <= HA_s_outputs_1(2) & FA_s_outputs_1 & HA_s_outputs_1(1 DOWNTO 0);
    PP_out_3(41 DOWNTO 27) <= HA_cout_outputs_1(2) & FA_cout_outputs_1 & HA_cout_outputs_1(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	FA_a_inputs_2 <= PP_in_8(37) & PP_in_7(36) & PP_in_6(35 DOWNTO 30);
	FA_b_inputs_2 <= PP_in_9(37) & PP_in_8(36) & PP_in_7(35 DOWNTO 30);
	FA_cin_inputs_2 <= PP_in_10(37) & PP_in_9(36) & PP_in_8(35 DOWNTO 30);
	HA_a_inputs_2 <= PP_in_8(38) & PP_in_6(29) & PP_in_6(28);
	HA_b_inputs_2 <= PP_in_9(38) & PP_in_7(29) & PP_in_7(28);


	MCSA_2: MCSA GENERIC MAP(N => 8)
							 PORT MAP(FA_a_inputs => FA_a_inputs_2,
												FA_b_inputs => FA_b_inputs_2,
												FA_cin_inputs => FA_cin_inputs_2,
												FA_s_outputs => FA_s_outputs_2,
												FA_cout_outputs => FA_cout_outputs_2,
												HA_a_inputs => HA_a_inputs_2,
												HA_b_inputs => HA_b_inputs_2,
												HA_s_outputs => HA_s_outputs_2,
												HA_cout_outputs => HA_cout_outputs_2);

	PP_out_4(38 DOWNTO 28) <= HA_s_outputs_2(2) & FA_s_outputs_2 & HA_s_outputs_2(1 DOWNTO 0);
	PP_out_5(39 DOWNTO 29) <= HA_cout_outputs_2(2) & FA_cout_outputs_2 & HA_cout_outputs_2(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	FA_a_inputs_3 <= PP_in_9(35 DOWNTO 32);
	FA_b_inputs_3 <= PP_in_10(35 DOWNTO 32);
	FA_cin_inputs_3 <= PP_in_11(35 DOWNTO 32);
	HA_a_inputs_3 <= PP_in_10(36) & PP_in_9(31) & PP_in_9(30);
	HA_b_inputs_3 <= PP_in_11(36) & PP_in_10(31) & PP_in_10(30);


	MCSA_3: MCSA GENERIC MAP(N => 4)
							 PORT MAP(FA_a_inputs => FA_a_inputs_3,
												FA_b_inputs => FA_b_inputs_3,
												FA_cin_inputs => FA_cin_inputs_3,
												FA_s_outputs => FA_s_outputs_3,
												FA_cout_outputs => FA_cout_outputs_3,
												HA_a_inputs => HA_a_inputs_3,
												HA_b_inputs => HA_b_inputs_3,
												HA_s_outputs => HA_s_outputs_3,
												HA_cout_outputs => HA_cout_outputs_3);

	PP_out_6(36 DOWNTO 30) <= HA_s_outputs_3(2) & FA_s_outputs_3 & HA_s_outputs_3(1 DOWNTO 0);
	PP_out_7(37 DOWNTO 31) <= HA_cout_outputs_3(2) & FA_cout_outputs_3 & HA_cout_outputs_3(1 DOWNTO 0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- Filling the output partial products with bits not involved into the compression

	PP_out_0(44 DOWNTO 43) <= PP_in_5(44 DOWNTO 43);
	PP_out_0(23 DOWNTO 0) <= PP_in_0(23 DOWNTO 0);

	PP_out_1(46 DOWNTO 44) <= PP_in_6(46 DOWNTO 44);
	PP_out_1(24 DOWNTO 0) <= PP_in_2(24) & PP_in_1(23 DOWNTO 0);

	PP_out_2(48 DOWNTO 41) <= PP_in_7(48 DOWNTO 41);
	PP_out_2(25 DOWNTO 2) <= PP_in_3(25 DOWNTO 24) & PP_in_2(23 DOWNTO 2);

	PP_out_3(50 DOWNTO 42) <= PP_in_8(50 DOWNTO 42);
	PP_out_3(26 DOWNTO 4) <= PP_in_5(26 DOWNTO 24)& PP_in_3(23 DOWNTO 4);

	PP_out_4(52 DOWNTO 39) <= PP_in_9(52 DOWNTO 39);
	PP_out_4(27 DOWNTO 6) <= PP_in_6(27 DOWNTO 26) & PP_in_4(25 DOWNTO 6);

	PP_out_5(54 DOWNTO 40) <= PP_in_10(54 DOWNTO 40);
	PP_out_5(28 DOWNTO 8) <= PP_in_8(28 DOWNTO 24) & PP_in_5(23 DOWNTO 8);

	PP_out_6(56 DOWNTO 37) <= PP_in_11(56 DOWNTO 37);
	PP_out_6(29 DOWNTO 10) <= PP_in_9(29 DOWNTO 26) & PP_in_6(25 DOWNTO 10);

	PP_out_7(58 DOWNTO 38) <= PP_in_12(58 DOWNTO 38);
	PP_out_7(30 DOWNTO 12) <= PP_in_11(30 DOWNTO 28) & PP_in_7(27 DOWNTO 12);

	PP_out_8(60 DOWNTO 14) <= PP_in_13(60 DOWNTO 38) & PP_in_12(37 DOWNTO 24) & PP_in_8(23 DOWNTO 14);

	PP_out_9(62 DOWNTO 16) <= PP_in_14(62 DOWNTO 38) & PP_in_13(37 DOWNTO 26) & PP_in_9(25 DOWNTO 16);

	PP_out_10(63 DOWNTO 18) <= PP_in_15(63 DOWNTO 38) & PP_in_14(37 DOWNTO 30) & PP_in_10(29 DOWNTO 18);

	PP_out_11(63 DOWNTO 20) <= PP_in_16(63 DOWNTO 38) & PP_in_15(37 DOWNTO 30) & PP_in_14(29 DOWNTO 28) & PP_in_11(27 DOWNTO 20);

	PP_out_12(43 DOWNTO 22) <= PP_in_6(43 DOWNTO 42) & PP_in_8(41 DOWNTO 40) & PP_in_10(39 DOWNTO 38) & PP_in_16(37 DOWNTO 32) & PP_in_11(31) & PP_in_16(30) & PP_in_8(29) & PP_in_15(28) & PP_in_5(27) & PP_in_14(26) & PP_in_2(25) & PP_in_13(24) & PP_in_12(23 DOWNTO 22);


END Behavior;
