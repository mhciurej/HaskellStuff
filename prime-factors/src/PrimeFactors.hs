module PrimeFactors (primeFactors) where

primes :: [Integer] -> [Integer]
primes [] = []
primes (x:xs) = x:(primes . filter ((/= 0).(`mod` x)) $ xs)

divideTillGetOne :: Integer -> [Integer] -> [Integer]
divideTillGetOne 1 _ = []
divideTillGetOne _ [] = []
divideTillGetOne n factors@(f:actors)
    | n `mod` f == 0 = f:divideTillGetOne (n `div` f) factors
    | (fromInteger f :: Double) > (sqrt(fromInteger n) :: Double) = [n]
    | otherwise = divideTillGetOne n actors

primeFactors :: Integer -> [Integer]
primeFactors n = divideTillGetOne n (primes [2..n])
