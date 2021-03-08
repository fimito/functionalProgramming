main :: IO()
main = do
    -- FACTORIEL
    print $ factPM 11 == 39916800 --patern matching
    --print $ factPM (-5) 
    print $ factPMGuard 11 == 39916800
    --print $ factPMGuard (-5) 
    print $ factGuards 11 == 39916800
    print $ factIter 11 == 39916800

{-
1. What is the name of the function? factPM
2. How many arguments does it take? 1
3. What is the data type of the arguments? Int
4. What is the return type? Int
5. What are the names of the arguments? n
6. When should an error be returned? n < 0
7. How would you solve it on a sheet of paper?
-}

factPM :: Int -> Int
{-
Linearly Recursive:
   1. The result is stored in a recursive tail.
   2. The recursive call is part of an expression.
-}
factPM 0 = 1    -- to stop the recursion and not get loop - this is a patern matchin
-- factPM n = n * factPM (n - 1) -- fact 5 = 5 * fact 4 = 5 * 4 * fact 3
factPM n = if n < 0 then error "n is negative" else n * factPM (n - 1)


factPMGuard :: Int -> Int
factPMGuard 0 = 1
factPMGuard n
 | n < 0 = error "n is negative"
 | otherwise = n * factPMGuard (n - 1)


factGuards :: Int-> Int
factGuards n
 | n < 0 = error "n is negative"
 | n == 0 = 1
 | otherwise = n * factGuards (n - 1)


{-
Linearly Iterative:
   1.The result is stored as a variable that is part of ANOTHER function.
   Often the variable is named "result" and the function - "helper".
   2. The recursive call is not part of an expression.
   - these processes are faster than the linearly recursive ones!
-}
factIter :: Int -> Int
factIter n = helper n 1     -- 1 is the result where is going explained below
{-
h 5 1
h 4 5 =(1 * 5)
h 3 20 =(1 * 5 * 4)
h 2 60 =(1 * 5 * 4 * 3)
h 1 120 =(1 * 5 * 4 * 3 * 2)
h 0 120
-}
 where  -- one space before the code word where
     helper :: Int -> Int -> Int   --declaration of the inner/local helper function - it is accesible only by factIlter
     helper 0 result = result
     helper n result
      | n < 0 = error "n is negative"
      | otherwise = helper (n - 1) (result * n)


-- Linearly Iterative are faster than Linearly Recursive