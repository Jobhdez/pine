module IfExpExample where

import Utils

main :: IO ()
main = do
  let asm = runifexample "if True then print(2); else print(3);;"
    -- Replace "outputFile.txt" with the desired file path
  writeToFile "ifasm.s" asm
