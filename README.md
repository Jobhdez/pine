pyhs: so far just a parser, but I am aiming to build a small compiler:-)

# Examples

```
ghci> let toks = lexer "if True then 1 else 3;; let x = 4;; print(x);"
ghci> toks
[TokenIf,TokenTrue "True",TokenThen,TokenInt 1,TokenElse,TokenInt 3,TokenSemicolon,TokenSemicolon,TokenLet,TokenVar "x",TokenEq,TokenInt 4,TokenSemicolon,TokenSemicolon,TokenPrint,TokenOP,TokenVar "x",TokenCP,TokenSemicolon]
ghci> pyhs toks
Exps (IfExp (Bool "True") (Int 1) (Int 3)) (Exps (Let "x" (Int 4)) (PrintExp (Var "x")))
```