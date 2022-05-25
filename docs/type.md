# Type

Haskell has type inferences.

- `:t`
- `::` is read as "has type of"

code: [type.hs](../src/basic/type.hs)

```hs
:l type.hs
```

## Explicit type

**Explicit types** are always denoted with **the first letter in capital case**.

```hs
:t 'a' -- 'a' :: Char
:t "alphabet" -- "alphabet" :: [Char]
:t True -- True :: Bool
:t (False, 'a') -- (False, 'a') :: (Bool, Char)
:t 1 == 0 -- 1 == 0 :: Bool
:t 2 * 3 -- 2 * 3 :: Num a => a
```

function type:

```hs
:l type.hs

:t removeNonUppercase -- removeNonUppercase :: [Char] -> [Char]
removeNonUppercase "Hahaha! Ahahaha!" -- HA

:t addThree -- addThree :: Int -> Int -> Int -> Int
addThree 3 4 5 -- 12
```

## Common types

### Integer

- `Integer` is not bounded.

```hs
factorial 50
30414093201713378043612608166064768844377641568960512000000000000
```

### Int

- `Int` is more efficient than `Integer`.
- `Int` is bounded.
- `Int` has a minimum and a maximum value
  - 64-bit: -2<sup>63</sup> ~ 2<sup>63</sup> - 1

```hs
fatorial' 50
-3258495067890909184
```

### Float

- a real floating point with single precision.

```hs
circumference 4.0 -- 25.132742
```

### Double

- a real floating point with **double** the precision.

```hs
circumference' 4.0 -- 25.132741228718345
```

### Bool

- `True`
- `False`

### Char

- a character.

### Tuple

- Theoretically there is an infinite number of tuple types.

```hs
:t () -- () :: ()
:t ('a', "alphabet", 1, -3.14, True) -- ('a', "alphabet", 1, -3.14, True) :: (Num c, Fractional d) => (Char, [Char], c, d, Bool)
```

---

## Type Variable

```hs
:t head -- head :: [a] -> a
:t tail -- tail :: [a] -> [a]
:t init -- init :: [a] -> [a]
:t last -- last :: [a] -> a
```

- `a` can be of any type.
  - like _generics_ in other languages.
  - in Haskell it's much more powerful: it's easy.
- **Polymorphic functions**: functions that have type variables.

```hs
:t fst -- fst :: (a, b) -> a
:t snd -- snd -- :: (a, b) -> b
:t zip -- zip :: [a] -> [b] -> [(a, b)]
```

## Typeclass

a sort of interface that defines some behavior.

- **class constraint**: Everything before the `=>` symbol

### Eq

```hs
:t (==) -- (==) :: Eq a => a -> a -> Bool
```

- All standard Haskell types except for IO and functions are a part of the `Eq` typeclass.

- `==`
- `/=`

### Ord

```hs
:t (>) -- (>) :: Ord a => a -> a -> Bool
:t compare -- compare :: Ord a => a -> a -> Ordering
```

- `LT`, `GT`, `EQ`: `:: Ordering`

### Show

```hs
:t show -- show :: Show a => a -> String
```

```hs
show 3 -- "3"
show 5.334 -- "5.334"
show True -- "True"
show 'a' -- "'a'"
```

### Read

```hs
:t read -- read :: Read a => String -> a
```

- `String` == `[Char]`

```hs
read "True" || False -- True
read "8.2" + 3.8 -- 12.0
read "5" - 2 -- 3
read "[1,2,3]" ++ [9] -- [1,2,3,9]
[read "True", False, True] -- [True,False,True]
```

#### Type annotation

```hs
read "5" :: Int -- 5
read "5" :: Float -- 5.0
read "[1,2,3]" :: [Int] -- [1,2,3]
```

### Enum

```hs
['a'..'e'] -- "abcde"
[LT .. GT] -- [LT,EQ,GT]
[3..5] -- [3,4,5]
succ 'B' -- 'C'
pred 'B' -- 'A'
```

### Bounded

- polymorphic constants

```hs
:t minBound -- minBound :: Bounded a => a
:t maxBound -- maxBound :: Bounded a => a
```

```hs
minBound :: Int -- -9223372036854775808
maxBound :: Char -- '\1114111'
minBound :: Char -- '\NUL'
maxBound :: Bool -- True
minBound :: Bool -- False

maxBound :: (Bool, Int, Char) -- (True,9223372036854775807,'\1114111')
```

### Num

```hs
:t 10 -- 10 :: Num p => p

20 :: Int -- 20
20 :: Integer -- 20
20 :: Float -- 20.0
20 :: Double -- 20.0
```

```hs
:t (*) -- (*) :: Num a => a -> a -> a
```

### Floating

- `Float`
- `Double`

```hs
:t sin -- sin :: Floating a => a -> a
sin 0 -- 0.0

:t cos -- cos :: Floating a => a -> a
cos 0 -- 1.0

:t sqrt -- sqrt :: Floating a => a -> a
sqrt 2 -- 1.4142135623730951
```

### Integral

- `Integer`
- `Int`

```hs
:t fromIntegral -- fromIntegral :: (Integral a, Num b) => a -> b
:t length -- length :: Foldable t => t a -> Int
```

```hs
(length [1,2,3,4]) + 3.2 -- error
fromIntegral (length [1,2,3,4]) + 3.2 -- 7.2
```
