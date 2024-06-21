module Main where

import Compiler
import System.IO

compileFile :: FilePath -> IO ()
compileFile filepath =
  do
    exp <- readFile filepath
    let compiledExpression = compileExp exp
    writeFile "tuple.s" compiledExpression
    
main :: IO ()
main = do
  compileFile "tuple.pyhs"
