a compiler in development  ...

## Example
The following is the most complex expression that I have tested. Note the the dummy arguments. Will fix that later.

```haskell
let toks = lexer "if if True then True else False; then let x = 2 + 5;;; print(x); else print(3);;"
ghci> let ast = pyhs toks
ghci> ast
IfExp (IfExp (Bool "True") (Bool "True") (Bool "False")) (Exps (Let "x" (Plus (Int 2) (Int 5))) (PrintExp (Var "x"))) (PrintExp (Int 3))
ghci> let mon = toMon ast 0
ghci> mon
MonLstSeq (MonLet "temp_0" (AtmBool "True")) (MonLet "temp_1" (MonIf (AtmVar "temp_0") (AtmBool "True") (AtmBool "False"))) (MonIf (AtmVar "temp_1") (SeqMon (MonLet "x" (MonPlus (AtmInt 2) (AtmInt 5))) (MonPrint (AtmVar "x"))) (MonPrint (AtmInt 3)))
ghci> let clike = toCLike mon 0
ghci> clike
CBlock [("NoBlock","start",MonLet "temp_0" (AtmBool "True"),"block_0","block_1"),("block_0","block_2",MonLet "temp_1" (AtmBool "True"),"temp_0","block_3"),("block_1","block_2",MonLet "temp_1" (AtmBool "False"),"temp_0","block_3"),("isBlock","block_2",SeqMon (MonLet "x" (MonPlus (AtmInt 2) (AtmInt 5))) (MonPrint (AtmVar "x")),"temp_0","block_3"),("isBlock","block_3",MonPrint (AtmInt 3),"temp_0","dummy")]
ghci> let ss = toSelect clike
ghci> ss
[("start",ImmStr "dummy","dummy"),("movq",ImmStr "True","temp_0"),("cmpq",ImmStr "True","temp_0"),("jmp",ImmStr "block_0","dummy"),("je",ImmStr "block_1","dummy"),("block_0",ImmStr "blk","blk"),("movq",ImmStr "True","temp_1"),("cmpq",ImmStr "True","temp_1"),("jmp",ImmStr "block_2","dummy"),("je",ImmStr "block_3","dummy"),("block_1",ImmStr "blk","blk"),("movq",ImmStr "False","temp_1"),("cmpq",ImmStr "False","temp_1"),("jmp",ImmStr "block_2","dummy"),("je",ImmStr "block_3","dummy"),("movq",ImmInt 2,"x"),("addq",ImmInt 5,"x"),("movq",ImmStr "x","%rdi"),("print",ImmStr "dummy","dummy"),("block_3",ImmStr "dummy","dummy"),("movq",ImmInt 3,"%rdi"),("print",ImmStr "dummy","dummy")]
ghci> toStackHelper ss 0 Map.empty
[("start",ImmStr "dummy","dummy"),("movq",ImmStr "True","-8(%rbp)"),("cmpq",ImmStr "True","-8(%rbp)"),("jmp",ImmStr "block_0","dummy"),("je",ImmStr "block_1","dummy"),("block_0",ImmStr "blk","blk"),("movq",ImmStr "True","-16(%rbp)"),("cmpq",ImmStr "True","-16(%rbp)"),("jmp",ImmStr "block_2","dummy"),("je",ImmStr "block_3","dummy"),("block_1",ImmStr "blk","blk"),("movq",ImmStr "True","-16(%rbp)"),("cmpq",ImmStr "False","-16(%rbp)"),("jmp",ImmStr "block_2","dummy"),("je",ImmStr "block_3","dummy"),("movq",ImmStr "2","-24(%rbp)"),("addq",ImmStr "5","-24(%rbp)"),("movq",ImmStr "-24(%rbp)","%rdi"),("print",ImmStr "dummy","dummy"),("block_3",ImmStr "dummy","dummy"),("movq",ImmStr "3","%rdi"),("print",ImmStr "dummy","dummy")]
```


