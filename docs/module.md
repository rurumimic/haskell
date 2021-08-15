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
phoneBook = [
  ("betty","555-2938"),
  ("betty","342-2492"),
  ("bonnie","452-2928"),
  ("patsy","493-2928"),
  ("patsy","943-2929"),
  ("patsy","827-9162"),
  ("lucille","205-2928"),
  ("wendy","939-8282"),
  ("penny","853-2492"),
  ("penny","555-2111")
  ]
```

### Find a value

````hs
findKey :: (Eq k) => k -> [(k, v)] -> [(k, v)]
findKey key xs = filter (\(k, v) -> key == k) $ xs

findKey "betty" phoneBook -- [("betty","555-2938"),("betty","342-2492")]
```

```hs
findKey :: (Eq k) => k -> [(k, v)] -> (k, v)
findKey key xs = snd . head . filter (\(k, v) -> key == k) $ xs

findKey "betty" phoneBook -- ("betty","555-2938")
```

```hs
findKey :: (Eq k) => k -> [(k, v)] -> v
findKey key xs = snd . head . filter (\(k, v) -> key == k) $ xs

findKey "betty" phoneBook -- "555-2938"
findKey "alice" phoneBook -- "*** Exception: Prelude.head: empty list --
```

```hs
findKey' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey' key xs

findKey' "betty" phoneBook -- Just "555-2938"
findKey' "alice" phoneBook -- Nothing
```

```hs
findKey'' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey'' key xs = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing xs

findKey'' "betty" phoneBook -- Just "555-2938"
findKey'' "alice" phoneBook -- Nothing
```

### Data.Map

```hs
import qualified Data.Map as Map
````

```hs
:t Map.fromList -- Map.fromList :: Ord k => [(k, a)] -> Map.Map k a

Map.fromList [("betty","555-2938"),("bonnie","452-2928"),("lucille","205-2928")]
-- fromList [("betty","555-2938"),("bonnie","452-2928"),("lucille","205-2928")]

Map.fromList [("MS",1),("MS",2),("MS",3)]
-- fromList [("MS",3)]
```

```hs
phoneBook' :: Map.Map String String
phoneBook' = Map.fromList $ [
  ("betty","555-2938"),
  ("betty","342-2492"),
  ("bonnie","452-2928"),
  ("patsy","493-2928"),
  ("patsy","943-2929"),
  ("patsy","827-9162"),
  ("lucille","205-2928"),
  ("wendy","939-8282"),
  ("penny","853-2492"),
  ("penny","555-2111")
  ]
```

````hs
:t Map.lookup -- Map.lookup :: Ord k => k -> Map.Map k a -> Maybe a
Map.lookup "betty" phoneBook' -- Just "342-2492"
Map.lookup "alice" phoneBook' -- Nothing
```

```hs
:t Map.insert -- Map.insert :: Ord k => k -> a -> Map.Map k a -> Map.Map k a
let newBook = Map.insert "alice" "123-4567" phoneBook'
Map.lookup "alice" newBook -- Just "123-4567"
````

```hs
:t Map.size -- Map.size :: Map.Map k a -> Int
Map.size phoneBook' -- 6
Map.size newBook -- 7
```

```hs
string2digits "123-4567" -- [1,2,3,4,5,6,7]
let intBook = Map.map string2digits phoneBook'
:t intBook -- intBook :: Map.Map String [Int]
Map.lookup "betty" intBook -- Just [3,4,2,2,4,9,2]
```

```hs
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
    where add number1 number2 = number1 ++ ", " ++ number2

Map.lookup "patsy" $ phoneBookToMap phoneBook -- Just "827-9162, 943-2929, 493-2928"
Map.lookup "wendy" $ phoneBookToMap phoneBook -- Just "939-8282"
```

```hs
phoneBookToMap' :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap' xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs

Map.lookup "patsy" $ phoneBookToMap' phoneBook -- Just ["827-9162","943-2929","493-2928"]
```

```hs
Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)] -- fromList [(2,100),(3,29),(4,22)]
Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)] -- fromList [(2,108),(3,62),(4,37)]
```

---

## Export

in `modules/Geometry/`

- code: [Geometry](../examples/modules/Geometry.hs)
- example: import [Geometry](../examples/modules/import_geometry.hs)

```hs
:l import_geometry.hs

[1 of 2] Compiling Geometry         ( Geometry.hs, interpreted )
[2 of 2] Compiling Main             ( import_geometry.hs, interpreted )
Ok, two modules loaded.
```

```hs
sphere -- 113.097336
cuboid -- 52.0
cube -- 54.0
```

### Sub-modules

- code: [Sphere](../examples/modules/Geometry/Sphere.hs), [Cuboid](../examples/modules/Geometry/Cuboid.hs), [Cube](../examples/modules/Geometry/Cube.hs)
- example: import [modules](../examples/modules/import_modules.hs)

```hs
:l import_modules.hs

[1 of 4] Compiling Geometry.Cuboid  ( Geometry/Cuboid.hs, interpreted )
[2 of 4] Compiling Geometry.Cube    ( Geometry/Cube.hs, interpreted )
[3 of 4] Compiling Geometry.Sphere  ( Geometry/Sphere.hs, interpreted )
[4 of 4] Compiling Main             ( import_modules.hs, interpreted )
Ok, four modules loaded.
```

```hs
sphere -- 113.097336
cuboid -- 52.0
cube -- 54.0
```
