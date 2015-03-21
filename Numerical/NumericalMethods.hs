-- Numerical Methods
-- Ryan Forsyth - 03/21/2015

-- Left Riemann Sum
leftRiemannSum :: (Fractional a, Enum a) => (a -> a) -> a -> a -> a -> a
leftRiemannSum f a b numIntervals =
    let intervalLength = (b - a) / numIntervals
    in let xs = [a, (a + intervalLength) .. b]
    in foldl (+) 0 $ map (\y -> y * intervalLength) $ map f xs
    
-- Right Riemann Sum
rightRiemannSum :: (Fractional a, Enum a) => (a -> a) -> a -> a -> a -> a
rightRiemannSum f a b numIntervals =
    let intervalLength = (b - a) / numIntervals
    in let xs = [(a + intervalLength), (a + 2 * intervalLength) .. (b + intervalLength)]
    in foldl (+) 0 $ map (\y -> y * intervalLength) $ map f xs
    
-- Discrete Sum
sum' :: (Num a, Enum a) => (a -> a) -> a -> a -> a
sum' f a b = foldl (+) 0 $ map f [a, (a + 1) .. b]   

main =
    do let p x = x ^ 2
       putStrLn "Using a left Riemann Sum to do a regular sum from 0 to 3 of i^2"
       putStrLn $ show $ leftRiemannSum (p) 0 3 3
       
       putStrLn "Numerical approximation using Left Riemann Sum for x^2 from 0 to 1"
       putStrLn $ show $ leftRiemannSum  (p) 0.0 1.0 1000.0
       
       putStrLn "Numerical approximation using Right Riemann Sum for x^2 from 0 to 1"
       putStrLn $ show $ rightRiemannSum  (p) 0.0 1.0 1000.0
       
       putStrLn "Numerical approximation using Left Riemann Sum for cos(x) from 0 to 1"
       putStrLn $ show $ leftRiemannSum (cos) 0.0 1.0 1000.0
       
       putStrLn "Numerical approximation using Right Riemann Sum for cos(x) from 0 to 1"
       putStrLn $ show $ rightRiemannSum (cos) 0.0 1.0 1000.0
       
       putStrLn "Regular sum evaluation for i^2 from 0 to 3"
       putStrLn $ show $ sum' (p) 0 3
       
       putStrLn "Regular sum evaluation for i from 0 to 10"
       putStrLn $ show $ sum' (\x -> x) 0 10
