module Main where

import Compiler

main :: IO ()
main = do
  let asm = compileExp "let x = 0;; while x < 4;: if x < 5; then print(x);; let x = x + 1;; else print(3);;"
  writeToFile "whileifeg.s" asm
