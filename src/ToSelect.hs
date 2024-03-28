module ToSelect where

import Parser
import ToMon
import ToExposeAlloc

{--
This module takes the ANF AST and builds up the x86 instructions but with variables instead of stack locations.
This is the instruction selection phase.
--}

data Imm = ImmInt Int | ImmStr String | TupleMem String | ImmReg String | ImmStack String deriving Show

data SelectExp =
  Instructions [(String, Imm, Imm)]
  | Immediate Int
  deriving Show

selectInstructions :: MonExp -> SelectExp
selectInstructions monexp =
  Instructions instrs
  where
    instrs = toSelect monexp

toSelect :: MonExp -> [(String, Imm, Imm)]
toSelect (AtmInt n) = [("immediate",ImmInt n, ImmStr "dummy")]

toSelect (MonLessThn (AtmInt n) (AtmInt n2)) =
  [("cmpq", ImmInt n2, ImmStr (show n))]

toSelect (MonLessThn (AtmVar v) (AtmInt n)) =
  [("cmpq", ImmInt  n, ImmStr v)]

toSelect (MonGreaterThn (AtmInt n) (AtmInt n2)) =
  [("cmpq", ImmInt n2, ImmStr (show n))]

toSelect (MonGreaterThn (AtmVar n) (AtmInt n2)) =
  [("cmpq", ImmInt n2,  ImmStr n)]
  
toSelect (MonPrint (AtmVar v)) =
  [("movq", ImmStr v, ImmReg "%rdi"), ("print", ImmStr "dummy", ImmStr "dummy")]

toSelect (MonPrint (MonTupIndex var2 index)) =
  let mem = 8 * (index + 1) in
    let memt = show mem ++ "(%r11)" in
      [("movq", TupleMem memt, ImmReg "%rdi"), ("callq", ImmStr "print_int", ImmStr "dummy")]

toSelect (MonPlus (AtmInt n) (AtmInt n2)) =
  [("movq", ImmInt n, ImmStr "tempvar"), ("addq", ImmInt n2, ImmStr "tempvar")]

toSelect (MonPlus (AtmVar v) (AtmInt 1)) =
  [("incq", ImmStr v, ImmStr "dummy")]
  
toSelect (MonPlus (AtmVar v) (AtmInt e))  =
  [("addq", ImmInt e, ImmStr v)]

toSelect (MonPlus (AtmVar v) (AtmVar v2)) =
  [("movq", ImmStr v, ImmReg "%rdi"), ("addq", ImmStr "rdi", ImmStr v2)]
  
toSelect (MonLet var (AtmInt n)) =
  [("movq", ImmInt n, ImmStr var)]

toSelect (MonLet var (AtmVar var2)) =
  [("movq", ImmStr var2, ImmStr var)]

toSelect (MonLet var (MonPlus (AtmVar v) (AtmInt 1))) =
  [("incq", ImmStr v, ImmStr "dummy")]
  
toSelect (MonLet var (MonPlus (AtmInt n) (AtmInt n2))) =
  [("movq", ImmInt n, ImmStr var), ("addq", ImmInt n2, ImmStr var)]

toSelect (MonLet var (MonPlus (AtmInt n) (AtmVar v)))  =
  [("movq", ImmInt n, ImmStr var), ("addq", ImmStr v, ImmStr var)]

toSelect (MonLet var (MonPlus (AtmVar var2) (AtmInt n))) =
  [("movq", ImmInt n, ImmStr var), ("addq", ImmStr var, ImmStr var2)]
  
toSelect (MonLet var (MonNegative n))  =
  [("movq", ImmInt n, ImmStr var), ("subq", ImmInt 0, ImmStr var)]
  
toSelect (MonWhile cnd (MonIf cnd2 thn els)) =
  let cif = toCLikewhile (MonIf cnd2 thn els) 0 ("jmp", "to", MonBlock "whiletest", "thanks", ":)")in
    let cselect = toSelect cif in
      let selectcnd = toSelect cnd in
      [("whiletest", ImmStr "whiletestlabel", ImmStr ":")] ++ selectcnd ++ [("jge", ImmStr "exit", ImmStr "dummy"), ("jmp", ImmStr "iftest", ImmStr "dummy")] ++ [("iftest", ImmStr "iftestlabel", ImmStr "dummy")] ++ cselect ++ [("exit", ImmStr "retq", ImmStr "dummy")]
        
toSelect (MonWhile cnd exps) =
  let selectcnd = toSelect cnd in
    let selectexps = toSelect exps in
      [("whiletest", ImmStr "dummy", ImmStr "dummy")] ++ selectcnd ++ [("jge", ImmStr "exit", ImmStr "dummy"), ("jmp", ImmStr "loop", ImmStr "dummy")]++[("loop", ImmStr "tst", ImmStr "tstdummy")] ++ selectexps ++ [("jmp", ImmStr "whiletest", ImmStr "dummy")] ++ [("exit", ImmStr "retq", ImmStr "dummy")]
                                                                                                                                                                                                                                                                       
toSelect (SeqMon (MonLet var (MonBegin (Begin assignments (IfExpose cndexpose n collect) allocate allocassignments str))) (MonPrint (MonTupIndex var2 index))) =
  let assigs = toSelectBeginAssignments assignments in
    let cnd = toIfCndSelect cndexpose in
      let collect' = collectToSelect collect in
        let alloc = allocateToSelect allocate in
          let allocassigns = toSelectBeginAllocAssigns allocassignments in
            let printindex = toSelect (MonPrint (MonTupIndex var2 index)) in
              [("start", ImmStr "dummy", ImmStr "dummy")] ++ cnd ++ [("block_77", ImmStr "dummy", ImmStr "dummy")] ++ [("movq", ImmInt 0, ImmReg "%r13"), ("jmp", ImmStr "block_80", ImmStr "dummy")] ++ [("block_78", ImmStr "dummy", ImmStr "dummy")]++  collect' ++ [("jmp", ImmStr "block_80", ImmStr "dummy")] ++ [("block_80", ImmStr "dummy", ImmStr "dummy")] ++ alloc ++ allocassigns ++ printindex ++ [("jmp", ImmStr "conclusion", ImmStr "dummy")] ++ [("conclusion", ImmStr "dummy", ImmStr "dummy")] ++ [("subq", ImmInt 8, ImmReg "%r15"), ("addq", ImmInt 0, ImmReg "%rsp"), ("popq", ImmReg "%rbp", ImmStr "dummy"), ("retq", ImmStr "dummy", ImmStr "dummy")]
                              
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
toSelectHelper :: (String, String, MonExp, String, String) -> [(String, Imm, Imm)]
toSelectHelper s =
  case s of
    (dummy, "start", MonLet var (AtmBool "True"), b1, b2) -> [("start", ImmStr "dummy", ImmStr "dummy"), ("movq", ImmStr "True", ImmStr var), ("cmpq", ImmStr "True", ImmStr var), ("jmp", ImmStr b1, ImmStr "dummy"), ("je", ImmStr b2, ImmStr "dummy")]
    (dummy, "start", MonLet var cnd, b1, b2) -> let cnd' = toSelect cnd in
      cnd' ++ [("jmp", ImmStr b1, ImmStr "dummy"), ("je", ImmStr b2, ImmStr "dummy"), (b1, ImmStr "blkdummy", ImmStr "dummy")]
    (dummy, b1, AtmInt n, tmp, b2) -> [(b1, ImmStr "dummy", ImmStr "dummy"), ("movq", ImmInt n, ImmStr tmp)]
    (dummy, b1, MonPrint (AtmInt n), tmp, b2) -> [(b1, ImmStr "dummy", ImmStr "dummy"), ("movq", ImmInt n, ImmReg "%rdi"), ("print", ImmStr "dummy", ImmStr "dummy")]
    (dummy, b1, MonPrint (AtmVar n), tmp, b2) -> [(b1, ImmStr "dummy", ImmStr "dummy"), ("movq", ImmStr n, ImmReg "%rdi"), ("print", ImmStr "dummy", ImmStr "dummy")]
    (dummy, b1, SeqMon x y, tmp, b2) -> let ssexp = toSelect (SeqMon x y) in
      ssexp
    (b0, b1, MonLet var (AtmBool bool), tmp, b2) -> [(b0, ImmStr "blk", ImmStr "blk"),("movq", ImmStr bool, ImmStr var), ("cmpq", ImmStr bool, ImmStr var), ("jmp", ImmStr b1, ImmStr "dummy"), ("je", ImmStr b2, ImmStr "dummy")]
    (dummy, b1, AtmBool bool, tmp, b2) -> [(b1, ImmStr "$$block", ImmStr "$$block"), ("movq", ImmStr bool, ImmStr tmp)]
    (dummy, b1, MonLessThn e e2, tmp, b2) -> let cndss = toSelect (MonLessThn e e2) in
      [(b1, ImmStr "$$block", ImmStr "$$block")] ++ cndss
    (dummy, b1, MonGreaterThn e e2, tmp, b2) -> let cndss = toSelect (MonGreaterThn e e2) in
      [(b1, ImmStr "$$block", ImmStr "$$block")] ++ cndss
    ("jmp", "to", MonBlock whiletest, dummy, dummy2) -> [("jmp", ImmStr whiletest, ImmStr "thanks")]

{-- example:
suppose you have a tuple: (1,1,3).

the 64 bit tag for this tuple would be 000 000011 1. You dont actually need
the whole 64 bits. In assembly I will be using instructions that manipulate
64 bits.

the first three 0 bits are 0s because when processing a tuple you assign
a 0 bit to a integer and 1 to a tuple.

000011 on the other hand is the length of the tuple. in this case 3.

the last bit represents whether its reachable from the root set.

example using this code:

> makeTag (1;1;3)
--> 7
the tag 7 will be placed in front of the tuple. this is done because the
garbage collector needs to distinguish tuples from other data :-)
--}
-- todo: rewrite makeTag
makeTag :: Int -> Int
makeTag lengthTup =
  let makePointerMask :: Int  -> Int -> String -> String
      makePointerMask 0 counter str = reverse str
      makePointerMask length counter str =
       {- the point mask corresponds to a sequence of bits; if
          the entry in the tuple is an int then return "0"; if its
           another tuple return "1".-}
        let str' = str ++ (show counter) in
          str' ++ makePointerMask (length - 1) counter str'
      
      tupleLengthToBits :: Int -> String
      tupleLengthToBits len = let binaryStr = reverse (go len)
                                  go 0 = "0"
                                  go n = if n `mod` 2 == 1 then '1' : go (n `div` 2) else '0' : go (n `div` 2)
                              in replicate (6 - length binaryStr) '0' ++ binaryStr

      tagBitsToDecimal :: String -> Int
      tagBitsToDecimal bits = go (reverse bits) 0
        where
          go [] _ = 0
          go (x:xs) n = (if x == '1' then 2 ^ n else 0) + go xs (n+1)

  in let len = tupleLengthToBits lengthTup
         pointerMask = makePointerMask lengthTup 0  ""
         fwdPtr = "1"
     in tagBitsToDecimal (pointerMask ++ len ++ fwdPtr)
      
    
toSelectBeginAssignments :: Assignments -> [(String, Imm, Imm)]
toSelectBeginAssignments (Assigns e) =
  toAssignmentsHelper e
  
toAssignmentsHelper :: [Assignment] -> [(String, Imm, Imm)]
toAssignmentsHelper [] = []
toAssignmentsHelper ((Assi var index e):xs) =
  ("movq", ImmInt e, ImmStr var):toAssignmentsHelper xs

toSelectBeginAllocAssigns :: AllocAssignments -> [(String, Imm, Imm)]
toSelectBeginAllocAssigns (AllocAssigns assi) =
  toAllocAssiHelper assi

toAllocAssiHelper :: [AllocAssign] -> [(String, Imm, Imm)]
toAllocAssiHelper [] = []
toAllocAssiHelper ((AllocAssign tuplename index var val):xs) =
  let n = 8 * (index + 1) in
    let tupmem = show n ++ "(%r11)" in
      ("movq", ImmInt val, TupleMem tupmem) : toAllocAssiHelper xs

toIfCndSelect :: CndExpose -> [(String, Imm, Imm)]
toIfCndSelect (GlobalValue free_ptr bytes from_space) =
  [("movq", ImmStr "free_ptr(%rip)", ImmReg "%rax"), ("addq", ImmInt bytes, ImmReg "%rax"), ("movq", ImmStr "fromspace_end(%rip)", ImmReg "%r13"), ("cmpq", ImmReg "%r13", ImmReg "%rax"), ("jl", ImmStr "block_77", ImmStr "dummy"), ("jmp", ImmStr "block_78", ImmStr "dummy")]

allocateToSelect :: Allocate -> [(String, Imm, Imm)]
allocateToSelect (Alloc lhs len tuptype) =
  let tag = makeTag len in
    [("movq", ImmStr "free_ptr(%rip)", ImmReg "%r11"), ("addq", ImmInt (8 * (len + 1)), ImmStr "free_ptr(%rip)"), ("movq", ImmInt tag, TupleMem "0(%r11)"), ("movq", ImmReg "%r11", ImmReg "%r14"), ("movq", ImmReg "%r14", ImmReg "%r11")]

collectToSelect :: CollectExpose -> [(String, Imm, Imm)]
collectToSelect (Collect bytes) =
  [("movq", ImmReg "%r15", ImmReg "%rdi"), ("movq", ImmInt bytes, ImmReg "%rsi"), ("callq", ImmStr "collect", ImmStr "dummy")]
