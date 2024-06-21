module Main where

import CBackend

main :: IO ()
main = do
  let c = compileExpC  "let x = 0;; while x < 4;: if x < 5; then print(x);; let x = x + 1;; else print(3);;"
  writeToFile "whileifc.c" c
