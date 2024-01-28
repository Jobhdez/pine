a compiler in development  ...

So far this lowers:
- if expressions
- while loops
- assignments
- addition
- tuples
  
## Example
The following is the most complex expression that I have tested. Note the the dummy arguments. Will fix that later.

```haskell
> let toks = lexer "let x = 0;; while x < 4;: if x < 3; then print(x);; let x = x + 1;; else print(3);;"
> let ast = pyhs toks
> let mon = toMon ast 0
> let ss = toSelect mon
> toStackHelper ss 0 Map.empty
```

