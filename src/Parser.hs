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
happyExpList = Happy_Data_Array.listArray (0,119) ([16176,1,2,0,0,22912,16176,1,2,16176,1,0,0,2,0,0,0,4,0,12288,319,32768,121,64,32832,12377,319,16176,12289,319,16176,12289,319,0,0,22912,32768,89,22912,32768,12377,319,16176,12289,319,32768,93,16384,0,0,22912,32896,12377,63,16176,12288,63,16176,12288,319,16176,0,0,32768,12377,63,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pyhs","Exp","if","let","then","else","while","var","int","print","true","false","'='","'+'","'-'","'('","')'","'<'","'>'","':'","';'","%eof"]
        bit_start = st Prelude.* 24
        bit_end = (st Prelude.+ 1) Prelude.* 24
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..23]
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
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (16) = happyShift action_17
action_3 (17) = happyShift action_18
action_3 (20) = happyShift action_19
action_3 (21) = happyShift action_20
action_3 (23) = happyShift action_21
action_3 (24) = happyAccept
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
action_4 (4) = happyGoto action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (10) = happyShift action_15
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
action_6 (4) = happyGoto action_14
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_13

action_8 (18) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_8

action_10 _ = happyReduce_9

action_11 (11) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_14

action_13 (5) = happyShift action_4
action_13 (6) = happyShift action_5
action_13 (9) = happyShift action_6
action_13 (10) = happyShift action_2
action_13 (11) = happyShift action_7
action_13 (12) = happyShift action_8
action_13 (13) = happyShift action_9
action_13 (14) = happyShift action_10
action_13 (17) = happyShift action_11
action_13 (4) = happyGoto action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (16) = happyShift action_17
action_14 (17) = happyShift action_18
action_14 (20) = happyShift action_19
action_14 (21) = happyShift action_20
action_14 (22) = happyShift action_29
action_14 (23) = happyShift action_21
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (15) = happyShift action_28
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (7) = happyShift action_27
action_16 (16) = happyShift action_17
action_16 (17) = happyShift action_18
action_16 (20) = happyShift action_19
action_16 (21) = happyShift action_20
action_16 (23) = happyShift action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (5) = happyShift action_4
action_17 (6) = happyShift action_5
action_17 (9) = happyShift action_6
action_17 (10) = happyShift action_2
action_17 (11) = happyShift action_7
action_17 (12) = happyShift action_8
action_17 (13) = happyShift action_9
action_17 (14) = happyShift action_10
action_17 (17) = happyShift action_11
action_17 (4) = happyGoto action_26
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (5) = happyShift action_4
action_18 (6) = happyShift action_5
action_18 (9) = happyShift action_6
action_18 (10) = happyShift action_2
action_18 (11) = happyShift action_7
action_18 (12) = happyShift action_8
action_18 (13) = happyShift action_9
action_18 (14) = happyShift action_10
action_18 (17) = happyShift action_11
action_18 (4) = happyGoto action_25
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
action_19 (4) = happyGoto action_24
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
action_20 (4) = happyGoto action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (5) = happyShift action_4
action_21 (6) = happyShift action_5
action_21 (9) = happyShift action_6
action_21 (10) = happyShift action_2
action_21 (11) = happyShift action_7
action_21 (12) = happyShift action_8
action_21 (13) = happyShift action_9
action_21 (14) = happyShift action_10
action_21 (17) = happyShift action_11
action_21 (4) = happyGoto action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (16) = happyShift action_17
action_22 (17) = happyShift action_18
action_22 (20) = happyShift action_19
action_22 (21) = happyShift action_20
action_22 (23) = happyShift action_21
action_22 _ = happyReduce_11

action_23 (16) = happyShift action_17
action_23 (17) = happyShift action_18
action_23 (20) = happyShift action_19
action_23 (21) = happyShift action_20
action_23 (23) = happyShift action_38
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (16) = happyShift action_17
action_24 (17) = happyShift action_18
action_24 (20) = happyShift action_19
action_24 (21) = happyShift action_20
action_24 (23) = happyShift action_37
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (16) = happyShift action_17
action_25 (17) = happyShift action_18
action_25 (20) = happyShift action_19
action_25 (21) = happyShift action_20
action_25 (23) = happyShift action_36
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (16) = happyShift action_17
action_26 (17) = happyShift action_18
action_26 (20) = happyShift action_19
action_26 (21) = happyShift action_20
action_26 (23) = happyShift action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (5) = happyShift action_4
action_27 (6) = happyShift action_5
action_27 (9) = happyShift action_6
action_27 (10) = happyShift action_2
action_27 (11) = happyShift action_7
action_27 (12) = happyShift action_8
action_27 (13) = happyShift action_9
action_27 (14) = happyShift action_10
action_27 (17) = happyShift action_11
action_27 (4) = happyGoto action_34
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (5) = happyShift action_4
action_28 (6) = happyShift action_5
action_28 (9) = happyShift action_6
action_28 (10) = happyShift action_2
action_28 (11) = happyShift action_7
action_28 (12) = happyShift action_8
action_28 (13) = happyShift action_9
action_28 (14) = happyShift action_10
action_28 (17) = happyShift action_11
action_28 (4) = happyGoto action_33
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (5) = happyShift action_4
action_29 (6) = happyShift action_5
action_29 (9) = happyShift action_6
action_29 (10) = happyShift action_2
action_29 (11) = happyShift action_7
action_29 (12) = happyShift action_8
action_29 (13) = happyShift action_9
action_29 (14) = happyShift action_10
action_29 (17) = happyShift action_11
action_29 (4) = happyGoto action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_17
action_30 (17) = happyShift action_18
action_30 (19) = happyShift action_31
action_30 (20) = happyShift action_19
action_30 (21) = happyShift action_20
action_30 (23) = happyShift action_21
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (23) = happyShift action_41
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_17
action_32 (17) = happyShift action_18
action_32 (20) = happyShift action_19
action_32 (21) = happyShift action_20
action_32 (23) = happyShift action_21
action_32 _ = happyReduce_12

action_33 (16) = happyShift action_17
action_33 (17) = happyShift action_18
action_33 (20) = happyShift action_19
action_33 (21) = happyShift action_20
action_33 (23) = happyShift action_40
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (8) = happyShift action_39
action_34 (16) = happyShift action_17
action_34 (17) = happyShift action_18
action_34 (20) = happyShift action_19
action_34 (21) = happyShift action_20
action_34 (23) = happyShift action_21
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (5) = happyShift action_4
action_35 (6) = happyShift action_5
action_35 (9) = happyShift action_6
action_35 (10) = happyShift action_2
action_35 (11) = happyShift action_7
action_35 (12) = happyShift action_8
action_35 (13) = happyShift action_9
action_35 (14) = happyShift action_10
action_35 (17) = happyShift action_11
action_35 (4) = happyGoto action_22
action_35 _ = happyReduce_3

action_36 (5) = happyShift action_4
action_36 (6) = happyShift action_5
action_36 (9) = happyShift action_6
action_36 (10) = happyShift action_2
action_36 (11) = happyShift action_7
action_36 (12) = happyShift action_8
action_36 (13) = happyShift action_9
action_36 (14) = happyShift action_10
action_36 (17) = happyShift action_11
action_36 (4) = happyGoto action_22
action_36 _ = happyReduce_4

action_37 (5) = happyShift action_4
action_37 (6) = happyShift action_5
action_37 (9) = happyShift action_6
action_37 (10) = happyShift action_2
action_37 (11) = happyShift action_7
action_37 (12) = happyShift action_8
action_37 (13) = happyShift action_9
action_37 (14) = happyShift action_10
action_37 (17) = happyShift action_11
action_37 (4) = happyGoto action_22
action_37 _ = happyReduce_5

action_38 (5) = happyShift action_4
action_38 (6) = happyShift action_5
action_38 (9) = happyShift action_6
action_38 (10) = happyShift action_2
action_38 (11) = happyShift action_7
action_38 (12) = happyShift action_8
action_38 (13) = happyShift action_9
action_38 (14) = happyShift action_10
action_38 (17) = happyShift action_11
action_38 (4) = happyGoto action_22
action_38 _ = happyReduce_6

action_39 (5) = happyShift action_4
action_39 (6) = happyShift action_5
action_39 (9) = happyShift action_6
action_39 (10) = happyShift action_2
action_39 (11) = happyShift action_7
action_39 (12) = happyShift action_8
action_39 (13) = happyShift action_9
action_39 (14) = happyShift action_10
action_39 (17) = happyShift action_11
action_39 (4) = happyGoto action_42
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
action_40 (4) = happyGoto action_22
action_40 _ = happyReduce_2

action_41 _ = happyReduce_10

action_42 (16) = happyShift action_17
action_42 (17) = happyShift action_18
action_42 (20) = happyShift action_19
action_42 (21) = happyShift action_20
action_42 (23) = happyShift action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (5) = happyShift action_4
action_43 (6) = happyShift action_5
action_43 (9) = happyShift action_6
action_43 (10) = happyShift action_2
action_43 (11) = happyShift action_7
action_43 (12) = happyShift action_8
action_43 (13) = happyShift action_9
action_43 (14) = happyShift action_10
action_43 (17) = happyShift action_11
action_43 (4) = happyGoto action_22
action_43 _ = happyReduce_7

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

happyReduce_13 = happySpecReduce_1  4 happyReduction_13
happyReduction_13 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (Int happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  4 happyReduction_14
happyReduction_14 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Negative happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 24 24 notHappyAtAll (HappyState action) sts stk []

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
	TokenLess -> cont 20;
	TokenGreater -> cont 21;
	TokenColon -> cont 22;
	TokenSemicolon -> cont 23;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 24 tk tks = happyError' (tks, explist)
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
