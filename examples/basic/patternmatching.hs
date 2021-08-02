lucky :: Int -> String
lucky 7 = "LUKCY NUMBER 7!"
lucky 77 = "LUKCY NUMBER 77!"
lucky 777 = "LUKCY NUMBER 777!"
lucky x = "Sorry, you're out of luck"

-- recursive

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- tuple

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- triple

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

thrid :: (a, b, c) -> c
thrid (_, _, z) = z

-- list

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "empty"
tell (x:[]) = "one: " ++ show x -- [x]
tell (x:y:[]) = "two: " ++ show x ++ " and " ++ show y -- [x,y]
tell (x:y:_) = "many: " ++ show x ++ " and " ++ show y -- [x,y, ...]

-- as pattern

firstLetter :: String -> String
firstLetter "" = "Empty String"
firstLetter all@(x:xs) = all ++ ": " ++ [x]

firstLetter' :: String -> String
firstLetter' "" = "Empty String"
firstLetter' all@(x:xs) = all ++ ": " ++ show x

-- gaurd

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "Underweight"
    | bmi <= 25.0 = "Normal weight"
    | bmi <= 30.0 = "Overweight"
    | otherwise   = "Whale"

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
    | weight / height ^ 2 <= 18.5 = "Underweight"
    | weight / height ^ 2 <= 25.0 = "Normal weight"
    | weight / height ^ 2 <= 30.0 = "Overweight"
    | otherwise                   = "Whale"

max' :: (Ord a) => a -> a -> a
max' a b
    | a <= b = b
    | otherwise = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b = EQ
    | a <= b = LT
    | otherwise = GT

-- where

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

bmiTell''' :: (RealFloat a) => a -> a -> String
bmiTell''' weight height
    | bmi <= skinny = "Underweight"
    | bmi <= normal = "Normal weight"
    | bmi <= fat    = "Overweight"
    | otherwise     = "Whale"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

-- where with global variables

badGreeting :: String
badGreeting = "Oh! Pfft. It's you."

niceGreeting :: String
niceGreeting = "Hello! So very nice to see you,"

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name
