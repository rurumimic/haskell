# Module

- module: a collection of related functions, types and typeclasses
- program: a collection of modules

code: [module](../examples/basic/module.hs)

## Import

### Script

```hs
import ModuleName1
import ModuleName2 (functionName1, functionName2) -- import only
import ModuleName3 hiding (functionName3) -- except
```

```hs
import qualified Data.Map
filter

import qualified Data.Map as M
M.filter
```

### GHCi

```hs
:m + ModuleName1 ModuleName2 ModuleName3
```

---

## Data.List

```hs
:m + Data.List
```

```hs
words "hey these are the words in this sentence" -- ["hey","these","are","the","words","in","this","sentence"]
group [1,1,1,1,2,2,2,2,3,3,3,2,2,2,5,6,7] -- [[1,1,1,1],[2,2,2,2],[3,3,3],[2,2,2],[5],[6],[7]]
sort [5,4,3,7,2,1] -- [1,2,3,4,5,7]
```

```hs
wordNums "wa wa wee wa" -- [("wa",3),("wee",1)]
```

```hs
tails "party" -- ["party","arty","rty","ty","y",""]
tails [1,2,3] -- [[1,2,3],[2,3],[3],[]]

"hawaii" `isPrefixOf` "hawaii joe" -- True
"haha" `isPrefixOf` "ha" -- False
"ha" `isPrefixOf` "ha" -- True

any (>4) [1,2,3] -- False
any (=='F') "Frank Sobotka" -- True
any (\x -> x > 5 && x < 10) [1,4,11] -- False
```

```hs
-- custom
"art" `isIn` "party" -- True
[1,2] `isIn` [1,3,5] -- False

-- import Data.List
"art" `isInfixOf` "party" -- True
[1,2] `isInfixOf` [1,3,5] -- False
```

```hs
foldl (+) 0 (replicate 100000000 1) -- *** Exception: stack overflow
foldl' (+) 0 (replicate 100000000 1) -- 100000000
```

### Find, Maybe, Just

```hs
Nothing -- Nothing
Just "apple" -- Just "apple"
Just 15 -- Just 15
:t Just "apple" -- Just "apple" :: Maybe [Char]
:t Just True -- Just True :: Maybe Bool
```

```hs
:t find -- find :: Foldable t => (a -> Bool) -> t a -> Maybe a
```

```hs
find (> 4) [1,2,3,4,5,6,7] -- Just 5
find odd [2,4,6,8,9] -- Just 9
find (== 'z') "abcde" -- Nothing
```

```hs
firstTo40 -- Just 49999
firstTo 27 -- Just 999
firstTo 1 -- Just 1
firstTo 0 -- stack overflow
firstTo 13 -- Just 49
```

## Data.Char

```hs
:m + Data.Char
```

```hs
ord 'a' -- 97
chr 98 -- 'b'
map ord "abcdefgh" -- [97,98,99,100,101,102,103,104]
```

```hs
encode 3 "hey mark" -- "kh|#pdun"
encode 1 "to party hard" -- "up!qbsuz!ibse"

decode 3 "kh|#pdun" -- "hey mark"
decode 1 "up!qbsuz!ibse" -- "to party hard"
```

```hs
digitToInt '2' -- 2
digitToInt 'F' -- 15
digitToInt 'z' -- *** Exception: Char.digitToInt: not a digit 'z'
```

---

## Association list

```hs

```
