# Pattern Matching

code: [patternmatching.hs](../src/basic/patternmatching.hs)

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

## guard

example 1:

```hs
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "Underweight"
    | bmi <= 25.0 = "Normal weight"
    | bmi <= 30.0 = "Overweight"
    | otherwise   = "Whale"
```

```hs
bmiTell 20 -- "Normal weight"
bmiTell 26.5 -- "Overweight"
bmiTell 500 -- "Whale"

bmiTell' 85 1.90 -- "Normal weight"
```

example 2:

```hs
max' :: (Ord a) => a -> a -> a
max' a b
    | a <= b = b
    | otherwise = a
```

```hs
max' 3 5 -- 5
max' 5 3 -- 5
```

example 3:

```hs
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b = EQ
    | a <= b = LT
    | otherwise = GT
```

```hs
2 `myCompare` 3 -- LT
3 `myCompare` 2 -- GT
3 `myCompare` 3 -- EQ
```

## where

```hs
bmiTell'' :: (RealFloat a) => a -> a -> String
bmiTell'' weight height
    | bmi <= skinny = "Underweight"
    | bmi <= normal = "Normal weight"
    | bmi <= fat    = "Overweight"
    | otherwise     = "Whale"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
```

with pattern matching:

```hs
bmiTell''' :: (RealFloat a) => a -> a -> String
bmiTell''' weight height
    | bmi <= skinny = "Underweight"
    | bmi <= normal = "Normal weight"
    | bmi <= fat    = "Overweight"
    | otherwise     = "Whale"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
```

function parameters:

```hs
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname
```

```hs
initials "Peter" "Parker" -- "P. P."
```

define function:

```hs
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2
```

```hs
calcBmis [(80, 1.6), (70, 1.5)] -- [31.249999999999993,31.11111111111111]
```

global variables:

```hs
badGreeting :: String
badGreeting = "Oh! Pfft. It's you."

niceGreeting :: String
niceGreeting = "Hello! So very nice to see you,"

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name
```

```hs
greet "Juan" -- "Hello! So very nice to see you, Juan!"
greet "Peter" -- "Oh! Pfft. It's you. Peter"
```

## let

```hs
cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea
```

```hs
4 * (let a = 9 in a + 1) + 2 -- 42
[let square x = x * x in (square 5, square 3, square 2)] -- [(25,9,4)]
(let a = 100; b = 200; c = 300 in a*b*c, let foo = "Hey "; bar = "there!" in foo ++ bar) -- (6000000,"Hey there!")
(let (a,b,c) = (1,2,3) in a+b+c) * 100 -- 600
```

list comprehension:

```hs
calcBmis' :: (RealFloat a) => [(a, a)] -> [a]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

calcBmis'' :: (RealFloat a) => [(a, a)] -> [a]
calcBmis'' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > fat]
  where fat = 25.0
```

```hs
calcBmis' [(80, 1.6)] -- [31.249999999999993]
calcBmis'' [(50, 1.4)] -- [25.510204081632658]
```

GHCi:

```hs
let zoot x y z = x * y + z
zoot 3 9 2 -- 29

let boot x y z = x * y + z in boot 3 4 2 -- 14
boot -- error: variable not in scope
```

## case

```hs
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

head'' :: [a] -> a
head'' xs = case xs of [] -> error "Can't call head on an empty list, dummy!"
                       (x:_) -> x
```

```hs
describeList :: [a] -> String
describeList ls = "The list is " ++
    case ls of [] -> "empty."
               [x] -> "a singleton list."
               xs -> "a longer list."

describeList' :: [a] -> String
describeList' ls = "The list is " ++ what ls
  where what [] = "empty."
        what [x] = "a singleton list."
        what xs = "a longer list."
```
