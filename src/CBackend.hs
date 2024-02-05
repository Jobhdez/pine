module CBackend where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.IO
import Parser
import ToMon
import ToC

-- C backend
------------
compileExpC :: String -> String
compileExpC exp =
  let tokens = lexer exp in
    let ast = pyhs tokens in
        let mon = toMon ast 0 in
          "#include <stdio.h>\n\nint main() {\n    " ++  toC mon ++ "\n}"
-- utils --
  
writeToFile :: FilePath -> String -> IO ()
writeToFile filePath content = do
    withFile filePath WriteMode $ \handle -> do
        TIO.hPutStr handle (T.pack content)
