module ToX86 where

import Parser
import ToMon
import ToSelect
import qualified Data.Map as Map


toX86 :: [(String, Imm, Imm)] -> String
toX86 [] = ""
toX86 (x:xs) =
  toX86Helper x ++ toX86 xs
toX86Helper :: (String, Imm, Imm) -> String
toX86Helper ("start", ImmStr dummy, ImmStr dummy2) =
  ".globl main\n" ++ "main:\n" ++ "\tpushq %rbp\n" ++ "\tmovq %rsp, %rbp\n" ++ "\tsubq $8, %rsp\n" 

toX86Helper ("movq", ImmStr "True", ImmStack stack) =
  "\tmovq $1, " ++ stack ++ "\n" 

toX86Helper ("cmpq", ImmStr "True", ImmStack stack) =
  "\tcmpq $1, " ++ stack ++ "\n" 

toX86Helper ("jmp", ImmStr block, ImmStr dummy) =
  "\tjmp " ++ block ++ "\n" 

toX86Helper ("je", ImmStr block, ImmStr dummy) =
  "\tje " ++ block ++ "\n"

toX86Helper ("jge", ImmStr block, ImmStr dummy) =
  "\tjge " ++ block ++ "\n" 

toX86Helper ("movq", ImmStr n, ImmReg reg) =
  "\tmovq " ++ "$" ++ n ++ "," ++ reg ++ "\n"

toX86Helper ("movq", ImmInt n, ImmStack stk) =
  "\tmovq $" ++ show n ++ ", " ++ stk ++ "\n"

toX86Helper ("movq", ImmStack stk, ImmReg reg) =
  "\tmovq $" ++ stk ++ ", " ++ reg ++ "\n"

toX86Helper ("incq", ImmStack stk, ImmStr dummy) =
  "\tincq stk\n"
  
toX86Helper ("cmpq", ImmInt n, ImmStack stk) =
    "\tcmpq $" ++ show n ++ ", " ++ stk ++ "\n"
    
toX86Helper ("print", ImmStr dm, ImmStr dm2) =
  "\tcallq " ++ "print_int\n" ++ "\taddq $8, %rsp\n" ++ "\tpopq %rbp\n" ++ "\tretq\n" 

toX86Helper (b1, ImmStr dm, ImmStr dm2)=
  b1 ++ ":\n"
  
