module ToSelect where

import Parser
import ToMon

data Imm = ImmInt Int | ImmStr String deriving Show

data SelectExp =
  Instructions [(String, Imm, String)]
  | Immediate Int
  deriving Show

selectInstructions :: MonExp -> SelectExp
selectInstructions monexp =
  Instructions instrs
  where
    instrs = toSelect monexp

toSelect :: MonExp -> [(String, Imm, String)]
toSelect (AtmInt n) = [("immediate",ImmInt n, "dummy")]

toSelect (MonPrint (AtmVar v)) =
  [("movq", ImmStr v, "%rdi"), ("print", ImmStr "dummy", "dummy")]
  
toSelect (MonPlus (AtmInt n) (AtmInt n2)) =
  [("movq", ImmInt n, "tempvar"), ("addq", ImmInt n2, "tempvar")]

toSelect (MonPlus (AtmVar v) (AtmInt e))  =
  [("addq", ImmInt e, v)]

toSelect (MonPlus (AtmVar v) (AtmVar v2)) =
  [("movq", ImmStr v, "%rdi"), ("addq", ImmStr "rdi", v2)]
  
toSelect (MonLet var (AtmInt n)) =
  [("movq", ImmInt n, var)]

toSelect (MonLet var (AtmVar var2)) =
  [("movq", ImmStr var2, var)]
  
toSelect (MonLet var (MonPlus (AtmInt n) (AtmInt n2))) =
  [("movq", ImmInt n, var), ("addq", ImmInt n2, var)]

toSelect (MonLet var (MonPlus (AtmInt n) (AtmVar v)))  =
  [("movq", ImmInt n, var), ("addq", ImmStr v, var)]

toSelect (MonLet var (MonPlus (AtmVar var2) (AtmInt n))) =
  [("movq", ImmInt n, var), ("addq", ImmStr var, var2)]
  
toSelect (MonLet var (MonNegative n))  =
  [("movq", ImmInt n, var), ("subq", ImmInt 0, var)]

toSelect (SeqMon (MonLet var e) (MonLet var2 (MonPlus e2 e3)))  =
  -- e.g., let x = 4;; let y = 3 + 4;;
  let firsts = toSelect (MonLet var e) in
    let seconds = toSelect (MonLet var2 (MonPlus e2 e3)) in
      firsts ++ seconds

toSelect (SeqMon e e2)  =
  let firsts = toSelect e in
    let seconds = toSelect e2 in
      firsts ++ seconds
      
toSelect (CBlock []) = []
toSelect (CBlock (x:xs)) =
  toSelectHelper x ++ rest
  where
    rest = toSelect (CBlock xs)
    
toSelectHelper :: (String, MonExp, String, String) -> [(String, Imm, String)]
toSelectHelper s =
  case s of
    ("start", MonLet var (AtmBool "True"), b1, b2) -> [("start", ImmStr "dummy", "dummy"), ("movq", ImmStr "True", var), ("cmpq", ImmStr "True", var), ("jmp", ImmStr b1, "dummy"), ("je", ImmStr b2, "dummy")]
    (b1, AtmInt n, tmp, b2) -> [(b1, ImmStr "dummy", "dummy"), ("movq", ImmInt n, tmp)]
    (b1, MonPrint (AtmInt n), tmp, b2) -> [(b1, ImmStr "dummy", "dummy"), ("movq", ImmInt n, "%rdi"), ("print", ImmStr "dummy", "dummy")]
    (b1, MonPrint (AtmVar v), tmp, b2)  -> [(b1, ImmStr "dummy", "dummy"), ("movq", ImmStr v, "%rdi"), ("print", ImmStr "dummy", "dummy")]
    (b1, SeqMon x y, tmp, b2) -> let ssexp = toSelect (SeqMon x y) in
      ssexp
    (b1, MonLet var (AtmBool bool), tmp, b2) -> [("movq", ImmStr bool, var), ("cmpq", ImmStr bool, var), ("jmp", ImmStr b1, "dummy"), ("je", ImmStr b2, "dummy")]
    
