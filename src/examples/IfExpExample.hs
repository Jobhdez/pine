module Main where

import Compiler

main :: IO ()
main = do
  let asm = compileExp "if True then print(2); else print(3);;"
    -- Replace "outputFile.txt" with the desired file path
  writeToFile "ifasm.s" asm
