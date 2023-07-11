module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n 
    | n <= 0 = Nothing
    | otherwise = Just (toInteger(length $ steps [n]) - 1)
    where
        steps :: [Integer] -> [Integer]
        steps (1:xs) = (1:xs)
        steps (x:xs) = steps ((if x `mod` 2 == 0 then x `div` 2 else 3*x + 1):x:xs)
