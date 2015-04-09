module Recurrences where

-- Fibonacci numbers
fibonacci :: (Num a1, Num a, Eq a) => a -> a1                    -- What the type was inferred to be
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Stirling numbers of the first kind
stirling01 :: (Num a1, Num a, Eq a1, Eq a) => a1 -> a -> a1     -- What the type was inferred to be 
stirling01 0 0 = 1
stirling01 _ 0 = 0
stirling01 0 _ = 0
stirling01 n k = (n - 1) * (stirling01 (n - 1) k) + (stirling01 (n - 1) (k - 1))

-- Stirling numbers of the second kind
stirling02 :: (Num a1, Num a, Eq a1, Eq a) => a -> a1 -> a1     -- What the type was inferred to be
stirling02 0 0 = 1
stirling02 _ 0 = 0
stirling02 0 _ = 0
stirling02 n k = k * (stirling02 (n - 1) k) + (stirling02 (n - 1) (k - 1))

-- Gray Code
-- Use mapM putStrLn $ gray n to print each value on a new line
gray :: (Num a, Eq a) => a -> [[Char]]                          -- What the type was inferred to be
gray 1 = ["0", "1"]
gray n = (map ("0" ++) $ gray (n - 1)) ++ (map ("1" ++) $ reverse $ gray (n - 1))
