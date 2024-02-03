module TupleExample where

import Compiler

main :: IO ()
main = do
  let asm = compileExp "let x = (4;5;6);; print(x[1]);"
  writeToFile "tuple.s" asm
