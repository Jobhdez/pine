module ToMon where

import Parser
import ToExposeAlloc

import qualified Data.Map as Map

{--
This module takes the syntax AST and turns it to basically A normal form. If you are 
interested you should check out this blog post by dr. might: https://matt.might.net/articles/a-normalization/
--}

data MonExp
    = AtmInt Int
    | AtmBool String
    | AtmVar String
    | MonNegative Int
    | MonBegin Begin
    | MonBlock String
    | MonPlus MonExp MonExp
    | MonWhile MonExp MonExp
    | MonMinus MonExp MonExp
    | MonLet String MonExp
    | MonTupIndex String Int
    | MonTuple MonExp
    | SeqMon MonExp MonExp
    | MonIf MonExp MonExp MonExp
    | MonPrint MonExp
    | MonLessThn MonExp MonExp
    | MonGreaterThn MonExp MonExp
    | MonLstSeq MonExp MonExp MonExp
    | CBlock [(String, String, MonExp, String, String)]
    deriving Show

toMon :: Exp -> Int -> MonExp
toMon (Int n) counter = AtmInt n

toMon (LessThn e e2) counter =
  MonLessThn (toMon e counter) (toMon e2 counter)

toMon (GreaterThn e e2) counter =
  MonGreaterThn (toMon e counter) (toMon e2 counter)
  
toMon (Negative n) counter =
  let tmpname = "temp_" ++ show counter in
    let assi = MonLet tmpname (MonNegative n) in
      SeqMon assi (AtmVar tmpname)

toMon (While cnd exp) counter =
  MonWhile (toMon cnd counter) (toMon exp counter)
  
toMon (PrintExp e) counter =
  let monexp = toMon e counter
  in
    MonPrint monexp

toMon (TupleIndex (Var var) index) counter =
      MonTupIndex var index
      
toMon (Var v) counter = AtmVar v
toMon (Bool b) counter = AtmBool b
toMon (Plus (Int e) (Int e2)) counter = MonPlus (toMon (Int e) counter) (toMon (Int e2) counter)
toMon (Plus (Int e) (Negative e2)) counter =
  
  (SeqMon (MonLet tempVar (MonNegative e2)) (MonPlus (toMon (Int e) counter) (AtmVar tempVar)))
  where
    tempVar = "temp_" ++ show counter
toMon (Plus e e2) counter =
  MonPlus (toMon e counter) (toMon e2 counter)
  
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

toMon (TupleExp exps) counter =
  let monexps = toMon exps counter in
    MonTuple monexps



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
        
toMon (IfExp cnd thn els) counter =
  MonIf (toMon cnd counter) (toMon thn counter) (toMon els counter)
getMonLetNegative :: MonExp -> MonExp
getMonLetNegative (SeqMon (MonLet s negative) (MonPlus e e2)) = (MonLet s negative)

getMonPlus :: MonExp -> MonExp
getMonPlus (SeqMon (MonLet s negative) (MonPlus e e2)) = (MonPlus e e2)
  
toCLike :: MonExp -> Int -> MonExp
toCLike (MonLstSeq (MonLet var b) (MonLet var2 (MonIf (AtmVar var3) thn els)) (MonIf (AtmVar var4) thn2 els2)) counter =
  let block = "block_" ++ show counter in
    let counter2 = counter + 1 in
      let block2 = "block_" ++ show counter2 in
        let counter3 = counter2 + 1 in
          let block3 = "block_" ++ show counter3 in
            let counter4 = counter3 + 1 in
              let block4 = "block_" ++ show counter4 in
                CBlock [("NoBlock", "start", (MonLet var b), block, block2), (block, block3, (MonLet var2 thn), var, block4), (block2, block3, (MonLet var2 els), var, block4), ("isBlock", block3, thn2, var3, block4), ("isBlock", block4, els2, var3, "dummy")]
                
toCLike (MonIf b  thn els) counter =
  let block = "block_" ++ show counter in
    let tmpname = "temp_" ++ show counter in
      let tmpname2 = "temp_" ++ show (counter + 1) in
        let counter2 = counter + 1 in
          let block2 = "block_" ++ show counter2 in
            CBlock [("dummy", "start", (MonLet tmpname b), block, block2), ("dummy", block, thn, tmpname2, block2), ("dummy",block2, els, tmpname2, "dummy")]


toCLike monexp counter =
  monexp
  
toCLikewhile :: MonExp -> Int-> (String, String, MonExp, String, String) -> MonExp
toCLikewhile (MonIf b  thn els) counter whiletest =
  let block = "block_" ++ show counter in
    let tmpname = "temp_" ++ show counter in
      let tmpname2 = "temp_" ++ show (counter + 1) in
        let counter2 = counter + 1 in
          let block2 = "block_" ++ show counter2 in
            CBlock [("dummy", "start", (MonLet tmpname b), block, block2), ("dummy", block, thn, tmpname2, block2), whiletest, ("dummy",block2, els, tmpname2, "dummy"), whiletest]

toMonBgn :: Exp -> MonExp
toMonBgn (Exps (Let var (TupleExp exps)) (PrintExp (TupleIndex (Var var2) index))) =
  let bgn = makeBegin (TupleExp exps) in
    let monbgn = MonBegin bgn in
      let montupindex = MonTupIndex var2 index in
        SeqMon (MonLet var monbgn) (MonPrint montupindex)
