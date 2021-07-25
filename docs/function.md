# Function

## infix function

```hs
2 + 3 -- 5
79 * 1402 -- 110758
```

```hs
True && False -- False
True || False -- True
True == False -- False
True /= False -- True
```

```hs
div 891 10 -- 89
891 `div` 10 -- 89
```

### Types

```hs
:t (+)
(+) :: Num a => a -> a -> a
```

```hs
:t (==)
(==) :: Eq a => a -> a -> Bool
```

```hs
:t div
div :: Integral a => a -> a -> a
```

## prefix function

```hs
succ 6 -- 7
min 3 7 -- 3
max 3.3 99.9 -- 99.9
(succ 9) + (max 5 4) + 1 -- 16
succ (9 * 10) -- 91
```

### Types

```hs
:t succ
succ :: Enum a => a -> a
```

```hs
:t max
max :: Ord a => a -> a -> a
```

---

## Function Definition

[baby.hs](../examples/basic/baby.hs)

```hs
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x * 2
doubleSmallNumber' x = doubleSmallNumber x + 1
```

```hs
:l baby.hs

[1 of 1] Compiling Main             ( baby.hs, interpreted )
Ok, one module loaded.
```

```hs
doubleMe 9 -- 18
doubleMe 8.3 -- 16.6
doubleUs 2.3 34.2 -- 73.0

doubleSmallNumber 100 -- 200
doubleSmallNumber 101 -- 101
doubleSmallNumber' 100 -- 201
```

### apostrophe

```hs
conanO'Brien = "It's a-me, Conan O'Brien!"
conanO'Brien -- "It's a-me, Conan O'Brien!"
```

```hs
'hello = "Hello"

error: Expression syntax in pattern: 'hello
```
