module ToX86 where

import Parser
import ToExposeAlloc
import ToMon
import ToSelect
import qualified Data.Map as Map

-- this module turns the AST from the ToStack pass into a string representation of the x86 instructions.

toX86' :: [(String, Imm, Imm)] -> String
toX86' [] = ""

toX86' (x:xs) =
  toX86W x ++ toX86' xs
  
toX86W :: (String, Imm, Imm) -> String
toX86W ("start", ImmStr dummy, ImmStr dummy2) =
  "\t.globl main\n" ++ "main:\n" ++ "\tpushq %rbp\n" ++ "\tmovq %rsp, %rbp\n" ++ "\tsubq $8, %rsp\n" 

toX86W ("movq", ImmStr "True", ImmStack stack) =
  "\tmovq $1, " ++ stack ++ "\n" 

toX86W ("cmpq", ImmStr "True", ImmStack stack) =
  "\tcmpq $1, " ++ stack ++ "\n" 
toX86W ("cmpq", ImmReg reg, ImmReg reg2) =
  "\tcmpq " ++ reg ++ "," ++ reg2 ++ "\n"
  
toX86W ("jmp", ImmStr block, ImmStr dummy) =
  "\tjmp " ++ block ++ "\n" 

toX86W ("je", ImmStr block, ImmStr dummy) =
  "\tje " ++ block ++ "\n"

toX86W ("jge", ImmStr block, ImmStr dummy) =
  "\tjge " ++ block ++ "\n"

toX86W ("jl", ImmStr block, ImmStr dummy) =
  "\tjl " ++ block ++ "\n" 
  
toX86W ("exit", ImmStr "retq", ImmStr dmy) =
  "exit:\n" ++ "\taddq $8, %rsp\n" ++ "\tpopq %rbp\n" ++  "\tretq\n"
  
toX86W ("movq", ImmReg reg, ImmReg reg2) =
  "\tmovq "  ++ reg ++ "," ++ reg2 ++ "\n"

toX86W ("movq", ImmInt n, TupleMem tmp) =
   "\tmovq "  ++ "$" ++ show n ++ "," ++ tmp ++ "\n"
   
toX86W ("movq", TupleMem tmp, ImmReg reg) =
   "\tmovq " ++ tmp ++ "," ++ reg ++ "\n"
   
toX86W ("movq", ImmStr n, ImmReg reg) =
  "\tmovq "  ++ n ++ "," ++ reg ++ "\n"

   
toX86W ("movq", ImmInt n, ImmReg reg) =
  "\tmovq "  ++ "$" ++ show n ++ "," ++ reg ++ "\n"
  
toX86W ("movq", ImmInt n, ImmStack stk) =
  "\tmovq $" ++ show n ++ ", " ++ stk ++ "\n"

toX86W ("movq", ImmStack stk, ImmReg reg) =
  "\tmovq " ++ stk ++ ", " ++ reg ++ "\n"

toX86W ("incq", ImmStack stk, ImmStr dummy) =
  "\tincq " ++ stk ++ "\n"

toX86W ("callq", ImmStr fn, ImmStr dmy) =
  "\tcallq " ++ fn ++ "\n"
  
toX86W ("cmpq", ImmInt n, ImmStack stk) =
    "\tcmpq $" ++ show n ++ ", " ++ stk ++ "\n"

toX86W ("print", ImmStr dm, ImmStr dm2) =
  "\tcallq " ++ "print_int\n" 
  
toX86W (b1, ImmStr dm, ImmStr dm2)=
  b1 ++ ":\n"

toX86W ("addq", ImmInt n, ImmReg reg) =
  "\taddq " ++ "$" ++ show n ++ ", " ++ reg ++ "\n"

toX86W ("addq", ImmInt n, ImmStr fp) =
  "\taddq " ++ "$" ++ show n ++ ", " ++  fp ++ "\n"

--
toX86t' :: [(String, Imm, Imm)] -> String
toX86t' [] = ""

toX86t' (x:xs) =
  toX86Wt x ++ toX86t' xs
  
toX86Wt :: (String, Imm, Imm) -> String
toX86Wt ("main", ImmStr dummy, ImmStr dummy2) =
  "\t.globl main\n" ++ "main:\n" ++ "\tpushq %rbp\n" ++ "\tmovq %rsp, %rbp\n" ++ "\tsubq $0, %rsp\n" ++ "\tmovq $65536, %rdi\n" ++ "\tmovq $65536, %rsi\n" ++ "\tcallq initialize\n" ++ "\tmovq rootstack_begin(%rip), %r15\n" ++ "\tmovq $0, 0(%r15)\n" ++ "\taddq $8, %r15\n" ++ "\tjmp start\n"

toX86Wt ("start", ImmStr dmy, ImmStr dm2) =
  "start:\n"

toX86Wt ("subq", ImmInt n, ImmReg reg) =
  "\tsubq " ++ "$" ++ show n ++ ", " ++ reg ++ "\n"

toX86Wt ("movq", ImmStr "True", ImmStack stack) =
  "\tmovq $1, " ++ stack ++ "\n" 

toX86Wt ("cmpq", ImmStr "True", ImmStack stack) =
  "\tcmpq $1, " ++ stack ++ "\n" 
toX86Wt ("cmpq", ImmReg reg, ImmReg reg2) =
  "\tcmpq " ++ reg ++ "," ++ reg2 ++ "\n"
  
toX86Wt ("jmp", ImmStr block, ImmStr dummy) =
  "\tjmp " ++ block ++ "\n" 

toX86Wt ("je", ImmStr block, ImmStr dummy) =
  "\tje " ++ block ++ "\n"

toX86Wt ("jge", ImmStr block, ImmStr dummy) =
  "\tjge " ++ block ++ "\n"

toX86Wt ("jl", ImmStr block, ImmStr dummy) =
  "\tjl " ++ block ++ "\n" 
  
toX86Wt ("exit", ImmStr "retq", ImmStr dmy) =
  "exit:\n" ++ "\taddq $8, %rsp\n" ++ "\tpopq %rbp\n" ++  "\tretq\n"
  
toX86Wt ("movq", ImmReg reg, ImmReg reg2) =
  "\tmovq "  ++ reg ++ "," ++ reg2 ++ "\n"

toX86Wt ("movq", ImmInt n, TupleMem tmp) =
   "\tmovq "  ++ "$" ++ show n ++ "," ++ tmp ++ "\n"
   
toX86Wt ("movq", TupleMem tmp, ImmReg reg) =
   "\tmovq " ++ tmp ++ "," ++ reg ++ "\n"
   
toX86Wt ("movq", ImmStr n, ImmReg reg) =
  "\tmovq "  ++ n ++ "," ++ reg ++ "\n"

toX86Wt ("popq", ImmReg reg, ImmStr "dummy") =
  "\tpopq " ++ reg ++ "\n"

toX86Wt ("retq", ImmStr dummy, ImmStr dummy2) =
  "\tretq"
   
toX86Wt ("movq", ImmInt n, ImmReg reg) =
  "\tmovq "  ++ "$" ++ show n ++ "," ++ reg ++ "\n"
  
toX86Wt ("movq", ImmInt n, ImmStack stk) =
  "\tmovq $" ++ show n ++ ", " ++ stk ++ "\n"

toX86Wt ("movq", ImmStack stk, ImmReg reg) =
  "\tmovq " ++ stk ++ ", " ++ reg ++ "\n"

toX86Wt ("incq", ImmStack stk, ImmStr dummy) =
  "\tincq " ++ stk ++ "\n"

toX86Wt ("callq", ImmStr fn, ImmStr dmy) =
  "\tcallq " ++ fn ++ "\n"
  
toX86Wt ("cmpq", ImmInt n, ImmStack stk) =
    "\tcmpq $" ++ show n ++ ", " ++ stk ++ "\n"

toX86Wt ("print", ImmStr dm, ImmStr dm2) =
  "\tcallq " ++ "print_int\n" 
  
toX86Wt (b1, ImmStr dm, ImmStr dm2)=
  b1 ++ ":\n"

toX86Wt ("addq", ImmInt n, ImmReg reg) =
  "\taddq " ++ "$" ++ show n ++ ", " ++ reg ++ "\n"

toX86Wt ("addq", ImmInt n, ImmStr fp) =
  "\taddq " ++ "$" ++ show n ++ ", " ++  fp ++ "\n"
  
--
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
  
