main :: IO()
main = do
    -- FIBONACCI (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...)
    print $ fib 11 == 89
    print $ fib (-7)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n
 | n < 0 = error "n is negative"
 | otherwise = fib (n - 1) + fib (n - 2)   -- fib 0 + fib (-1). This is linearly recursive where the "+" is the expression that unites the two recursions.

