module ToMon where

import Parser
import qualified Data.Map as Map

data MonExp
    = AtmInt Int
    | AtmBool String
    | AtmVar String
    | MonNegative Int
    | MonPlus MonExp MonExp
    | MonMinus MonExp MonExp
    | MonLet String MonExp
    | SeqMon MonExp MonExp
    | MonIf MonExp MonExp MonExp
    | MonLstSeq MonExp MonExp MonExp
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

toMon (IfExp (Bool b) thn els) counter =
  MonIf (toMon (Bool b) counter) (toMon thn counter) (toMon els counter)
toMon (IfExp (Var v) thn els) counter =
  MonIf (toMon (Var v) counter) (toMon thn counter) (toMon els counter)
toMon (IfExp (IfExp cnd thn els) thn2 els2) counter =
  let tmpname = "temp_" ++ show counter in
    let counter2 = counter + 1 in
      let tmpname2 = "temp_" ++ show counter2 in
        let counter3 = counter2 + 1 in
          let counter4 = counter3 + 1 in
            MonLstSeq (MonLet tmpname (toMon cnd counter3)) (MonLet tmpname2 (toMon (IfExp (Var tmpname) thn els) counter4)) (toMon (IfExp (Var tmpname2) thn2 els2) counter4)
        
  
getMonLetNegative :: MonExp -> MonExp
getMonLetNegative (SeqMon (MonLet s negative) (MonPlus e e2)) = (MonLet s negative)

getMonPlus :: MonExp -> MonExp
getMonPlus (SeqMon (MonLet s negative) (MonPlus e e2)) = (MonPlus e e2)
  
toCLike :: MonExp -> Int -> [(String, MonExp)]
toCLike (MonLstSeq (MonLet var b) (MonLet var2 (MonIf var3 thn els)) (MonIf var4 thn2 els2)) counter =
  let block = "block_" ++ show counter in
    let counter2 = counter + 1 in
      let block2 = "block_" ++ show counter2 in
        let counter3 = counter2 + 1 in
          let block3 = "block_" ++ show counter3 in
            let counter4 = counter3 + 1 in
              let block4 = "block_" ++ show counter4 in
                [("start", (MonLet var b)), (block, (MonLet var2 thn)), (block2, (MonLet var2 els)), (block3, thn2), (block4, els2)]
                
toCLike (MonIf (AtmBool b) thn els) counter =
  let block = "block_" ++ show counter in
    let counter2 = counter + 1 in
      let block2 = "block_" ++ show counter2 in
        [("start", (MonLet "temp_0" (AtmBool b))), (block, thn), (block2, els)]
