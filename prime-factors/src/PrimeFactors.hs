module PrimeFactors (primeFactors) where

primeHelper :: Integral a => [a] -> [a] -> [a]
primeHelper [] primes = primes
primeHelper (x:xs) primes = primeHelper (filter ((/= 0).(`mod` x)) xs) (x:primes)

primeDivisors :: Integer -> [Integer]
primeDivisors 0 = []
primeDivisors 1 = []
primeDivisors n = (reverse . filter ((0 == ).(n `mod`))) $ primeHelper ([2..(n + 1 `div` 2)] ++ [n]) []

divideTillNotDividable :: Integral t => t -> t -> [t]
divideTillNotDividable n p
    | n `mod` p == 0 = p:divideTillNotDividable (n `div` p) p
    | otherwise = []

primeFactors :: Integer -> [Integer]
primeFactors n = (concatMap (divideTillNotDividable n) . primeDivisors) n