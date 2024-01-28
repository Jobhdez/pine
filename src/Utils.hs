module Utils where

{-- example:
suppose you have a tuple: (1,1,3).

the 64 bit tag for this tuple would be 000 000011 1. You dont actually need
the whole 64 bits. In assembly I will be using instructions that manipulate
64 bits.

the first three 0 bits are 0s because when processing a tuple you assign
a 0 bit to a integer and 1 to a tuple.

000011 on the other hand is the length of the tuple. in this case 3.

the last bit represents whether its reachable from the root set.

example using this code:

> makeTag [Left 1, Left 1, Left 3]
--> 7
the tag 7 will be placed in front of the tuple. this is done because the
garbage collector needs to distinguish tuples from other data :-)
--}
data Tuple = Tuple deriving Show

makeTag :: [Either Int Tuple] -> Int
makeTag tuple =
  let makePointerMask :: [Either Int Tuple] -> String -> String
      makePointerMask [] str = reverse str
      makePointerMask (x:xs) str =
        case x of
          Left _  -> makePointerMask xs ('0':str)
          Right _ -> makePointerMask xs ('1':str)
      
      tupleLengthToBits :: Int -> String
      tupleLengthToBits len = let binaryStr = reverse (go len)
                                  go 0 = "0"
                                  go n = if n `mod` 2 == 1 then '1' : go (n `div` 2) else '0' : go (n `div` 2)
                              in replicate (6 - length binaryStr) '0' ++ binaryStr

      tagBitsToDecimal :: String -> Int
      tagBitsToDecimal bits = go (reverse bits) 0
        where
          go [] _ = 0
          go (x:xs) n = (if x == '1' then 2 ^ n else 0) + go xs (n+1)

  in let len = tupleLengthToBits (length tuple)
         pointerMask = makePointerMask tuple ""
         fwdPtr = "1"
     in tagBitsToDecimal (pointerMask ++ len ++ fwdPtr)
