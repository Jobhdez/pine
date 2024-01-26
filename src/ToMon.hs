module ToMon where

import Parser

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
toMon (Negative n) counter =
  let tmpname = "temp_" ++ show counter in
    let assi = MonLet tmpname (MonNegative n) in
      SeqMon assi (AtmVar tmpname)
    
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

toMon (Let var (Plus (Int e) (Negative e2))) counter =
  let monexp = toMon (Plus (Int e) (Negative e2)) counter
      in
    let letexp = getMonLetNegative monexp
        plusexp = getMonPlus monexp
        in
      let assignment = MonLet var plusexp
          in
        SeqMon letexp assignment
 
toMon (Let var (Negative n)) counter =
  MonLet var (MonNegative n)

toMon (Let var e) counter =
  MonLet var (toMon e counter)
  
getMonLetNegative :: MonExp -> MonExp
getMonLetNegative (SeqMon (MonLet s negative) (MonPlus e e2)) = (MonLet s negative)

getMonPlus :: MonExp -> MonExp
getMonPlus (SeqMon (MonLet s negative) (MonPlus e e2)) = (MonPlus e e2)
  
