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
    ("subq", ImmStr "dummy"o, stacklocation) : toStackHelper xs counter' hashmap'

  
-- Example usage:
-- toStackHelper [("movq", ImmInt 10, "tmp1"), ("addq", ImmInt 20, "tmp1")] 0 Map.empty

