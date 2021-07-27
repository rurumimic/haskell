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
[] < [1]
[1] < [1,2]

[1,2] < [1,3]
[1,3,5] < [3]

[1,3,5] == [1.0,3.0,5.0]
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
