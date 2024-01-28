{-# OPTIONS_GHC -w #-}
module Parser where
import Data.Char (isSpace, isAlpha, isDigit)
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,161) ([16176,3,8,0,0,24576,12380,831,2048,0,13299,0,0,0,2,0,0,0,256,12288,831,0,1494,0,52224,207,32768,497,256,1024,5912,53196,12288,831,4096,0,13299,52224,207,16176,3,0,0,5912,24576,92,2048,0,1478,6144,52247,207,16176,49155,3324,0,5976,0,0,0,1,0,6144,8215,23648,16176,49154,2300,0,0,36812,12288,575,64704,12,9203,0,0,32768,49521,2300,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pyhs","Exp","if","let","then","else","while","var","int","print","true","false","'='","'+'","'-'","'('","')'","']'","'['","'<'","'>'","':'","';'","%eof"]
        bit_start = st Prelude.* 26
        bit_end = (st Prelude.+ 1) Prelude.* 26
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..25]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (5) = happyShift action_4
action_0 (6) = happyShift action_5
action_0 (9) = happyShift action_6
action_0 (10) = happyShift action_2
action_0 (11) = happyShift action_7
action_0 (12) = happyShift action_8
action_0 (13) = happyShift action_9
action_0 (14) = happyShift action_10
action_0 (17) = happyShift action_11
action_0 (18) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (16) = happyShift action_19
action_3 (17) = happyShift action_20
action_3 (21) = happyShift action_21
action_3 (22) = happyShift action_22
action_3 (23) = happyShift action_23
action_3 (25) = happyShift action_24
action_3 (26) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (5) = happyShift action_4
action_4 (6) = happyShift action_5
action_4 (9) = happyShift action_6
action_4 (10) = happyShift action_2
action_4 (11) = happyShift action_7
action_4 (12) = happyShift action_8
action_4 (13) = happyShift action_9
action_4 (14) = happyShift action_10
action_4 (17) = happyShift action_11
action_4 (18) = happyShift action_12
action_4 (4) = happyGoto action_18
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (10) = happyShift action_17
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (5) = happyShift action_4
action_6 (6) = happyShift action_5
action_6 (9) = happyShift action_6
action_6 (10) = happyShift action_2
action_6 (11) = happyShift action_7
action_6 (12) = happyShift action_8
action_6 (13) = happyShift action_9
action_6 (14) = happyShift action_10
action_6 (17) = happyShift action_11
action_6 (18) = happyShift action_12
action_6 (4) = happyGoto action_16
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_15

action_8 (18) = happyShift action_15
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_8

action_10 _ = happyReduce_9

action_11 (11) = happyShift action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (5) = happyShift action_4
action_12 (6) = happyShift action_5
action_12 (9) = happyShift action_6
action_12 (10) = happyShift action_2
action_12 (11) = happyShift action_7
action_12 (12) = happyShift action_8
action_12 (13) = happyShift action_9
action_12 (14) = happyShift action_10
action_12 (17) = happyShift action_11
action_12 (18) = happyShift action_12
action_12 (4) = happyGoto action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (16) = happyShift action_19
action_13 (17) = happyShift action_20
action_13 (19) = happyShift action_35
action_13 (21) = happyShift action_21
action_13 (22) = happyShift action_22
action_13 (23) = happyShift action_23
action_13 (25) = happyShift action_24
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_16

action_15 (5) = happyShift action_4
action_15 (6) = happyShift action_5
action_15 (9) = happyShift action_6
action_15 (10) = happyShift action_2
action_15 (11) = happyShift action_7
action_15 (12) = happyShift action_8
action_15 (13) = happyShift action_9
action_15 (14) = happyShift action_10
action_15 (17) = happyShift action_11
action_15 (18) = happyShift action_12
action_15 (4) = happyGoto action_34
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (16) = happyShift action_19
action_16 (17) = happyShift action_20
action_16 (21) = happyShift action_21
action_16 (22) = happyShift action_22
action_16 (23) = happyShift action_23
action_16 (24) = happyShift action_33
action_16 (25) = happyShift action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (15) = happyShift action_32
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (7) = happyShift action_31
action_18 (16) = happyShift action_19
action_18 (17) = happyShift action_20
action_18 (21) = happyShift action_21
action_18 (22) = happyShift action_22
action_18 (23) = happyShift action_23
action_18 (25) = happyShift action_24
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (5) = happyShift action_4
action_19 (6) = happyShift action_5
action_19 (9) = happyShift action_6
action_19 (10) = happyShift action_2
action_19 (11) = happyShift action_7
action_19 (12) = happyShift action_8
action_19 (13) = happyShift action_9
action_19 (14) = happyShift action_10
action_19 (17) = happyShift action_11
action_19 (18) = happyShift action_12
action_19 (4) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (5) = happyShift action_4
action_20 (6) = happyShift action_5
action_20 (9) = happyShift action_6
action_20 (10) = happyShift action_2
action_20 (11) = happyShift action_7
action_20 (12) = happyShift action_8
action_20 (13) = happyShift action_9
action_20 (14) = happyShift action_10
action_20 (17) = happyShift action_11
action_20 (18) = happyShift action_12
action_20 (4) = happyGoto action_29
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (11) = happyShift action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (5) = happyShift action_4
action_22 (6) = happyShift action_5
action_22 (9) = happyShift action_6
action_22 (10) = happyShift action_2
action_22 (11) = happyShift action_7
action_22 (12) = happyShift action_8
action_22 (13) = happyShift action_9
action_22 (14) = happyShift action_10
action_22 (17) = happyShift action_11
action_22 (18) = happyShift action_12
action_22 (4) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (5) = happyShift action_4
action_23 (6) = happyShift action_5
action_23 (9) = happyShift action_6
action_23 (10) = happyShift action_2
action_23 (11) = happyShift action_7
action_23 (12) = happyShift action_8
action_23 (13) = happyShift action_9
action_23 (14) = happyShift action_10
action_23 (17) = happyShift action_11
action_23 (18) = happyShift action_12
action_23 (4) = happyGoto action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (5) = happyShift action_4
action_24 (6) = happyShift action_5
action_24 (9) = happyShift action_6
action_24 (10) = happyShift action_2
action_24 (11) = happyShift action_7
action_24 (12) = happyShift action_8
action_24 (13) = happyShift action_9
action_24 (14) = happyShift action_10
action_24 (17) = happyShift action_11
action_24 (18) = happyShift action_12
action_24 (4) = happyGoto action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (16) = happyShift action_19
action_25 (17) = happyShift action_20
action_25 (21) = happyShift action_21
action_25 (22) = happyShift action_22
action_25 (23) = happyShift action_23
action_25 (25) = happyShift action_24
action_25 _ = happyReduce_11

action_26 (16) = happyShift action_19
action_26 (17) = happyShift action_20
action_26 (21) = happyShift action_21
action_26 (22) = happyShift action_22
action_26 (23) = happyShift action_23
action_26 (25) = happyShift action_44
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (16) = happyShift action_19
action_27 (17) = happyShift action_20
action_27 (21) = happyShift action_21
action_27 (22) = happyShift action_22
action_27 (23) = happyShift action_23
action_27 (25) = happyShift action_43
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (20) = happyShift action_42
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (16) = happyShift action_19
action_29 (17) = happyShift action_20
action_29 (21) = happyShift action_21
action_29 (22) = happyShift action_22
action_29 (23) = happyShift action_23
action_29 (25) = happyShift action_41
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_19
action_30 (17) = happyShift action_20
action_30 (21) = happyShift action_21
action_30 (22) = happyShift action_22
action_30 (23) = happyShift action_23
action_30 (25) = happyShift action_40
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (5) = happyShift action_4
action_31 (6) = happyShift action_5
action_31 (9) = happyShift action_6
action_31 (10) = happyShift action_2
action_31 (11) = happyShift action_7
action_31 (12) = happyShift action_8
action_31 (13) = happyShift action_9
action_31 (14) = happyShift action_10
action_31 (17) = happyShift action_11
action_31 (18) = happyShift action_12
action_31 (4) = happyGoto action_39
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (5) = happyShift action_4
action_32 (6) = happyShift action_5
action_32 (9) = happyShift action_6
action_32 (10) = happyShift action_2
action_32 (11) = happyShift action_7
action_32 (12) = happyShift action_8
action_32 (13) = happyShift action_9
action_32 (14) = happyShift action_10
action_32 (17) = happyShift action_11
action_32 (18) = happyShift action_12
action_32 (4) = happyGoto action_38
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (5) = happyShift action_4
action_33 (6) = happyShift action_5
action_33 (9) = happyShift action_6
action_33 (10) = happyShift action_2
action_33 (11) = happyShift action_7
action_33 (12) = happyShift action_8
action_33 (13) = happyShift action_9
action_33 (14) = happyShift action_10
action_33 (17) = happyShift action_11
action_33 (18) = happyShift action_12
action_33 (4) = happyGoto action_37
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (16) = happyShift action_19
action_34 (17) = happyShift action_20
action_34 (19) = happyShift action_36
action_34 (21) = happyShift action_21
action_34 (22) = happyShift action_22
action_34 (23) = happyShift action_23
action_34 (25) = happyShift action_24
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_13

action_36 (25) = happyShift action_47
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (16) = happyShift action_19
action_37 (17) = happyShift action_20
action_37 (21) = happyShift action_21
action_37 (22) = happyShift action_22
action_37 (23) = happyShift action_23
action_37 (25) = happyShift action_24
action_37 _ = happyReduce_12

action_38 (16) = happyShift action_19
action_38 (17) = happyShift action_20
action_38 (21) = happyShift action_21
action_38 (22) = happyShift action_22
action_38 (23) = happyShift action_23
action_38 (25) = happyShift action_46
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (8) = happyShift action_45
action_39 (16) = happyShift action_19
action_39 (17) = happyShift action_20
action_39 (21) = happyShift action_21
action_39 (22) = happyShift action_22
action_39 (23) = happyShift action_23
action_39 (25) = happyShift action_24
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (5) = happyShift action_4
action_40 (6) = happyShift action_5
action_40 (9) = happyShift action_6
action_40 (10) = happyShift action_2
action_40 (11) = happyShift action_7
action_40 (12) = happyShift action_8
action_40 (13) = happyShift action_9
action_40 (14) = happyShift action_10
action_40 (17) = happyShift action_11
action_40 (18) = happyShift action_12
action_40 (4) = happyGoto action_25
action_40 _ = happyReduce_3

action_41 (5) = happyShift action_4
action_41 (6) = happyShift action_5
action_41 (9) = happyShift action_6
action_41 (10) = happyShift action_2
action_41 (11) = happyShift action_7
action_41 (12) = happyShift action_8
action_41 (13) = happyShift action_9
action_41 (14) = happyShift action_10
action_41 (17) = happyShift action_11
action_41 (18) = happyShift action_12
action_41 (4) = happyGoto action_25
action_41 _ = happyReduce_4

action_42 _ = happyReduce_14

action_43 (5) = happyShift action_4
action_43 (6) = happyShift action_5
action_43 (9) = happyShift action_6
action_43 (10) = happyShift action_2
action_43 (11) = happyShift action_7
action_43 (12) = happyShift action_8
action_43 (13) = happyShift action_9
action_43 (14) = happyShift action_10
action_43 (17) = happyShift action_11
action_43 (18) = happyShift action_12
action_43 (4) = happyGoto action_25
action_43 _ = happyReduce_5

action_44 (5) = happyShift action_4
action_44 (6) = happyShift action_5
action_44 (9) = happyShift action_6
action_44 (10) = happyShift action_2
action_44 (11) = happyShift action_7
action_44 (12) = happyShift action_8
action_44 (13) = happyShift action_9
action_44 (14) = happyShift action_10
action_44 (17) = happyShift action_11
action_44 (18) = happyShift action_12
action_44 (4) = happyGoto action_25
action_44 _ = happyReduce_6

action_45 (5) = happyShift action_4
action_45 (6) = happyShift action_5
action_45 (9) = happyShift action_6
action_45 (10) = happyShift action_2
action_45 (11) = happyShift action_7
action_45 (12) = happyShift action_8
action_45 (13) = happyShift action_9
action_45 (14) = happyShift action_10
action_45 (17) = happyShift action_11
action_45 (18) = happyShift action_12
action_45 (4) = happyGoto action_48
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (5) = happyShift action_4
action_46 (6) = happyShift action_5
action_46 (9) = happyShift action_6
action_46 (10) = happyShift action_2
action_46 (11) = happyShift action_7
action_46 (12) = happyShift action_8
action_46 (13) = happyShift action_9
action_46 (14) = happyShift action_10
action_46 (17) = happyShift action_11
action_46 (18) = happyShift action_12
action_46 (4) = happyGoto action_25
action_46 _ = happyReduce_2

action_47 _ = happyReduce_10

action_48 (16) = happyShift action_19
action_48 (17) = happyShift action_20
action_48 (21) = happyShift action_21
action_48 (22) = happyShift action_22
action_48 (23) = happyShift action_23
action_48 (25) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (5) = happyShift action_4
action_49 (6) = happyShift action_5
action_49 (9) = happyShift action_6
action_49 (10) = happyShift action_2
action_49 (11) = happyShift action_7
action_49 (12) = happyShift action_8
action_49 (13) = happyShift action_9
action_49 (14) = happyShift action_10
action_49 (17) = happyShift action_11
action_49 (18) = happyShift action_12
action_49 (4) = happyGoto action_25
action_49 _ = happyReduce_7

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happyReduce 5 4 happyReduction_2
happyReduction_2 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 4 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Plus happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Minus happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LessThn happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (GreaterThn happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 7 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (IfExp happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  4 happyReduction_8
happyReduction_8 (HappyTerminal (TokenTrue happy_var_1))
	 =  HappyAbsSyn4
		 (Bool happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  4 happyReduction_9
happyReduction_9 (HappyTerminal (TokenFalse happy_var_1))
	 =  HappyAbsSyn4
		 (Bool happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (PrintExp happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Exps happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 4 happyReduction_12
happyReduction_12 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (TupleExp happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TupleIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  4 happyReduction_15
happyReduction_15 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (Int happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  4 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Negative happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 26 26 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIf -> cont 5;
	TokenLet -> cont 6;
	TokenThen -> cont 7;
	TokenElse -> cont 8;
	TokenWhile -> cont 9;
	TokenVar happy_dollar_dollar -> cont 10;
	TokenInt happy_dollar_dollar -> cont 11;
	TokenPrint -> cont 12;
	TokenTrue happy_dollar_dollar -> cont 13;
	TokenFalse happy_dollar_dollar -> cont 14;
	TokenEq -> cont 15;
	TokenPlus -> cont 16;
	TokenMinus -> cont 17;
	TokenOP -> cont 18;
	TokenCP -> cont 19;
	TokenSqBR -> cont 20;
	TokenSqBL -> cont 21;
	TokenLess -> cont 22;
	TokenGreater -> cont 23;
	TokenColon -> cont 24;
	TokenSemicolon -> cont 25;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 26 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
pyhs tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse Error"

data Exp
  = Var String
  | Int Int
  | Negative Int
  | Let String Exp
  | Bool String
  | Plus Exp Exp
  | Minus Exp Exp
  | IfExp Exp Exp Exp
  | GreaterThn Exp Exp
  | LessThn Exp Exp
  | While Exp Exp
  | TupleExp Exp
  | TupleIndex Exp Int
  | PrintExp Exp
  | Exps Exp Exp
  deriving Show

data Token
  = TokenIf
  | TokenLet
  | TokenThen
  | TokenElse
  | TokenWhile
  | TokenPrint
  | TokenSqBL
  | TokenSqBR
  | TokenInt Int
  | TokenVar String
  | TokenTrue String
  | TokenFalse String
  | TokenEq
  | TokenLess
  | TokenGreater
  | TokenPlus
  | TokenMinus
  | TokenOP
  | TokenCP
  | TokenColon
  | TokenSemicolon
  deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
  | isSpace c = lexer cs
  | isAlpha c = lexExp (c:cs)
  | isDigit c = lexNum (c:cs)
lexer ('=':cs) = TokenEq : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('(':cs) = TokenOP : lexer cs
lexer (')':cs) = TokenCP : lexer cs
lexer (';':cs) = TokenSemicolon : lexer cs
lexer ('[':cs) = TokenSqBL : lexer cs
lexer (']':cs) = TokenSqBR : lexer cs
lexer ('<':cs) = TokenLess : lexer cs
lexer ('>':cs) = TokenGreater : lexer cs

lexNum cs = TokenInt (read num) : lexer rest
  where (num, rest) = span isDigit cs

lexExp cs =
  case span isAlpha cs of
  ("if", rest) -> TokenIf : lexer rest
  ("then", rest) -> TokenThen : lexer rest
  ("else", rest) -> TokenElse : lexer rest
  ("let", rest) -> TokenLet : lexer rest
  ("while", rest) -> TokenWhile : lexer rest
  ("print", rest) -> TokenPrint : lexer rest
  ("True", rest) -> TokenTrue "True" : lexer rest
  ("False", rest) -> TokenFalse "False" : lexer rest
  (var, rest) -> TokenVar var : lexer rest

main = getContents >>= print . pyhs . lexer
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
