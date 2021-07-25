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
