module WhileExample where

import Utils

main :: IO ()
main = do
  let asm = runWhileIfexample  "let x = 0;; while x < 5;: print(x);; let x = x + 1;;"
  writeToFile "whileeg.s" asm

