a compiler in development  ...

## Example
The following is the most complex expression that I have tested. Note the the dummy arguments. Will fix that later.

```haskell
> let toks = lexer "let x = 0;; while x < 4;: if x < 3; then print(x);; let x = x + 1;; else print(3);;"
> let ast = pyhs toks
> let mon = toMon ast 0
> toSelect mon

[ ("movq", ImmInt 0, ImmStr "x")
, ("loop", ImmStr "dummy", ImmStr "dummy")
, ("cmpq", ImmInt 3, ImmStr "x")
, ("jmp", ImmStr "block_0", ImmStr "dummy")
, ("je", ImmStr "block_1", ImmStr "dummy")
, ("block_0", ImmStr "blkdummy", ImmStr "dummy")
, ("movq", ImmStr "x", ImmReg "%rdi")
, ("print", ImmStr "dummy", ImmStr "dummy")
, ("movq", ImmInt 1, ImmStr "x")
, ("addq", ImmStr "x", ImmStr "x")
, ("block_1", ImmStr "dummy", ImmStr "dummy")
, ("movq", ImmInt 3, ImmReg "%rdi")
, ("print", ImmStr "dummy", ImmStr "dummy")
, ("test", ImmStr "tst", ImmStr "tstdummy")
, ("cmpq", ImmInt 4, ImmStr "x")
, ("jg", ImmStr "loop", ImmStr "dummy")
]

```

## Example: tuple

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