module Main where

import CBackend

main :: IO ()
main = do
  let c = compileExpC  "if 2 < 3; then print(2); else print(4);;"
  writeToFile "ifceg.c" c
