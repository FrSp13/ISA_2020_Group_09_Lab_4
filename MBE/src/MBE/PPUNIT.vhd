LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PPUNIT IS

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

END PPUNIT;

ARCHITECTURE Behavior OF PPUNIT IS

COMPONENT MBEU IS

    PORT(A: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       selected_bits: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       output : OUT STD_LOGIC_VECTOR(32 DOWNTO 0);
       sign : OUT STD_LOGIC);

END COMPONENT;

SIGNAL in_mbeu_0, in_mbeu_1, in_mbeu_2, in_mbeu_3, in_mbeu_4, in_mbeu_5, in_mbeu_6, in_mbeu_7, in_mbeu_8, in_mbeu_9, in_mbeu_10, in_mbeu_11, in_mbeu_12, in_mbeu_13, in_mbeu_14, in_mbeu_15, in_mbeu_16 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL out_mbeu_0, out_mbeu_1, out_mbeu_2, out_mbeu_3, out_mbeu_4, out_mbeu_5, out_mbeu_6, out_mbeu_7, out_mbeu_8, out_mbeu_9, out_mbeu_10, out_mbeu_11, out_mbeu_12, out_mbeu_13, out_mbeu_14, out_mbeu_15, out_mbeu_16 : STD_LOGIC_VECTOR(32 DOWNTO 0);
SIGNAL sign_mbeu_0, sign_mbeu_1, sign_mbeu_2, sign_mbeu_3, sign_mbeu_4, sign_mbeu_5, sign_mbeu_6, sign_mbeu_7, sign_mbeu_8, sign_mbeu_9, sign_mbeu_10, sign_mbeu_11, sign_mbeu_12, sign_mbeu_13, sign_mbeu_14, sign_mbeu_15, sign_mbeu_16 : STD_LOGIC;

  BEGIN
    -----------------------------------------------------------------------
    in_mbeu_0 <= X(1 DOWNTO 0) & '0';
    PP_0 <= (NOT sign_mbeu_0) & sign_mbeu_0 & sign_mbeu_0 & out_mbeu_0;	-- Stanford sign extension

    MBEU_0: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_0,
                          output => out_mbeu_0,
                          sign => sign_mbeu_0);

    -----------------------------------------------------------------------
    in_mbeu_1 <= X(3 DOWNTO 1);
    PP_1 <= '1' & NOT (sign_mbeu_1) & out_mbeu_1 & '0' & sign_mbeu_0;

    MBEU_1: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_1,
                          output => out_mbeu_1,
                          sign => sign_mbeu_1);

    -----------------------------------------------------------------------
    in_mbeu_2 <= X(5 DOWNTO 3);
    PP_2 <= '1' & NOT (sign_mbeu_2) & out_mbeu_2 & '0' & sign_mbeu_1;

    MBEU_2: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_2,
                          output => out_mbeu_2,
                          sign => sign_mbeu_2);

    -----------------------------------------------------------------------
    in_mbeu_3 <= X(7 DOWNTO 5);
    PP_3 <= '1' & NOT (sign_mbeu_3) & out_mbeu_3 & '0' & sign_mbeu_2;

    MBEU_3: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_3,
                          output => out_mbeu_3,
                          sign => sign_mbeu_3);

    -----------------------------------------------------------------------
    in_mbeu_4 <= X(9 DOWNTO 7);
    PP_4 <= '1' & NOT (sign_mbeu_4) & out_mbeu_4 & '0' & sign_mbeu_3;

    MBEU_4: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_4,
                          output => out_mbeu_4,
                          sign => sign_mbeu_4);

    -----------------------------------------------------------------------
    in_mbeu_5 <= X(11 DOWNTO 9);
    PP_5 <= '1' & NOT (sign_mbeu_5) & out_mbeu_5 & '0' & sign_mbeu_4;

    MBEU_5: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_5,
                          output => out_mbeu_5,
                          sign => sign_mbeu_5);

    -----------------------------------------------------------------------
    in_mbeu_6 <= X(13 DOWNTO 11);
    PP_6 <= '1' & NOT (sign_mbeu_6) & out_mbeu_6 & '0' & sign_mbeu_5;

    MBEU_6: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_6,
                          output => out_mbeu_6,
                          sign => sign_mbeu_6);

    -----------------------------------------------------------------------
    in_mbeu_7 <= X(15 DOWNTO 13);
    PP_7 <= '1' & NOT (sign_mbeu_7) & out_mbeu_7 & '0' & sign_mbeu_6;

    MBEU_7: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_7,
                          output => out_mbeu_7,
                          sign => sign_mbeu_7);

    -----------------------------------------------------------------------
    in_mbeu_8 <= X(17 DOWNTO 15);
    PP_8 <= '1' & NOT (sign_mbeu_8) & out_mbeu_8 & '0' & sign_mbeu_7;

    MBEU_8: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_8,
                          output => out_mbeu_8,
                          sign => sign_mbeu_8);

    -----------------------------------------------------------------------
    in_mbeu_9 <= X(19 DOWNTO 17);
    PP_9 <= '1' & NOT (sign_mbeu_9) & out_mbeu_9 & '0' & sign_mbeu_8;

    MBEU_9: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_9,
                          output => out_mbeu_9,
                          sign => sign_mbeu_9);

    -----------------------------------------------------------------------
    in_mbeu_10 <= X(21 DOWNTO 19);
    PP_10 <= '1' & NOT (sign_mbeu_10) & out_mbeu_10 & '0' & sign_mbeu_9;

    MBEU_10: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_10,
                          output => out_mbeu_10,
                          sign => sign_mbeu_10);

    -----------------------------------------------------------------------
    in_mbeu_11 <= X(23 DOWNTO 21);
    PP_11 <= '1' & NOT (sign_mbeu_11) & out_mbeu_11 & '0' & sign_mbeu_10;

    MBEU_11: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_11,
                          output => out_mbeu_11,
                          sign => sign_mbeu_11);

    -----------------------------------------------------------------------
    in_mbeu_12 <= X(25 DOWNTO 23);
    PP_12 <= '1' & NOT (sign_mbeu_12) & out_mbeu_12 & '0' & sign_mbeu_11;

    MBEU_12: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_12,
                          output => out_mbeu_12,
                          sign => sign_mbeu_12);

    -----------------------------------------------------------------------
    in_mbeu_13 <= X(27 DOWNTO 25);
    PP_13 <= '1' & NOT (sign_mbeu_13) & out_mbeu_13 & '0' & sign_mbeu_12;

    MBEU_13: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_13,
                          output => out_mbeu_13,
                          sign => sign_mbeu_13);

    -----------------------------------------------------------------------
    in_mbeu_14 <= X(29 DOWNTO 27);
    PP_14 <= '1' & NOT (sign_mbeu_14) & out_mbeu_14 & '0' & sign_mbeu_13;

    MBEU_14: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_14,
                          output => out_mbeu_14,
                          sign => sign_mbeu_14);

    -----------------------------------------------------------------------
    in_mbeu_15 <= X(31 DOWNTO 29);
    PP_15 <= NOT (sign_mbeu_15) & out_mbeu_15 & '0' & sign_mbeu_14;

    MBEU_15: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_15,
                          output => out_mbeu_15,
                          sign => sign_mbeu_15);

    -----------------------------------------------------------------------
    in_mbeu_16 <= '0' & '0' & X(31);
    PP_16 <= out_mbeu_16(31 DOWNTO 0) & '0' & sign_mbeu_15;

    MBEU_16: MBEU PORT MAP(A => A,
                          selected_bits => in_mbeu_16,
                          output => out_mbeu_16,
                          sign => sign_mbeu_16);

END Behavior;
