LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Significand_Multiplier IS

  PORT(A, B: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       Z: OUT STD_LOGIC_VECTOR(63 DOWNTO 0));

END Significand_Multiplier;

ARCHITECTURE Behavior OF Significand_Multiplier IS

  COMPONENT PPUNIT IS

    PORT(A, X: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         PP_0: OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
         PP_1: OUT STD_LOGIC_VECTOR(36 DOWNTO 0);
         PP_2: OUT STD_LOGIC_VECTOR(38 DOWNTO 2);
         PP_3: OUT STD_LOGIC_VECTOR(40 DOWNTO 4);
         PP_4: OUT STD_LOGIC_VECTOR(42 DOWNTO 6);
         PP_5: OUT STD_LOGIC_VECTOR(44 DOWNTO 8);
         PP_6: OUT STD_LOGIC_VECTOR(46 DOWNTO 10);
         PP_7: OUT STD_LOGIC_VECTOR(48 DOWNTO 12);
         PP_8: OUT STD_LOGIC_VECTOR(50 DOWNTO 14);
         PP_9: OUT STD_LOGIC_VECTOR(52 DOWNTO 16);
         PP_10: OUT STD_LOGIC_VECTOR(54 DOWNTO 18);
         PP_11: OUT STD_LOGIC_VECTOR(56 DOWNTO 20);
         PP_12: OUT STD_LOGIC_VECTOR(58 DOWNTO 22);
         PP_13: OUT STD_LOGIC_VECTOR(60 DOWNTO 24);
         PP_14: OUT STD_LOGIC_VECTOR(62 DOWNTO 26);
         PP_15: OUT STD_LOGIC_VECTOR(63 DOWNTO 28);
         PP_16: OUT STD_LOGIC_VECTOR(63 DOWNTO 30));

  END COMPONENT;

  COMPONENT Dadda_Layer_7 IS

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

  END COMPONENT;

  COMPONENT Dadda_Layer_6 IS

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

  END COMPONENT;

  COMPONENT Dadda_Layer_5 IS

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

  END COMPONENT;

  COMPONENT Dadda_Layer_4 IS

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

  END COMPONENT;

  COMPONENT Dadda_Layer_3 IS

    PORT(PP_in_0: IN STD_LOGIC_VECTOR(61 DOWNTO 0);
        PP_in_1: IN STD_LOGIC_VECTOR(62 DOWNTO 0);
        PP_in_2: IN STD_LOGIC_VECTOR(63 DOWNTO 2);
        PP_in_3: IN STD_LOGIC_VECTOR(63 DOWNTO 4);

        PP_out_0: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        PP_out_1: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        PP_out_2: OUT STD_LOGIC_VECTOR(63 DOWNTO 2));

  END COMPONENT;

  COMPONENT Dadda_Layer_2 IS

    PORT(PP_in_0: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
        PP_in_1: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
        PP_in_2: IN STD_LOGIC_VECTOR(63 DOWNTO 2);

        PP_out_0: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        PP_out_1: OUT STD_LOGIC_VECTOR(63 DOWNTO 0));

  END COMPONENT;

  COMPONENT Adder IS

    PORT( add1, add2: IN UNSIGNED(63 DOWNTO 0);
  		  sum: OUT UNSIGNED(63 DOWNTO 0));

  END COMPONENT;

------------------------------------------------------------------------------------------

  -- SIGNALS FROM PPUNIT TO LAYER 7

  SIGNAL pp_0_to7: STD_LOGIC_VECTOR(35 DOWNTO 0);
  SIGNAL pp_1_to7:  STD_LOGIC_VECTOR(36 DOWNTO 0);
  SIGNAL pp_2_to7: STD_LOGIC_VECTOR(38 DOWNTO 2);
  SIGNAL pp_3_to7: STD_LOGIC_VECTOR(40 DOWNTO 4);
  SIGNAL pp_4_to7: STD_LOGIC_VECTOR(42 DOWNTO 6);
  SIGNAL pp_5_to7: STD_LOGIC_VECTOR(44 DOWNTO 8);
  SIGNAL pp_6_to7: STD_LOGIC_VECTOR(46 DOWNTO 10);
  SIGNAL pp_7_to7: STD_LOGIC_VECTOR(48 DOWNTO 12);
  SIGNAL pp_8_to7: STD_LOGIC_VECTOR(50 DOWNTO 14);
  SIGNAL pp_9_to7: STD_LOGIC_VECTOR(52 DOWNTO 16);
  SIGNAL pp_10_to7: STD_LOGIC_VECTOR(54 DOWNTO 18);
  SIGNAL pp_11_to7: STD_LOGIC_VECTOR(56 DOWNTO 20);
  SIGNAL pp_12_to7: STD_LOGIC_VECTOR(58 DOWNTO 22);
  SIGNAL pp_13_to7: STD_LOGIC_VECTOR(60 DOWNTO 24);
  SIGNAL pp_14_to7: STD_LOGIC_VECTOR(62 DOWNTO 26);
  SIGNAL pp_15_to7: STD_LOGIC_VECTOR(63 DOWNTO 28);
  SIGNAL pp_16_to7: STD_LOGIC_VECTOR(63 DOWNTO 30);

  ------------------------------------------------------------------------------------------

    -- SIGNALS FROM LAYER 7 TO LAYER 6

    SIGNAL pp_0_to6: STD_LOGIC_VECTOR(44 DOWNTO 0);
    SIGNAL pp_1_to6: STD_LOGIC_VECTOR(46 DOWNTO 0);
    SIGNAL pp_2_to6: STD_LOGIC_VECTOR(48 DOWNTO 2);
    SIGNAL pp_3_to6: STD_LOGIC_VECTOR(50 DOWNTO 4);
    SIGNAL pp_4_to6: STD_LOGIC_VECTOR(52 DOWNTO 6);
    SIGNAL pp_5_to6: STD_LOGIC_VECTOR(54 DOWNTO 8);
    SIGNAL pp_6_to6: STD_LOGIC_VECTOR(56 DOWNTO 10);
    SIGNAL pp_7_to6: STD_LOGIC_VECTOR(58 DOWNTO 12);
    SIGNAL pp_8_to6: STD_LOGIC_VECTOR(60 DOWNTO 14);
    SIGNAL pp_9_to6: STD_LOGIC_VECTOR(62 DOWNTO 16);
    SIGNAL pp_10_to6: STD_LOGIC_VECTOR(63 DOWNTO 18);
    SIGNAL pp_11_to6: STD_LOGIC_VECTOR(63 DOWNTO 20);
    SIGNAL pp_12_to6: STD_LOGIC_VECTOR(43 DOWNTO 22);

    ------------------------------------------------------------------------------------------

      -- SIGNALS FROM LAYER 6 TO LAYER 5

      SIGNAL pp_0_to5: STD_LOGIC_VECTOR(52 DOWNTO 0);
      SIGNAL pp_1_to5: STD_LOGIC_VECTOR(54 DOWNTO 0);
      SIGNAL pp_2_to5: STD_LOGIC_VECTOR(56 DOWNTO 2);
      SIGNAL pp_3_to5: STD_LOGIC_VECTOR(58 DOWNTO 4);
      SIGNAL pp_4_to5: STD_LOGIC_VECTOR(60 DOWNTO 6);
      SIGNAL pp_5_to5: STD_LOGIC_VECTOR(62 DOWNTO 8);
      SIGNAL pp_6_to5: STD_LOGIC_VECTOR(63 DOWNTO 10);
      SIGNAL pp_7_to5: STD_LOGIC_VECTOR(63 DOWNTO 12);
      SIGNAL pp_8_to5: STD_LOGIC_VECTOR(51 DOWNTO 14);

    ------------------------------------------------------------------------------------------

      -- SIGNALS FROM LAYER 5 TO LAYER 4

      SIGNAL pp_0_to4: STD_LOGIC_VECTOR(58 DOWNTO 0);
      SIGNAL pp_1_to4: STD_LOGIC_VECTOR(60 DOWNTO 0);
      SIGNAL pp_2_to4: STD_LOGIC_VECTOR(62 DOWNTO 2);
      SIGNAL pp_3_to4: STD_LOGIC_VECTOR(63 DOWNTO 4);
      SIGNAL pp_4_to4: STD_LOGIC_VECTOR(63 DOWNTO 6);
      SIGNAL pp_5_to4: STD_LOGIC_VECTOR(57 DOWNTO 8);

        ------------------------------------------------------------------------------------------

          -- SIGNALS FROM LAYER 4 TO LAYER 3

          SIGNAL pp_0_to3: STD_LOGIC_VECTOR(61 DOWNTO 0);
          SIGNAL pp_1_to3: STD_LOGIC_VECTOR(62 DOWNTO 0);
          SIGNAL pp_2_to3: STD_LOGIC_VECTOR(63 DOWNTO 2);
          SIGNAL pp_3_to3: STD_LOGIC_VECTOR(63 DOWNTO 4);

          ------------------------------------------------------------------------------------------

            -- SIGNALS FROM LAYER 3 TO LAYER 2

            SIGNAL pp_0_to2: STD_LOGIC_VECTOR(63 DOWNTO 0);
            SIGNAL pp_1_to2: STD_LOGIC_VECTOR(63 DOWNTO 0);
            SIGNAL pp_2_to2: STD_LOGIC_VECTOR(63 DOWNTO 2);

            ------------------------------------------------------------------------------------------

              -- SIGNALS FROM LAYER 2 TO ADDER

              SIGNAL pp_0_to_adder:  STD_LOGIC_VECTOR(63 DOWNTO 0);
              SIGNAL pp_1_to_adder: STD_LOGIC_VECTOR(63 DOWNTO 0);
              
              SIGNAL out_add: UNSIGNED(63 DOWNTO 0);



	BEGIN

    PPUNIT_1: PPUNIT PORT MAP(A => A,
                              X => B,
                              PP_0 => pp_0_to7,
                              PP_1 => pp_1_to7,
                              PP_2 => pp_2_to7,
                              PP_3 => pp_3_to7,
                              PP_4 => pp_4_to7,
                              PP_5 => pp_5_to7,
                              PP_6 => pp_6_to7,
                              PP_7 => pp_7_to7,
                              PP_8 => pp_8_to7,
                              PP_9 => pp_9_to7,
                              PP_10 => pp_10_to7,
                              PP_11 => pp_11_to7,
                              PP_12 => pp_12_to7,
                              PP_13 => pp_13_to7,
                              PP_14 => pp_14_to7,
                              PP_15 => pp_15_to7,
                              PP_16 => pp_16_to7);

    Layer_7: Dadda_Layer_7 PORT MAP(
                              PP_in_0 => pp_0_to7,
                              PP_in_1 => pp_1_to7,
                              PP_in_2 => pp_2_to7,
                              PP_in_3 => pp_3_to7,
                              PP_in_4 => pp_4_to7,
                              PP_in_5 => pp_5_to7,
                              PP_in_6 => pp_6_to7,
                              PP_in_7 => pp_7_to7,
                              PP_in_8 => pp_8_to7,
                              PP_in_9 => pp_9_to7,
                              PP_in_10 => pp_10_to7,
                              PP_in_11 => pp_11_to7,
                              PP_in_12 => pp_12_to7,
                              PP_in_13 => pp_13_to7,
                              PP_in_14 => pp_14_to7,
                              PP_in_15 => pp_15_to7,
                              PP_in_16 => pp_16_to7,
                              PP_out_0 => pp_0_to6,
                              PP_out_1 => pp_1_to6,
                              PP_out_2 => pp_2_to6,
                              PP_out_3 => pp_3_to6,
                              PP_out_4 => pp_4_to6,
                              PP_out_5 => pp_5_to6,
                              PP_out_6 => pp_6_to6,
                              PP_out_7 => pp_7_to6,
                              PP_out_8 => pp_8_to6,
                              PP_out_9 => pp_9_to6,
                              PP_out_10 => pp_10_to6,
                              PP_out_11 => pp_11_to6,
                              PP_out_12 => pp_12_to6);


    Layer_6: Dadda_Layer_6 PORT MAP(
                              PP_in_0 => pp_0_to6,
                              PP_in_1 => pp_1_to6,
                              PP_in_2 => pp_2_to6,
                              PP_in_3 => pp_3_to6,
                              PP_in_4 => pp_4_to6,
                              PP_in_5 => pp_5_to6,
                              PP_in_6 => pp_6_to6,
                              PP_in_7 => pp_7_to6,
                              PP_in_8 => pp_8_to6,
                              PP_in_9 => pp_9_to6,
                              PP_in_10 => pp_10_to6,
                              PP_in_11 => pp_11_to6,
                              PP_in_12 => pp_12_to6,
                              PP_out_0 => pp_0_to5,
                              PP_out_1 => pp_1_to5,
                              PP_out_2 => pp_2_to5,
                              PP_out_3 => pp_3_to5,
                              PP_out_4 => pp_4_to5,
                              PP_out_5 => pp_5_to5,
                              PP_out_6 => pp_6_to5,
                              PP_out_7 => pp_7_to5,
                              PP_out_8 => pp_8_to5);


    Layer_5: Dadda_Layer_5 PORT MAP(
                              PP_in_0 => pp_0_to5,
                              PP_in_1 => pp_1_to5,
                              PP_in_2 => pp_2_to5,
                              PP_in_3 => pp_3_to5,
                              PP_in_4 => pp_4_to5,
                              PP_in_5 => pp_5_to5,
                              PP_in_6 => pp_6_to5,
                              PP_in_7 => pp_7_to5,
                              PP_in_8 => pp_8_to5,
                              PP_out_0 => pp_0_to4,
                              PP_out_1 => pp_1_to4,
                              PP_out_2 => pp_2_to4,
                              PP_out_3 => pp_3_to4,
                              PP_out_4 => pp_4_to4,
                              PP_out_5 => pp_5_to4);


      Layer_4: Dadda_Layer_4 PORT MAP(
                                PP_in_0 => pp_0_to4,
                                PP_in_1 => pp_1_to4,
                                PP_in_2 => pp_2_to4,
                                PP_in_3 => pp_3_to4,
                                PP_in_4 => pp_4_to4,
                                PP_in_5 => pp_5_to4,
                                PP_out_0 => pp_0_to3,
                                PP_out_1 => pp_1_to3,
                                PP_out_2 => pp_2_to3,
                                PP_out_3 => pp_3_to3);


      Layer_3: Dadda_Layer_3 PORT MAP(
                                PP_in_0 => pp_0_to3,
                                PP_in_1 => pp_1_to3,
                                PP_in_2 => pp_2_to3,
                                PP_in_3 => pp_3_to3,
                                PP_out_0 => pp_0_to2,
                                PP_out_1 => pp_1_to2,
                                PP_out_2 => pp_2_to2);


      Layer_2: Dadda_Layer_2 PORT MAP(
                                PP_in_0 => pp_0_to2,
                                PP_in_1 => pp_1_to2,
                                PP_in_2 => pp_2_to2,
                                PP_out_0 => pp_0_to_adder,
                                PP_out_1 => pp_1_to_adder);

      Add: Adder PORT MAP(add1 => unsigned(pp_0_to_adder),
                          add2 => unsigned(pp_1_to_adder),
                          sum =>  out_add);
                          
      Z <= std_logic_vector(out_add);


END Behavior;
