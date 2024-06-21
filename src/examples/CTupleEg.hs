module Main where

import CBackend

main :: IO ()
main = do
  let c = compileExpC  "let x = (4;5;6;4);; print(x[2]);"
  writeToFile "tupc.c" c
