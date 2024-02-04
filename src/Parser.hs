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
happyExpList = Happy_Data_Array.listArray (0,185) ([32560,18,64,0,0,0,49536,62213,295,1024,0,40908,4,0,0,4096,0,0,0,0,16280,9,64,24576,9470,0,59584,2,0,0,2963,20454,2,3072,62,64,1024,47152,65120,36,40908,4,32,12288,4735,58880,591,64704,73,0,0,12288,184,1536,23,4096,0,23576,0,2947,20454,49154,18940,38912,2367,0,47664,65120,36,0,0,6144,93,0,8,0,0,11788,32832,1473,2035,24576,254,0,0,63872,3,32560,0,20454,49154,508,0,0,0,64,65120,36,49152,33504,1017,0,35584,11,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pyhs","Exp","if","let","then","else","while","var","int","print","true","false","defun","'='","'+'","'-'","'{'","'}'","'('","')'","']'","'['","'<'","'>'","':'","';'","%eof"]
        bit_start = st Prelude.* 29
        bit_end = (st Prelude.+ 1) Prelude.* 29
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..28]
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
action_0 (15) = happyShift action_11
action_0 (18) = happyShift action_12
action_0 (21) = happyShift action_13
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (17) = happyShift action_21
action_3 (18) = happyShift action_22
action_3 (24) = happyShift action_23
action_3 (25) = happyShift action_24
action_3 (26) = happyShift action_25
action_3 (28) = happyShift action_26
action_3 (29) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (5) = happyShift action_4
action_4 (6) = happyShift action_5
action_4 (9) = happyShift action_6
action_4 (10) = happyShift action_2
action_4 (11) = happyShift action_7
action_4 (12) = happyShift action_8
action_4 (13) = happyShift action_9
action_4 (14) = happyShift action_10
action_4 (15) = happyShift action_11
action_4 (18) = happyShift action_12
action_4 (21) = happyShift action_13
action_4 (4) = happyGoto action_20
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (10) = happyShift action_19
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (5) = happyShift action_4
action_6 (6) = happyShift action_5
action_6 (9) = happyShift action_6
action_6 (10) = happyShift action_2
action_6 (11) = happyShift action_7
action_6 (12) = happyShift action_8
action_6 (13) = happyShift action_9
action_6 (14) = happyShift action_10
action_6 (15) = happyShift action_11
action_6 (18) = happyShift action_12
action_6 (21) = happyShift action_13
action_6 (4) = happyGoto action_18
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_16

action_8 (21) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_8

action_10 _ = happyReduce_9

action_11 (5) = happyShift action_4
action_11 (6) = happyShift action_5
action_11 (9) = happyShift action_6
action_11 (10) = happyShift action_2
action_11 (11) = happyShift action_7
action_11 (12) = happyShift action_8
action_11 (13) = happyShift action_9
action_11 (14) = happyShift action_10
action_11 (15) = happyShift action_11
action_11 (18) = happyShift action_12
action_11 (21) = happyShift action_13
action_11 (4) = happyGoto action_16
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (11) = happyShift action_15
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (5) = happyShift action_4
action_13 (6) = happyShift action_5
action_13 (9) = happyShift action_6
action_13 (10) = happyShift action_2
action_13 (11) = happyShift action_7
action_13 (12) = happyShift action_8
action_13 (13) = happyShift action_9
action_13 (14) = happyShift action_10
action_13 (15) = happyShift action_11
action_13 (18) = happyShift action_12
action_13 (21) = happyShift action_13
action_13 (4) = happyGoto action_14
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (17) = happyShift action_21
action_14 (18) = happyShift action_22
action_14 (22) = happyShift action_38
action_14 (24) = happyShift action_23
action_14 (25) = happyShift action_24
action_14 (26) = happyShift action_25
action_14 (28) = happyShift action_26
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_17

action_16 (17) = happyShift action_21
action_16 (18) = happyShift action_22
action_16 (21) = happyShift action_37
action_16 (24) = happyShift action_23
action_16 (25) = happyShift action_24
action_16 (26) = happyShift action_25
action_16 (28) = happyShift action_26
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (5) = happyShift action_4
action_17 (6) = happyShift action_5
action_17 (9) = happyShift action_6
action_17 (10) = happyShift action_2
action_17 (11) = happyShift action_7
action_17 (12) = happyShift action_8
action_17 (13) = happyShift action_9
action_17 (14) = happyShift action_10
action_17 (15) = happyShift action_11
action_17 (18) = happyShift action_12
action_17 (21) = happyShift action_13
action_17 (4) = happyGoto action_36
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (17) = happyShift action_21
action_18 (18) = happyShift action_22
action_18 (24) = happyShift action_23
action_18 (25) = happyShift action_24
action_18 (26) = happyShift action_25
action_18 (27) = happyShift action_35
action_18 (28) = happyShift action_26
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (16) = happyShift action_34
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (7) = happyShift action_33
action_20 (17) = happyShift action_21
action_20 (18) = happyShift action_22
action_20 (24) = happyShift action_23
action_20 (25) = happyShift action_24
action_20 (26) = happyShift action_25
action_20 (28) = happyShift action_26
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (5) = happyShift action_4
action_21 (6) = happyShift action_5
action_21 (9) = happyShift action_6
action_21 (10) = happyShift action_2
action_21 (11) = happyShift action_7
action_21 (12) = happyShift action_8
action_21 (13) = happyShift action_9
action_21 (14) = happyShift action_10
action_21 (15) = happyShift action_11
action_21 (18) = happyShift action_12
action_21 (21) = happyShift action_13
action_21 (4) = happyGoto action_32
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (5) = happyShift action_4
action_22 (6) = happyShift action_5
action_22 (9) = happyShift action_6
action_22 (10) = happyShift action_2
action_22 (11) = happyShift action_7
action_22 (12) = happyShift action_8
action_22 (13) = happyShift action_9
action_22 (14) = happyShift action_10
action_22 (15) = happyShift action_11
action_22 (18) = happyShift action_12
action_22 (21) = happyShift action_13
action_22 (4) = happyGoto action_31
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (11) = happyShift action_30
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (5) = happyShift action_4
action_24 (6) = happyShift action_5
action_24 (9) = happyShift action_6
action_24 (10) = happyShift action_2
action_24 (11) = happyShift action_7
action_24 (12) = happyShift action_8
action_24 (13) = happyShift action_9
action_24 (14) = happyShift action_10
action_24 (15) = happyShift action_11
action_24 (18) = happyShift action_12
action_24 (21) = happyShift action_13
action_24 (4) = happyGoto action_29
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (5) = happyShift action_4
action_25 (6) = happyShift action_5
action_25 (9) = happyShift action_6
action_25 (10) = happyShift action_2
action_25 (11) = happyShift action_7
action_25 (12) = happyShift action_8
action_25 (13) = happyShift action_9
action_25 (14) = happyShift action_10
action_25 (15) = happyShift action_11
action_25 (18) = happyShift action_12
action_25 (21) = happyShift action_13
action_25 (4) = happyGoto action_28
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (5) = happyShift action_4
action_26 (6) = happyShift action_5
action_26 (9) = happyShift action_6
action_26 (10) = happyShift action_2
action_26 (11) = happyShift action_7
action_26 (12) = happyShift action_8
action_26 (13) = happyShift action_9
action_26 (14) = happyShift action_10
action_26 (15) = happyShift action_11
action_26 (18) = happyShift action_12
action_26 (21) = happyShift action_13
action_26 (4) = happyGoto action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (17) = happyShift action_21
action_27 (18) = happyShift action_22
action_27 (24) = happyShift action_23
action_27 (25) = happyShift action_24
action_27 (26) = happyShift action_25
action_27 (28) = happyShift action_26
action_27 _ = happyReduce_11

action_28 (17) = happyShift action_21
action_28 (18) = happyShift action_22
action_28 (24) = happyShift action_23
action_28 (25) = happyShift action_24
action_28 (26) = happyShift action_25
action_28 (28) = happyShift action_48
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (17) = happyShift action_21
action_29 (18) = happyShift action_22
action_29 (24) = happyShift action_23
action_29 (25) = happyShift action_24
action_29 (26) = happyShift action_25
action_29 (28) = happyShift action_47
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (23) = happyShift action_46
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (17) = happyShift action_21
action_31 (18) = happyShift action_22
action_31 (24) = happyShift action_23
action_31 (25) = happyShift action_24
action_31 (26) = happyShift action_25
action_31 (28) = happyShift action_45
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (17) = happyShift action_21
action_32 (18) = happyShift action_22
action_32 (24) = happyShift action_23
action_32 (25) = happyShift action_24
action_32 (26) = happyShift action_25
action_32 (28) = happyShift action_44
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (5) = happyShift action_4
action_33 (6) = happyShift action_5
action_33 (9) = happyShift action_6
action_33 (10) = happyShift action_2
action_33 (11) = happyShift action_7
action_33 (12) = happyShift action_8
action_33 (13) = happyShift action_9
action_33 (14) = happyShift action_10
action_33 (15) = happyShift action_11
action_33 (18) = happyShift action_12
action_33 (21) = happyShift action_13
action_33 (4) = happyGoto action_43
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (5) = happyShift action_4
action_34 (6) = happyShift action_5
action_34 (9) = happyShift action_6
action_34 (10) = happyShift action_2
action_34 (11) = happyShift action_7
action_34 (12) = happyShift action_8
action_34 (13) = happyShift action_9
action_34 (14) = happyShift action_10
action_34 (15) = happyShift action_11
action_34 (18) = happyShift action_12
action_34 (21) = happyShift action_13
action_34 (4) = happyGoto action_42
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (5) = happyShift action_4
action_35 (6) = happyShift action_5
action_35 (9) = happyShift action_6
action_35 (10) = happyShift action_2
action_35 (11) = happyShift action_7
action_35 (12) = happyShift action_8
action_35 (13) = happyShift action_9
action_35 (14) = happyShift action_10
action_35 (15) = happyShift action_11
action_35 (18) = happyShift action_12
action_35 (21) = happyShift action_13
action_35 (4) = happyGoto action_41
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (17) = happyShift action_21
action_36 (18) = happyShift action_22
action_36 (22) = happyShift action_40
action_36 (24) = happyShift action_23
action_36 (25) = happyShift action_24
action_36 (26) = happyShift action_25
action_36 (28) = happyShift action_26
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (5) = happyShift action_4
action_37 (6) = happyShift action_5
action_37 (9) = happyShift action_6
action_37 (10) = happyShift action_2
action_37 (11) = happyShift action_7
action_37 (12) = happyShift action_8
action_37 (13) = happyShift action_9
action_37 (14) = happyShift action_10
action_37 (15) = happyShift action_11
action_37 (18) = happyShift action_12
action_37 (21) = happyShift action_13
action_37 (4) = happyGoto action_39
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_14

action_39 (17) = happyShift action_21
action_39 (18) = happyShift action_22
action_39 (22) = happyShift action_52
action_39 (24) = happyShift action_23
action_39 (25) = happyShift action_24
action_39 (26) = happyShift action_25
action_39 (28) = happyShift action_26
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (28) = happyShift action_51
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (17) = happyShift action_21
action_41 (18) = happyShift action_22
action_41 (24) = happyShift action_23
action_41 (25) = happyShift action_24
action_41 (26) = happyShift action_25
action_41 (28) = happyShift action_26
action_41 _ = happyReduce_12

action_42 (17) = happyShift action_21
action_42 (18) = happyShift action_22
action_42 (24) = happyShift action_23
action_42 (25) = happyShift action_24
action_42 (26) = happyShift action_25
action_42 (28) = happyShift action_50
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (8) = happyShift action_49
action_43 (17) = happyShift action_21
action_43 (18) = happyShift action_22
action_43 (24) = happyShift action_23
action_43 (25) = happyShift action_24
action_43 (26) = happyShift action_25
action_43 (28) = happyShift action_26
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (5) = happyShift action_4
action_44 (6) = happyShift action_5
action_44 (9) = happyShift action_6
action_44 (10) = happyShift action_2
action_44 (11) = happyShift action_7
action_44 (12) = happyShift action_8
action_44 (13) = happyShift action_9
action_44 (14) = happyShift action_10
action_44 (15) = happyShift action_11
action_44 (18) = happyShift action_12
action_44 (21) = happyShift action_13
action_44 (4) = happyGoto action_27
action_44 _ = happyReduce_3

action_45 (5) = happyShift action_4
action_45 (6) = happyShift action_5
action_45 (9) = happyShift action_6
action_45 (10) = happyShift action_2
action_45 (11) = happyShift action_7
action_45 (12) = happyShift action_8
action_45 (13) = happyShift action_9
action_45 (14) = happyShift action_10
action_45 (15) = happyShift action_11
action_45 (18) = happyShift action_12
action_45 (21) = happyShift action_13
action_45 (4) = happyGoto action_27
action_45 _ = happyReduce_4

action_46 _ = happyReduce_15

action_47 (5) = happyShift action_4
action_47 (6) = happyShift action_5
action_47 (9) = happyShift action_6
action_47 (10) = happyShift action_2
action_47 (11) = happyShift action_7
action_47 (12) = happyShift action_8
action_47 (13) = happyShift action_9
action_47 (14) = happyShift action_10
action_47 (15) = happyShift action_11
action_47 (18) = happyShift action_12
action_47 (21) = happyShift action_13
action_47 (4) = happyGoto action_27
action_47 _ = happyReduce_5

action_48 (5) = happyShift action_4
action_48 (6) = happyShift action_5
action_48 (9) = happyShift action_6
action_48 (10) = happyShift action_2
action_48 (11) = happyShift action_7
action_48 (12) = happyShift action_8
action_48 (13) = happyShift action_9
action_48 (14) = happyShift action_10
action_48 (15) = happyShift action_11
action_48 (18) = happyShift action_12
action_48 (21) = happyShift action_13
action_48 (4) = happyGoto action_27
action_48 _ = happyReduce_6

action_49 (5) = happyShift action_4
action_49 (6) = happyShift action_5
action_49 (9) = happyShift action_6
action_49 (10) = happyShift action_2
action_49 (11) = happyShift action_7
action_49 (12) = happyShift action_8
action_49 (13) = happyShift action_9
action_49 (14) = happyShift action_10
action_49 (15) = happyShift action_11
action_49 (18) = happyShift action_12
action_49 (21) = happyShift action_13
action_49 (4) = happyGoto action_54
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (5) = happyShift action_4
action_50 (6) = happyShift action_5
action_50 (9) = happyShift action_6
action_50 (10) = happyShift action_2
action_50 (11) = happyShift action_7
action_50 (12) = happyShift action_8
action_50 (13) = happyShift action_9
action_50 (14) = happyShift action_10
action_50 (15) = happyShift action_11
action_50 (18) = happyShift action_12
action_50 (21) = happyShift action_13
action_50 (4) = happyGoto action_27
action_50 _ = happyReduce_2

action_51 _ = happyReduce_10

action_52 (19) = happyShift action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (5) = happyShift action_4
action_53 (6) = happyShift action_5
action_53 (9) = happyShift action_6
action_53 (10) = happyShift action_2
action_53 (11) = happyShift action_7
action_53 (12) = happyShift action_8
action_53 (13) = happyShift action_9
action_53 (14) = happyShift action_10
action_53 (15) = happyShift action_11
action_53 (18) = happyShift action_12
action_53 (21) = happyShift action_13
action_53 (4) = happyGoto action_56
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_21
action_54 (18) = happyShift action_22
action_54 (24) = happyShift action_23
action_54 (25) = happyShift action_24
action_54 (26) = happyShift action_25
action_54 (28) = happyShift action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (5) = happyShift action_4
action_55 (6) = happyShift action_5
action_55 (9) = happyShift action_6
action_55 (10) = happyShift action_2
action_55 (11) = happyShift action_7
action_55 (12) = happyShift action_8
action_55 (13) = happyShift action_9
action_55 (14) = happyShift action_10
action_55 (15) = happyShift action_11
action_55 (18) = happyShift action_12
action_55 (21) = happyShift action_13
action_55 (4) = happyGoto action_27
action_55 _ = happyReduce_7

action_56 (17) = happyShift action_21
action_56 (18) = happyShift action_22
action_56 (20) = happyShift action_57
action_56 (24) = happyShift action_23
action_56 (25) = happyShift action_24
action_56 (26) = happyShift action_25
action_56 (28) = happyShift action_26
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_13

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

happyReduce_13 = happyReduce 8 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (DefunExp happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (TupleExp happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TupleIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  4 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (Int happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  4 happyReduction_17
happyReduction_17 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Negative happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 29 29 notHappyAtAll (HappyState action) sts stk []

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
	TokenDefun -> cont 15;
	TokenEq -> cont 16;
	TokenPlus -> cont 17;
	TokenMinus -> cont 18;
	TokenCurlyL -> cont 19;
	TokenCurlyR -> cont 20;
	TokenOP -> cont 21;
	TokenCP -> cont 22;
	TokenSqBR -> cont 23;
	TokenSqBL -> cont 24;
	TokenLess -> cont 25;
	TokenGreater -> cont 26;
	TokenColon -> cont 27;
	TokenSemicolon -> cont 28;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 29 tk tks = happyError' (tks, explist)
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
  | DefunExp Exp Exp Exp
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
  | TokenDefun
  | TokenCurlyL
  | TokenCurlyR
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
lexer ('{':cs) = TokenCurlyL : lexer cs
lexer ('}':cs) = TokenCurlyR : lexer cs

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
  ("defun", rest) -> TokenDefun : lexer rest
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
