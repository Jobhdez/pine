a compiler with an x86-64 back-end and C backend!

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
Before running the examples, you need to build it:

```
* cabal build
```
and when you have the generated assembly, use gcc:

```
* cd pyhs
* gcc -c -g -std=c99 src/runtime/runtime.c
* gcc -g runtime.o <assembly file>
```
So far it can compile the following expressions:

```
let x = 0;; while x < 4;: if x < 5; then print(x);; let x = x + 1;; else print(3);;
```
You can generate the assembly file for the above program by:

```
* cd pyhs
* cabal run whileifeg
```
You can also compile an expression such as

```
if True then print(2); else print(3);;
```
To run this example:

```
* cabal run ifexpeg
```
And I have also tested this program 
```
let x = 0;; while x < 5;: print(x);; let x = x + 1;;
```
To generate the assembly for this program:

```
* cabal run whileeg
```
## Tuples

So far I can only compile the expression:

```
let x = (4;5;6);; print(x[1]);
```

If you want to generate the file yourself:

```
* cabal run tup
```

## Thanks
This compiler was based on Dr. Siek's compilation book https://github.com/IUCompilerCourse/Essentials-of-Compilation. The runtime (runtime.c) was written by Dr. Siek but the compiler is my work.
