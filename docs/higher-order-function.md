# Higher-order function

Wikipedia: [Higher-order function](https://en.wikipedia.org/wiki/Higher-order_function)

a function that does at least one of the following:

- takes one or more functions as arguments (i.e. procedural parameters),
- returns a function as its result.

## Curried function

```hs
:t max -- max :: Ord a => a -> a -> a

let max' = max 5
:t max' -- max' :: (Ord a, Num a) => a -> a

max' 4 -- 5
max' 6 -- 6
```

```hs
multiThree :: Num a => a -> a -> a -> a
multiThree :: Num a => a -> (a -> (a -> a))
multiThree x y z = x * y * z


multiThree 3 5 9 == (((multiThree 3) 5) 9) -- True
```

### section

To **section** an **infix function**,  
simply surround it with parentheses and only supply a parameter on one side.

```hs
(/10) 200 -- 20.0

divideByTen = (/10) -- divideByTen :: Fractional a => a -> a
divideByTen 200 -- 20.0 == 200 / 10
```

```hs
isUpperAlphanum = (`elem` ['A'..'Z']) -- isUpperAlphanum :: Char -> Bool
isUpperAlphanum 'a' -- False
isUpperAlphanum 'H' -- True
```

The only special thing about sections is using `-`.

`(-4) /= (subtract 4)`

### functions

```hs
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
```

```hs
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y
```

```hs
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs
```

```hs
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs
```

```hs
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted
```

## Lambda

anonymous functions

```hs
addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

addThree :: (Num a) => a -> a -> a -> a
addThree = \x -> \y -> \z -> x + y + z
```

```hs
flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x
```

## Fold

- `foldl`
- `foldr`
- `foldl1`
- `foldr1`

### foldl

```hs
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum' [1,2,3,4,5] -- 15
```

### foldr

the `++` function is much more expensive than `:`, so we usually use right folds when we're building up new lists from a list.

```hs
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

map' (+3) [1,2,3,4,5] -- [4,5,6,7,8]
```

### foldl1

```hs
maximum' = foldl1 max
maximum' [4,5,6,3,1] -- 6
```

### foldr1

```hs
maximum' = foldr1 (\x acc -> if x > acc then x else acc)
maximum' [4,5,6,3,1] -- 6
```

### scanl, scanr

report all the intermediate accumulator states in the form of a list.

```hs
scanl (+) 0 [3,5,2,1] -- [0,3,8,10,11]
scanr (+) 0 [3,5,2,1] -- [11,8,3,1,0]
```

## Function application operator

**right-associative**

```hs
:t ($)
($) :: (a -> b) -> a -> b
f $ x = f x
```

```hs
sum $ filter (> 10) $ map (*2) [2..10] -- 80
```

## Function composition

```hs
:t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
```

```hs
map (\x -> negate (abs x)) [5, -3, 6, 7, -3, 2, -19, 24]
map (negate . abs) [5, -3, 6, 7, -3, 2, -19, 24]

-- [-5,-3,-6,-7,-3,-2,-19,-24]
```

### point-free style

```hs
sum' :: (Num a) => [a] -> a
sum' = foldl (\acc x -> acc + x) 0
sum' xs = foldl (\acc x -> acc + x) 0 xs
```
