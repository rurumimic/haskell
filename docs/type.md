# Type

Haskell has type inferences.

- `:t`
- `::` is read as "has type of"

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

---

## Typeclass
