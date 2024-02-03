module ToExposeAlloc where

import Parser

data Assignment = Assi String Int Int deriving Show
data IfExpose = IfExpose CndExpose Int CollectExpose deriving Show
data Allocate = Alloc String Int String  deriving Show
data AllocAssign = AllocAssign String Int String Int deriving Show
data Assignments = Assigns [Assignment] deriving Show
data AllocAssignments = AllocAssigns [AllocAssign] deriving Show

data CndExpose = GlobalValue String Int String deriving Show
data CollectExpose = Collect Int deriving Show


data Begin =
  Begin Assignments  IfExpose Allocate AllocAssignments String deriving Show

makeBegin :: Exp -> Begin
makeBegin exp =
  let assignments = makeAssignments exp in
    let assigns = getAssignments assignments in
      let len = length assigns in
        let ifexpose = makeifexp assignments in
          let allocassigns = makeallocation assignments in
            Begin assignments ifexpose (Alloc "var" len "tuple[int]") allocassigns "var"

getAssignments :: Assignments -> [Assignment]
getAssignments (Assigns e) = e
        
makeAssignments :: Exp -> Assignments
makeAssignments assi =
  let assigs = makeFstAssignments assi 0 in
    Assigns assigs
    
makeFstAssignments :: Exp -> Int -> [Assignment]
makeFstAssignments (TupleExp (Int n)) counter =
  let tmpname = "x" ++ show counter in
    (Assi tmpname counter n) : []

makeFstAssignments (TupleExp (Exps (Int n) (Int n2))) counter =
  makeFstAssignments (TupleExp (Int n)) counter ++ makeFstAssignments (TupleExp (Int n2)) (counter + 1)

makeFstAssignments (TupleExp (Exps e e2)) counter =
  makeFstAssignments (TupleExp e) counter ++ makeFstAssignments (TupleExp e2) (counter + 1)
                  
makeifexp :: Assignments -> IfExpose
makeifexp (Assigns assigs) =
  let bytes = (length assigs) * 8 in
    let global = GlobalValue "free_ptr" bytes "fromspace_end" in
      let collect = Collect bytes in
        IfExpose global 0 collect

makeallocation :: Assignments -> AllocAssignments
makeallocation assignments  =
  AllocAssigns assig
  where
    assig = makeallocationshelper assignments 0 
    
makeallocationshelper :: Assignments -> Int -> [AllocAssign]
makeallocationshelper (Assigns []) counter = []
makeallocationshelper (Assigns ((Assi var index n): xs)) counter =
  AllocAssign "tuple" counter var n : makeallocationshelper (Assigns xs) (counter+1)
