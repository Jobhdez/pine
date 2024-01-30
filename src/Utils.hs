module Utils where
import Parser
import ToMon
import ToSelect
import ToStack
import ToX86
import qualified Data.Map as Map
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.IO

{-- example:
suppose you have a tuple: (1,1,3).

the 64 bit tag for this tuple would be 000 000011 1. You dont actually need
the whole 64 bits. In assembly I will be using instructions that manipulate
64 bits.

the first three 0 bits are 0s because when processing a tuple you assign
a 0 bit to a integer and 1 to a tuple.

000011 on the other hand is the length of the tuple. in this case 3.

the last bit represents whether its reachable from the root set.

example using this code:

> makeTag [Left 1, Left 1, Left 3]
--> 7
the tag 7 will be placed in front of the tuple. this is done because the
garbage collector needs to distinguish tuples from other data :-)
--}
writeToFile :: FilePath -> String -> IO ()
writeToFile filePath content = do
    -- Open the file in write mode and handle it
    withFile filePath WriteMode $ \handle -> do
        -- Convert the string to Text and write it to the file handle
        TIO.hPutStr handle (T.pack content)

runifexample :: String -> String
runifexample input =
  let tokens = lexer input in
    let ast = pyhs tokens in
      let mon = toMon ast 0 in
        let clike = toCLike mon 0 in
          let ss = toSelect clike in
            let stk = toStackHelper ss 0 Map.empty in
              let asm = toX86 stk in
                asm

runWhileIfexample :: String -> String
runWhileIfexample input =
  let tokens = lexer input in
    let ast = pyhs tokens in
      let mon = toMon ast 0 in
        let ss = toSelect mon in
          let ss' = ("start", ImmStr "dummy", ImmStr "dummy") : ss in
            let stk = toStackHelper ss' 0 Map.empty in
              toX86' stk

runWhileExample :: String -> String
runWhileExample input =
  let tokens = lexer input in
    let ast = pyhs tokens in
      let mon = toMon ast 0 in
        let ss = toSelect mon in
          let ss' = ("start", ImmStr "dummy", ImmStr "dummy") : ss in
            let stk = toStackHelper ss' 0 Map.empty in
              toX86' stk
                    
                    
