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
* ghci IfExpExample.hs
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
## Tuples
So far I can only compile the expression:
```
let x = (4;5;6);; print(x[1]);
```
To file `tuple.s` is the generated code from this expression. 

But if you want to generate the file yourself:
```
* cd pyhs/src
* gcc -c -g -std=c99 runtime.c
* ghci TupleExample.hs
ghci> main
ghci> :q
* gcc -g runtime.o tuple.s
* ./a.out
```

## Thanks
This compiler was based on Dr. Siek's compilation book https://github.com/IUCompilerCourse/Essentials-of-Compilation. The runtime (runtime.c) was written by Dr. Siek but the compiler is my work.
