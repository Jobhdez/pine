module Compiler where
import Parser
import ToExposeAlloc
import ToMon
import ToSelect
import ToStack
import ToX86
import ToC
import qualified Data.Map as Map
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.IO

-- x86 compiler
---------------
compileExp :: String -> String
compileExp exp =
  let tokens = lexer exp in
    let ast = pyhs tokens in
      compile ast

compile :: Exp -> String
compile (IfExp cnd thn els) =
  let mon = toMon (IfExp cnd thn els) 0 in
    let clike = toCLike mon 0 in
      let ss = toSelect clike in
        let stk = toStackHelper ss 0 Map.empty in
          let asm = toX86 stk in
            asm
            
compile (Exps (Let var (TupleExp exps)) (PrintExp (TupleIndex (Var var2) index))) =
  let mon = toMonBgn  (Exps (Let var (TupleExp exps)) (PrintExp (TupleIndex (Var var2) index))) in
    let ss = toSelect mon in
      let ss' = ("main", ImmStr "dummy", ImmStr "dummy") : ss in
        toX86t' ss'
          
compile exp =
  let mon = toMon exp 0 in
    let ss = toSelect mon in
      let ss' = ("start", ImmStr "dummy", ImmStr "dummy") : ss in
        let stk = toStackHelper ss' 0 Map.empty in
          toX86' stk


-- utils --
  
writeToFile :: FilePath -> String -> IO ()
writeToFile filePath content = do
    withFile filePath WriteMode $ \handle -> do
        TIO.hPutStr handle (T.pack content)
