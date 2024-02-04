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
defun      { TokenDefun }
'='        { TokenEq }
'+'        { TokenPlus }
'-'        { TokenMinus }
'{'        { TokenCurlyL }
'}'        { TokenCurlyR }
'('        { TokenOP }
')'        { TokenCP }
']'        { TokenSqBR }
'['        { TokenSqBL }
'<'        { TokenLess }
'>'        { TokenGreater }
':'        { TokenColon }
';'        { TokenSemicolon }
%%

Exp : var  { Var $1 }
| let var '=' Exp ';' { Let $2 $4 }
| Exp '+' Exp ';' { Plus $1 $3 }
| Exp '-' Exp ';' { Minus $1 $3 }
| Exp '<' Exp ';'   { LessThn $1 $3 }
| Exp '>' Exp ';' { GreaterThn $1 $3 }
| if Exp then Exp else Exp ';' { IfExp $2 $4 $6 }
| true { Bool $1 }
| false { Bool $1 }
| print '(' Exp ')' ';' { PrintExp $3 }
| Exp ';' Exp  { Exps $1 $3 }
| while Exp ':' Exp  { While $2 $4 }
| defun Exp '(' Exp ')' '{' Exp '}'   { DefunExp $2 $4 $7 } 
| '(' Exp ')'   { TupleExp $2 }
| Exp '[' int ']'   { TupleIndex $1 $3 }
| int  { Int $1 }
| '-' int { Negative $2 }
{

parseError :: [Token] -> a
parseError _ = error "Parse Error"

data Exp
  = Var String
  | Int Int
  | Negative Int
  | Let String Exp
  | Bool String
  | Plus Exp Exp
  | Minus Exp Exp
  | IfExp Exp Exp Exp
  | GreaterThn Exp Exp
  | LessThn Exp Exp
  | While Exp Exp
  | DefunExp Exp Exp Exp
  | TupleExp Exp
  | TupleIndex Exp Int
  | PrintExp Exp
  | Exps Exp Exp
  deriving Show

data Token
  = TokenIf
  | TokenLet
  | TokenThen
  | TokenElse
  | TokenWhile
  | TokenDefun
  | TokenCurlyL
  | TokenCurlyR
  | TokenPrint
  | TokenSqBL
  | TokenSqBR
  | TokenInt Int
  | TokenVar String
  | TokenTrue String
  | TokenFalse String
  | TokenEq
  | TokenLess
  | TokenGreater
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
lexer ('[':cs) = TokenSqBL : lexer cs
lexer (']':cs) = TokenSqBR : lexer cs
lexer ('<':cs) = TokenLess : lexer cs
lexer ('>':cs) = TokenGreater : lexer cs
lexer ('{':cs) = TokenCurlyL : lexer cs
lexer ('}':cs) = TokenCurlyR : lexer cs

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
  ("defun", rest) -> TokenDefun : lexer rest
  (var, rest) -> TokenVar var : lexer rest

main = getContents >>= print . pyhs . lexer
  }

