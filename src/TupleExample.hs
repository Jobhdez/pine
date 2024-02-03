module TupleExample where

import Compiler

main :: IO ()
main = do
  let asm = compileExp "(42)"
  writeToFile "tuple.s" asm
