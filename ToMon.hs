module ToMon where

import Parser

data MonExp
    = AtmInt Int
    | AtmBool String
    | AtmVar String
    | MonPlus MonExp MonExp
    | MonMinus MonExp MonExp
    deriving Show
toMon :: Exp -> MonExp
toMon (Int n) = AtmInt n
toMon (Var v) = AtmVar v
toMon (Bool b) = AtmBool b
toMon (Plus e e2) = MonPlus (toMon e) (toMon e2)
toMon (Minus e e2) = MonMinus (toMon e) (toMon e2)
