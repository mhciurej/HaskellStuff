module SumOfMultiples (sumOfMultiples) where

import Data.List ( group, sort )

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = 
    sum $ map head . group $ sort $ foldr (\elem -> if elem == 0 then id else (++ takeWhile (<limit) (map (*elem) [1..]))) [0] factors
