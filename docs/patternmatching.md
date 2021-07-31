# Pattern Matching

code: [patternmatching.hs](../examples/basic/patternmatching.hs)

```hs
:l patternmatching.hs
```

## Pattern

```hs
lucky :: Int -> String
lucky 7 = "LUKCY NUMBER 7!"
lucky 77 = "LUKCY NUMBER 77!"
lucky 777 = "LUKCY NUMBER 777!"
lucky x = "Sorry, you're out of luck"
```

```hs
lucky 1 -- "Sorry, you're out of luck"
lucky 2 -- "Sorry, you're out of luck"

lucky 7 -- "LUKCY NUMBER 7!"
lucky 77 -- "LUKCY NUMBER 77!"
lucky 777 -- "LUKCY NUMBER 777!"
```

recursively:

```hs
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

```hs
factorial 0 -- 1
factorial 1 -- 1
factorial 2 -- 2
factorial 3 -- 6
factorial 4 -- 24
factorial 5 -- 120
factorial 6 -- 720
```

## Tuple

```hs
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
```

```hs
addVectors (1, 3) (2, 4) -- (3.0,7.0)
```

triple:

```hs
first :: (a, b, c) -> a
first (x, _, _) = x
```

## List

```hs
let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]
[ a+b | (a, b) <- xs ] -- [4,7,6,8,11,4]
```

```hs
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
```

```hs
head' [4,5,6] -- 4
head' "Hello" -- 'H'
```

```hs
tell [] -- "empty"
tell [1] -- "one: 1"
tell "T" -- "one: 'T'"
tell [True, False] -- "two: True and False"
tell [3, 4] -- "two: 3 and 4"
tell [5, 4, 3] -- "many: 5 and 4"
```

## _as pattern_

```hs
firstLetter :: String -> String
firstLetter "" = "Empty String"
firstLetter all@(x:xs) = all ++ ": " ++ [x]
```

```hs
firstLetter "Dracula" -- "Dracula: D"
firstLetter' "Dracula" -- "Dracula: 'D'"
```
