module Prime (nth) where

nPrimes :: Integer -> [Integer]
nPrimes 0 = []
nPrimes 1 = [2]
nPrimes 2 = [3, 2]
nPrimes n =
    (head [x | x <- [previous+2, previous+4..], all ((/= 0) . mod x) (reverse allPrevious)]):allPrevious
    where
        allPrevious = nPrimes $ n - 1
        previous = head allPrevious

nth :: Integer -> Maybe Integer
nth 0 = Nothing
nth n = Just . head . nPrimes $ n

changeAtPositions :: Int -> Int -> (a -> a) -> [a] -> [a]
changeAtPositions end 0 f (x:xs) = f x:changeAtPositions end 1 f xs
changeAtPositions end n f (x:xs)
    | n < end = x:changeAtPositions end (n + 1) f xs
    | n == end = f x:changeAtPositions end 1 f xs
