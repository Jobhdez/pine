module ToX86 where

import Parser
import ToMon
import ToSelect
import ToStack
import qualified Data.Map as Map
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.IO


toX86 :: [(String, Imm, Imm)] -> String
toX86 [] = ""
toX86 (x:xs) =
  toX86Helper x ++ toX86 xs
toX86Helper :: (String, Imm, Imm) -> String
toX86Helper ("start", ImmStr dummy, ImmStr dummy2) =
  ".globl main\n" ++ "main:\n" ++ "\tpushq %rbp\n" ++ "\tmovq %rsp, %rbp\n" ++ "\tsubq $8, %rsp\n" 

toX86Helper ("movq", ImmStr "True", ImmStack stack) =
  "\tmovq $1, " ++ stack ++ "\n" 

toX86Helper ("cmpq", ImmStr "True", ImmStack stack) =
  "\tcmpq $1, " ++ stack ++ "\n" 

toX86Helper ("jmp", ImmStr block, ImmStr dummy) =
  "\tjmp " ++ block ++ "\n" 

toX86Helper ("je", ImmStr block, ImmStr dummy) =
  "\tje " ++ block ++ "\n" 

toX86Helper ("movq", ImmStr n, ImmReg reg) =
  "\tmovq " ++ "$" ++ n ++ "," ++ reg ++ "\n"

toX86Helper ("print", ImmStr dm, ImmStr dm2) =
  "\tcallq " ++ "print_int\n" ++ "\taddq $8, %rsp\n" ++ "\tpopq %rbp\n" ++ "\tretq\n" 

toX86Helper (b1, ImmStr dm, ImmStr dm2)=
  b1 ++ ":\n"
  
writeToFile :: FilePath -> String -> IO ()
writeToFile filePath content = do
    -- Open the file in write mode and handle it
    withFile filePath WriteMode $ \handle -> do
        -- Convert the string to Text and write it to the file handle
        TIO.hPutStr handle (T.pack content)

main :: IO ()
main = do
    let toks = lexer "if True then print(2); else print(3);;"
    let ast = pyhs toks
    let mon = toMon ast 0
    let clike = toCLike mon 0
    let ss = toSelect clike
    let stk = toStackHelper ss 0 Map.empty
    let asm = toX86 stk
    -- Replace "outputFile.txt" with the desired file path
    writeToFile "ifasm.s" asm
