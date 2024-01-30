module IfExpExample where

import Utils

main :: IO ()
main = do
  let asm = runWhileIfexample "let x = 0;; while x < 4;: if x < 3; then print(x);; let x = x + 1;; else print(3);;"
    -- Replace "outputFile.txt" with the desired file path
  writeToFile "whileifeg.s" asm
