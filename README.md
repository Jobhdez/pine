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

So far it can compile the following expressions:

```
let x = 0;; while x < 4;: if x < 5; then print(x);; let x = x + 1;; else print(3);;
```
You can generate the assembly file for the above program by:

```
* cd pyhs/src
* gcc -c -g -std=c99 runtime.c
* ghci WhileIfExample.hs
ghci> main
ghci> :q
* gcc -g runtime.o whileifeg.s
* ./a.out
```
You can also compile an expression such as

```
if True then print(2); else print(3);;
```

To generate the assembly for `if True then print(2); else print(3);;` do the following:

```
* cd pyhs/src
* gcc -c -g -std=c99 runtime.c
* ghci IExpExample.hs
ghci> main
ghci> :q
* gcc -g runtime.o ifasm.s
* ./a.out
```
And I have also tested this program 
```
let x = 0;; while x < 5;: print(x);; let x = x + 1;;
```
To generate the assembly for this program:
```
* cd pyhs/src
* gcc -c -g -std=c99 runtime.c
* ghci WhileExample.hs
ghci> main
ghci> :q
* gcc -g runtime.o whileeg.s
* ./a.out
```
## a tuple
So far only an AST is generated for tuples.
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
