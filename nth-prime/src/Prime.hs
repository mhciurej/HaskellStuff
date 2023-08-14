module Prime (nth) where

primes :: [Integer] -> [Integer]
primes [] = error "Argument mismatch"
primes (x:xs) = x:primes (filter ((0 /=).(`mod` x)) xs)

allPrimes :: [Integer]
allPrimes = primes [2..]

nth :: Integer -> Maybe Integer
nth 0 = Nothing
nth n = Just $ allPrimes !! fromIntegral (n - 1)
