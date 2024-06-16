# List

**homogenous** data structure: stores several elements of the same type

```hs
let list = [1,2,3]
[1,2,3] ++ [4,5,6] -- [1,2,3,4,5,6]
['H','e','l','l','o'] -- "Hello"
```

## Append

```hs
'H':"ello" -- "Hello"
1:[2,3,4,5] -- [1,2,3,4,5]
```

```hs
'H':'e':'l':'l':'o':[] -- "Hello"
1:2:3:[] -- [1,2,3]
```

```hs
"Hell" ++ "o" -- "Hello"
[1,2,3,4] ++ [5] -- [1,2,3,4,5]
```

## Index

```hs
"Keanu Reeves" !! 0 -- 'K'
"Keanu Reeves" !! 6 -- 'R'
```

```hs
"Keanu Reeves" !! (-1) -- *** Exception: Prelude.!!: negative index
"Keanu Reeves" !! 12   -- *** Exception: Prelude.!!: index too large
```

## List in list

```hs
let b = [[], [1,2,3,4], [5,6,7]]
b ++ [[0,2,4,6]] -- [[],[1,2,3,4],[5,6,7],[0,2,4,6]]
[1,2,3]:b -- [[1,2,3],[],[1,2,3,4],[5,6,7]]
b !! 2 -- [5,6,7]
```

## Compare

```hs
[] < [1] -- True
[1] < [1,2] -- True

[1,2] < [1,3] -- True
[1,3,5] < [3] -- True

[1,3,5] == [1.0,3.0,5.0] -- True
```

## Operator

```hs
head [3,5,7,9] -- 3
tail [3,5,7,9] -- [5,7,9]
```

```hs
init [3,5,7,9] -- [3,5,7]
last [3,5,7,9] -- 9
```

```hs
length [3,5,7,9] -- 4
null [3,5,7,9] -- False
null [] -- True
```

```hs
reverse [3,5,7,9] -- [9,7,5,3]

take (-1) [3,5,7,9] -- []
take 0 [3,5,7,9] -- []
take 3 [3,5,7,9] -- [3,5,7]
take 5 [3,5,7,9] -- [3,5,7,9]

take (-1) [] -- []
take 0 [] -- []
take 1 [] -- []

drop 3 [3,5,7,9] -- [9]
drop 5 [3,5,7,9] -- []

maximum [3,5,7,9] -- 9
minimum [3,5,7,9] -- 3

sum [3,5,7,9] -- 24
product [3,5,7,9] -- 945
product [3,5,7,9,0] -- 0

elem 4 [3,5,7,9] -- False
elem 5 [3,5,7,9] -- True
4 `elem` [3,5,7,9] -- False
5 `elem` [3,5,7,9] -- True
```

## Ranges

```hs
[1..10] -- [1,2,3,4,5,6,7,8,9,10]
['a'..'z'] -- "abcdefghijklmnopqrstuvwxyz"
['A'..'A'] -- "A"
['k'..'H'] -- ""

[1,3..10] -- [1,3,5,7,9]
['c','h'..'z'] -- "chmrw"

[10..1] -- []
[10,9..1] -- [10,9,8,7,6,5,4,3,2,1]
[1,(-1)..(-10)] -- [1,-1,-3,-5,-7,-9]
```

```hs
take 10 [10,20..] -- [10,20,30,40,50,60,70,80,90,100]
take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1]
take 12 (cycle "Hello ") -- "Hello Hello "

take 10 (repeat 5) -- [5,5,5,5,5,5,5,5,5,5]

replicate 3 10 -- [10,10,10]
```

```hs
[1,1.3..2] -- [1.0,1.3,1.6,1.9000000000000001]
[1,1.2..2.1] -- [1.0,1.2,1.4,1.5999999999999999,1.7999999999999998,1.9999999999999998,2.1999999999999997]
```

## List comprehension

**set comprehensions**:

```math
\left \{ 2 \cdot x \mid x \in N, x \leq 10 \right \}
```

**haskell**:

```hs
[x*2 | x <- [1..10]] -- [2,4,6,8,10,12,14,16,18,20]
```

add a condition(predicate):

```hs
[x*2 | x <- [1..10], x*2 >= 12] -- [12,14,16,18,20]
```

filtering:

```hs
[x | x <- [50..100], x `mod` 7 == 3] -- [52,59,66,73,80,87,94]
```

```hs
boomBangs xs = [if x < 10 then "BOOM!" else "bang." | x <- xs, odd x]

boomBangs [7..13] -- ["BOOM!","BOOM!","bang.","bang."]
```

```hs
[x | x <- [10..20], x /= 13, x /= 15, x /= 19] -- [10,11,12,14,16,17,18,20]
```

```hs
[x+y | x <- [1,2,3], y <- [10, 100, 1000]] -- [11,101,1001,12,102,1002,13,103,1003]
length [x+y | x <- [1,2,3], y <- [10, 100, 1000]] -- 9 = 3 * 3
```

1. Replaces every element of a list with 1.
2. Sum:

```hs
length' xs = sum [1 | _ <- xs]

length' [] -- 0
length' [1,2,3] -- 3
```

```hs
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
removeNonUppercase "Hahaha! Ahahaha!" -- HA
removeNonUppercase "IdontLIKEFROGS" -- "ILIKEFROGS"
```

Remove odd numbers **without flattening** the list:

```hs
let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
[[ x | x <- xs, even x ] | xs <- xxs] -- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
```

## Tuples

```hs
(1, 3)
(3.14, 'a', "hello", [1,2,3])
```

```hs
[(1,2),(8,11),(4,5)] -- ok
[(1,2), (8,11,5), (4,5)] -- error
[(1,2),("One",2)] -- error
```

```hs
(1) < (2) -- True
(1,3) < (3,1) -- True
```

### operator

Pair:

```hs
fst (8,11) -- 8
fst ("Wow", False) -- "Wow"

snd (8,11) -- 11
snd ("Wow", False) -- False
```

```hs
zip [1,2,3,4] [6,7,8,9] -- [(1,6),(2,7),(3,8),(4,9)]
zip [1,2,3,4] [6,7,8] -- [(1,6),(2,7),(3,8)]
zip [] [6,7] -- []
zip [] [] -- []
zip [1..4] "abcd" -- [(1,'a'),(2,'b'),(3,'c'),(4,'d')]
zip [1..] "abcd" -- [(1,'a'),(2,'b'),(3,'c'),(4,'d')]
```

## Example

```hs
let triples = [(a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10]] -- [(1,1,1), (1,2,1), ..., (10, 10, 10)]
let rightTriangles = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2 ] -- [(4,3,5),(8,6,10)]
```

```hs
let rightTriangles' = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24] -- [(8,6,10)]
```
