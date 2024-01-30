a compiler in development  ...

## Running the program
you will need to install the `happy` parser generator:

```
* cabal install happy
```

After you install `happy` you need to clone the repo:

```
* git clone git@github.com:Jobhdez/pyhs.git

```
and then navigate to the `src/` directory and load the files. You can load the `ToSelect` module to run the examples
below.

```
* cd pyhs/src
* ghci ToSelect.hs
```
## Examples

So far you can compile an expression such as "if True then print(2); else print(3);;"

To generate the assembly for "if True then print(1); else print(3);;" do the following:

```
* cd pyhs/src
* gcc -c -g -std=c99 runtime.c
* ghci ToX86.hs
ghci> ToX86.main
ghci> :q
* gcc -g runtime.o ifasm.s
* ./a.out
```

### If expressions
```haskell
ghci> let toks = lexer "if True then print(1); else print(3);;"
ghci> let ast = pyhs toks
ghci> let mon = toMon ast 0
ghci> mon
MonIf (AtmBool "True") (MonPrint (AtmInt 1)) (MonPrint (AtmInt 3))
ghci> let clike = toCLike mon 0
ghci> clike
CBlock [("dummy","start",MonLet "temp_0" (AtmBool "True"),"block_0","block_1"),
        ("dummy","block_0",MonPrint (AtmInt 1),"temp_1","block_1"),
	("dummy","block_1",MonPrint (AtmInt 3),"temp_1","dummy")]

ghci> toSelect clike

[("start",ImmStr "dummy",ImmStr "dummy")
,("movq",ImmStr "True",ImmStr "temp_0")
,("cmpq",ImmStr "True",ImmStr "temp_0")
,("jmp",ImmStr "block_0",ImmStr "dummy")
,("je",ImmStr "block_1",ImmStr "dummy")
,("block_0",ImmStr "dummy",ImmStr "dummy")
,("movq",ImmInt 1,ImmReg "%rdi")
,("print",ImmStr "dummy",ImmStr "dummy")
,("block_1",ImmStr "dummy",ImmStr "dummy")
,("movq",ImmInt 3,ImmReg "%rdi")
,("print",ImmStr "dummy",ImmStr "dummy")]
```

## if exp nested in a while loop
```haskell
>  let toks = lexer "let x = 0;; while x < 4;: if x < 3; then print(x);; let x = x + 1;; else print(3);;"
> let ast = pyhs toks
> let mon = toMon ast 0
> toSelect mon

[("movq",ImmInt 0,ImmStr "x")
,("whiletest",ImmStr "whiletestlabel",ImmStr ":")
,("cmpq",ImmInt 4,ImmStr "x")
,("jge",ImmStr "exit",ImmStr "dummy")
,("jmp",ImmStr "iftest",ImmStr "dummy")
,("iftest",ImmStr "iftestlabel",ImmStr "dummy")
,("cmpq",ImmInt 3,ImmStr "x")
,("jmp",ImmStr "block_0",ImmStr "dummy")
,("je",ImmStr "block_1",ImmStr "dummy")
,("block_0",ImmStr "blkdummy",ImmStr "dummy")
,("movq",ImmStr "x",ImmReg "%rdi")
,("print",ImmStr "dummy",ImmStr "dummy")
,("movq",ImmInt 1,ImmStr "x")
,("addq",ImmStr "x",ImmStr "x")
,("jmp",ImmStr "whiletest",ImmStr "thanks")
,("block_1",ImmStr "dummy",ImmStr "dummy")
,("movq",ImmInt 3,ImmReg "%rdi")
,("print",ImmStr "dummy",ImmStr "dummy")
,("jmp",ImmStr "whiletest",ImmStr "thanks")
,("exit",ImmStr "retq",ImmStr "dummy")]


```

## a tuple

the tuple `(4 ; 5 ; 6)` lowers to the following x86 after the instruction selection phase:

```haskell
[ ("movq", ImmInt 4, ImmStr "x0")
, ("movq", ImmInt 5, ImmStr "x1")
, ("movq", ImmInt 6, ImmStr "x2")
, ("movq", ImmStr "free_ptr_0", ImmReg "%rax")
, ("addq", ImmInt 24, ImmReg "%rax")
, ("movq", ImmStr "fromspace_end(%rip)", ImmStr "fromSpace0")
, ("cmpq", ImmStr "fromspace0", ImmReg "%rax")
, ("jl", ImmStr "block_77", ImmStr "dummy")
, ("jmp", ImmStr "block_78", ImmStr "dummy")
, ("movq", ImmReg "%r11", ImmReg "%rdi")
, ("movq", ImmInt 24, ImmReg "%rsi")
, ("callq", ImmStr "collect", ImmStr "dummy")
, ("movq", ImmStr "free_ptr(%rip)", ImmReg "%r11")
, ("addq", ImmInt 32, ImmStr "free_ptr(%rip)")
, ("movq", ImmInt 7, TupleMem "0(%r11)")
, ("movq", ImmReg "%r11", ImmStr "var")
, ("movq", ImmStr "tuple", ImmReg "%r11")
, ("movq", ImmStr "x0", TupleMem "8(%r11)")
, ("movq", ImmStr "tuple", ImmReg "%r11")
, ("movq", ImmStr "x1", TupleMem "16(%r11)")
, ("movq", ImmStr "tuple", ImmReg "%r11")
, ("movq", ImmStr "x2", TupleMem "24(%r11)")
]
```
