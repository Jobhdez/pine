module ToStack where

import Parser
import ToMon
import ToSelect
import qualified Data.Map as Map
{--
toStack :: [(String, Imm, String)] -> Int -> Map.Map k a -> [(String, Imm, String)]
toStack [("movq", ImmInt n, tmp), ("addq", ImmInt n2, tmp2)] counter hashmap =
  let stackLocation = "-" ++ show counter ++ "(%rbp)" in
    let imm = show n in
      let imm2 = show n2 in
        [("movq", ImmStr imm, stackLocation), ("addq", ImmStr imm2, stackLocation)]
        
toStack [(instr, ImmInt e, var)] counter =
  let counterstr = show counter in
    let stacklocation = "-" ++ counterstr ++ "(%rbp)" in
      [(instr, ImmStr (show e), stacklocation)

toStack [("movq", ImmInt n, var), ("addq", ImmStr var, var2)] counter =
  let stacklocation = "-" ++ show counter ++ "(%rbp)" in
    [("movq", ImmStr (show n), stacklocation), ("movq", ImmStr var2, "%rax"), ("addq", ImmStr "%rax", stacklocation)]

toStack [("movq", ImmInt n, var), ("subq", ImmInt n2, var2)] counter =
    let stacklocation = "-" ++ show counter ++ "(%rbp)" in
      [("movq", ImmStr (show n), stacklocation), ("subq", ImmStr (show n2), stacklocation)]
--}
data StackExp = StackInstrs [(String, Imm, String)] deriving Show

toStack :: SelectExp -> StackExp
toStack (Instructions ins) =
  StackInstrs outs
  where
    outs = toStackHelper ins 0 Map.empty

toStackHelper :: [(String, Imm, String)] -> Int -> Map.Map String String -> [(String, Imm, String)]
toStackHelper [] _ _ = []
toStackHelper (("movq", ImmInt n, "%rdi"):xs) counter hashmap =
  ("movq", ImmStr (show n), "%rdi") : toStackHelper xs counter hashmap
  
toStackHelper (("movq", ImmInt imm1, tmp1):xs) counter hashmap =
    let (stacklocation, counter', hashmap') =
            if Map.member tmp1 hashmap
            then (hashmap Map.! tmp1, counter, hashmap)
            else let counter' = counter + 8
                     stacklocation' = "-" ++ show counter' ++ "(%rbp)"
                     hashmap' = Map.insert tmp1 stacklocation' hashmap
                 in (stacklocation', counter', hashmap')
    in
        ("movq", ImmStr (show imm1), stacklocation) : toStackHelper xs counter' hashmap'

toStackHelper (("addq", ImmInt imm1, tmp1):xs) counter hashmap =
  let (stacklocation, counter', hashmap') =
        if Map.member tmp1 hashmap
        then (hashmap Map.! tmp1, counter, hashmap)
        else let counter' = counter + 8
                 stacklocation' = "-" ++ show counter' ++ "(%rbp)"
                 hashmap' = Map.insert tmp1 stacklocation' hashmap
               in (stacklocation', counter', hashmap')
   in
    ("addq", ImmStr (show imm1), stacklocation) : toStackHelper xs counter' hashmap'

toStackHelper (("addq", ImmStr imm1, tmp1):xs) counter hashmap =
  let (stacklocation, counter', hashmap', stacklocation2) = (hashmap Map.! tmp1, counter, hashmap, hashmap Map.! imm1)
       
   in
     ("movq", ImmStr stacklocation, "%rax") : ("addq", ImmStr "%rax", stacklocation2) : toStackHelper xs counter' hashmap'

toStackHelper (("subq", ImmInt n, tmp1):xs) counter hashmap =
  let (stacklocation, counter', hashmap') =
        if Map.member tmp1 hashmap
        then (hashmap Map.! tmp1, counter, hashmap)
        else let counter' = counter + 8
                 stacklocation' = "-" ++ show counter' ++ "(%rbp)"
                 hashmap' = Map.insert tmp1 stacklocation' hashmap
               in (stacklocation', counter', hashmap')
   in
    ("subq", ImmStr "dummy", stacklocation) : toStackHelper xs counter' hashmap'
    
toStackHelper (("movq", ImmStr "True", tmp1):xs) counter hashmap =
    let (stacklocation, counter', hashmap') =
            if Map.member tmp1 hashmap
            then (hashmap Map.! tmp1, counter, hashmap)
            else let counter' = counter + 8
                     stacklocation' = "-" ++ show counter' ++ "(%rbp)"
                     hashmap' = Map.insert tmp1 stacklocation' hashmap
                 in (stacklocation', counter', hashmap')
    in
        ("movq", ImmStr "True", stacklocation) : toStackHelper xs counter' hashmap'
        
toStackHelper (("cmpq", ImmStr bool, tmp1):xs) counter hashmap =
  let (stacklocation, counter', hashmap') = (hashmap Map.! tmp1, counter, hashmap)
       
   in
     ("cmpq", ImmStr bool, stacklocation) : toStackHelper xs counter' hashmap'

toStackHelper (("movq", ImmStr imm1, "%rdi"):xs) counter hashmap =
    let (stacklocation, counter', hashmap') =
            if Map.member imm1 hashmap
            then (hashmap Map.! imm1, counter, hashmap)
            else let counter' = counter + 8
                     stacklocation' = "-" ++ show counter' ++ "(%rbp)"
                     hashmap' = Map.insert imm1 stacklocation' hashmap
                 in (stacklocation', counter', hashmap')
    in
        ("movq", ImmStr stacklocation, "%rdi") : toStackHelper xs counter' hashmap'

toStackHelper (("print", ImmStr "dummy", "dummy"):xs) counter hashmap =
  ("print", ImmStr "dummy", "dummy") : toStackHelper xs counter hashmap

toStackHelper (("movq", ImmStr v, v2):xs) counter hashmap =
   let (stacklocation, counter', hashmap', stacklocation2) =
            if Map.member v hashmap && not (Map.member v2 hashmap)
            then let counter' = counter + 8
                     stacklocation2 = "-" ++ show counter' ++ "(%rbp)"
                     hashmap' = Map.insert v2 stacklocation2 hashmap
                 in
                   (hashmap Map.! v, counter', hashmap', stacklocation2)
            else (hashmap Map.! v, counter, hashmap, hashmap Map.! v2)
    in
     ("movq", ImmStr stacklocation, "%rax") : ("movq", ImmStr "%rax", stacklocation2) : toStackHelper xs counter' hashmap'

toStackHelper (x:xs) counter hashmap =
  x : toStackHelper xs counter hashmap
  
{--
toStackHelper (("dummy", ImmStr tmp1, "dummy"):xs) counter hashmap =
  let (stacklocation, counter', hashmap') =
        if Map.member tmp1 hashmap
        then (hashmap Map.! tmp1, counter, hashmap)
        else let counter' = counter + 8
                 stacklocation' = "-" ++ show counter' ++ "(%rbp)"
                 hashmap' = Map.insert tmp1 stacklocation' hashmap
               in (stacklocation', counter', hashmap')
   in
    ("moveq", ImmStr stacklocation, "%rdi") : ("print", ImmStr "dummy", "dummy") : toStackHelper xs counter' hashmap'
--}
  
-- Example usage:
-- toStackHelper [("movq", ImmInt 10, "tmp1"), ("addq", ImmInt 20, "tmp1")] 0 Map.empty

