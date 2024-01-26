{
module Parser where
import Data.Char (isSpace, isAlpha, isDigit)

}


%name pyhs
%tokentype { Token }
%error { parseError }

%token
if         { TokenIf }
let        { TokenLet }
then       { TokenThen }
else       { TokenElse }
while      { TokenWhile }
var        { TokenVar $$ }
int        { TokenInt $$ }
print      { TokenPrint }
true       { TokenTrue $$}
false      { TokenFalse $$}
'='        { TokenEq }
'+'        { TokenPlus }
'-'        { TokenMinus }
'('        { TokenOP }
')'        { TokenCP }
':'        { TokenColon }
';'        { TokenSemicolon }
%%

Exp : let var '=' Exp ';' { Let $2 $4 }
| Exp '+' Exp ';' { Plus $1 $3 }
| Exp '-' Exp ';' { Minus $1 $3 }
| if Exp then Exp else Exp ';' { IfExp $2 $4 $6 }
| true { Bool $1 }
| false { Bool $1 }
| print '(' Exp ')' ';' { PrintExp $3 }
| while Exp ':' Exp ';' { While $2 $4 }
| Exp ';' Exp  { Exps $1 $3 }
| int  { Int $1 }
| var  { Var $1 }

{

parseError :: [Token] -> a
parseError _ = error "Parse Error"

data Exp
  = Var String
  | Int Int
  | Let String Exp
  | Bool String
  | Plus Exp Exp
  | Minus Exp Exp
  | IfExp Exp Exp Exp
  | While Exp Exp
  | PrintExp Exp
  | Exps Exp Exp
  deriving Show

data Token
  = TokenIf
  | TokenLet
  | TokenThen
  | TokenElse
  | TokenWhile
  | TokenPrint
  | TokenInt Int
  | TokenVar String
  | TokenTrue String
  | TokenFalse String
  | TokenEq
  | TokenPlus
  | TokenMinus
  | TokenOP
  | TokenCP
  | TokenColon
  | TokenSemicolon
  deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
  | isSpace c = lexer cs
  | isAlpha c = lexExp (c:cs)
  | isDigit c = lexNum (c:cs)
lexer ('=':cs) = TokenEq : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('(':cs) = TokenOP : lexer cs
lexer (')':cs) = TokenCP : lexer cs
lexer (';':cs) = TokenSemicolon : lexer cs

lexNum cs = TokenInt (read num) : lexer rest
  where (num, rest) = span isDigit cs

lexExp cs =
  case span isAlpha cs of
  ("if", rest) -> TokenIf : lexer rest
  ("then", rest) -> TokenThen : lexer rest
  ("else", rest) -> TokenElse : lexer rest
  ("let", rest) -> TokenLet : lexer rest
  ("while", rest) -> TokenWhile : lexer rest
  ("print", rest) -> TokenPrint : lexer rest
  ("True", rest) -> TokenTrue "True" : lexer rest
  ("False", rest) -> TokenFalse "False" : lexer rest
  (var, rest) -> TokenVar var : lexer rest

main = getContents >>= print . pyhs . lexer
  }

