toSSelectBeginAssignments :: Assignments -> [(String, Imm, String)]
toSSelectBeginAssignments (Assigns e) =
  toAssignmentsHelper e
  
toAssignmentsHelper :: [Assignments] -> [(String, Imm, String)]
toAssignmentsHelper [] = []
toAssignmentsHelper ((Assi var e):xs) =
  ["movq", ImmInt e, var] : toAssignmentsHelper xs
  
