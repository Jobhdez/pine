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
toSelect (MonPlus (AtmInt n) (AtmInt n2)) =
  [("movq", ImmInt n, "tempvar"), ("addq", ImmInt n2, "tempVar")]
toSelect (MonLet var (AtmInt n)) =
  [("movq", ImmInt n, var)]

toSelect (MonLet var (MonPlus (AtmInt n) (AtmInt n2))) =
  [("movq", ImmInt n, var), ("addq", ImmInt n2, var)]

toSelect (MonLet var (MonPlus (AtmInt n) (AtmVar v))) =
  [("movq", ImmInt n, var), ("addq", ImmStr v, var)]
toSelect (MonLet var (MonNegative n)) =
  [("movq", ImmInt n, var), ("subq", ImmInt 0, var)]

toSelect (SeqMon (MonLet var e) (MonLet var2 (MonPlus e2 e3))) =
  let firsts = toSelect (MonLet var e) in
    let seconds = toSelect (MonLet var2 (MonPlus e2 e3)) in
      firsts ++ seconds
  
          
