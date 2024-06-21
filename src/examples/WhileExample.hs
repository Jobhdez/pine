module Main where

import Compiler

main :: IO ()
main = do
  let asm = compileExp  "let x = 0;; while x < 5;: print(x);; let x = x + 1;;"
  writeToFile "whileeg.s" asm

