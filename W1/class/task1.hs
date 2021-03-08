main :: IO()
main = do
    print $ "Hello wold"

-- This is single line comment

{-
This is a block of comment 
or multiline comment!
We should not comment code!!! Simeon does not like it :)
-}

-- We going to use the practice of so called TDD Test drive ndevelopment 
-- Ctrl plus / make comment of multiple lines

    print $ min 5 6 == 5
    print $ minIf (-60) (-15) == (-60)
    print $ minIf 15 60 == 15
    print $ minIf 60 15 == 15
    print $ minGuard 15 60 == 15
    print $ minGuard 60 15 == 15

    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32
    print $ quotientWhole 154 17 == 9
    --print $ quotientWhole 154 0 == 9
    --print $ quotientWhole2 154 0 == 9
    --print $ quotientWhole3 154 0 == 9


    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15    

    print $ divReal 154 10 == 15.4   -- in Haskell numbers written like (as constant) this are doubles except when in the function is written Int
    print $ quotientReal 154.21 17.17 == 9

    print $ averageWhole 5 1542 == 773.5

minIf :: Int -> Int -> Int
minIf n m = if n < m then n else m

-- Guards in Haskell are same as switch cases in C++?
minGuard :: Int -> Int -> Int
minGuard x y 
 | x < y = x    -- one space pipe | and than the condition
 | otherwise = y    -- otherwise is not necessary could x >= y = y


{-
1. What is the name of the function?
2. How many arguments does it take?
3. What is the data type of the arguments?
4. What are the names of the arguments?
5. What is the return type?
6. When should an error be returned?
7. How would you solve it on a sheet of paper?
-}

lastDigit :: Int -> Int
lastDigit x = mod x 10     -- prefix same as x % 10 (C++)

quotientWhole :: Int -> Int -> Int
-- quotientWhole x y = div x y      -- this without error handle
quotientWhole x y = if y == 0 then error "y is 0" else div x y   -- error is build-in function and accept string

quotientWhole2 :: Int -> Int -> Int      -- error handling with guard
quotientWhole2 x y
 | y == 0 = error "y in quotientWhole2 is 0"
 | otherwise = div x y 


quotientWhole3 :: Int -> Int -> Int     -- error handling with patern matching (obrazci)
quotientWhole3 x 0 = error "y in quotientWhole3 is 0"
quotientWhole3 x y = div x y

divWhole :: Int -> Int -> Double
divWhole x y = (fromIntegral x) / (fromIntegral y) 

removeLastDigit :: Int -> Int
removeLastDigit x = div x 10

divReal :: Double -> Double -> Double
divReal x y = x / y

quotientReal :: Double -> Double ->Int
quotientReal x y = round $ x / y

averageWhole :: Int -> Int -> Double
averageWhole x y = fromIntegral( x + y) / 2  -- same as (fromIntegral $ x + y) / 2