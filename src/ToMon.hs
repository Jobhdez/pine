module ToMon where

import Parser
import Data.Unique

data MonExp
    = AtmInt Int
    | AtmBool String
    | AtmVar String
    | MonNegative Int
    | MonPlus MonExp MonExp
    | MonMinus MonExp MonExp
    | MonLet String MonExp
    | SeqMon MonExp MonExp
    deriving Show

toMon :: Exp -> Int -> MonExp
toMon (Int n) counter = AtmInt n
toMon (Var v) counter = AtmVar v
toMon (Bool b) counter = AtmBool b
toMon (Plus (Int e) (Int e2)) counter = MonPlus (toMon (Int e) counter) (toMon (Int e2) counter)
toMon (Plus (Int e) (Negative e2)) counter =
  
  (SeqMon (MonLet tempVar (MonNegative e2)) (MonPlus (toMon (Int e) counter) (AtmVar tempVar)))
  where
    tempVar = "temp_" ++ show counter

toMon (Minus e e2) counter = MonMinus (toMon e counter) (toMon e2 counter)
toMon (Exps e e2) counter =
  (SeqMon (toMon e counter) (toMon e2 counter2))
  where
    counter2 = counter + 1
  
