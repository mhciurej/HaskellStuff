module Palindromes (largestPalindrome, smallestPalindrome) where

import Data.Tuple.Extra (fst3)

products :: Integer -> Integer -> [(Integer, Integer, Integer)]
products n m = [(i*j, i, j) | i <- [n..m], j <- [n..m], i*j `mod` 10 /= 0]

palindromsDecreasing :: Integer -> Integer -> [Integer]
palindromsDecreasing n m = let
    prod1 = 

isPalindrom :: Integer -> Bool
isPalindrom n = show n == reverse (show n)

findPalindroms :: Integer -> Integer -> [(Integer, Integer, Integer)]
findPalindroms n = filter (isPalindrom . fst3) . products n

addResult :: (Integer, Integer, Integer) -> (Integer, [(Integer, Integer)]) -> (Integer, [(Integer, Integer)])
addResult (_, f1, f2) (p, r) = (p, (f1, f2):r)

largestPalindrome :: Integer -> Integer -> Maybe (Integer, [(Integer, Integer)])
largestPalindrome n m = let
    palindromes = findPalindroms n m :: [(Integer, Integer, Integer)]
    maxPalindrom = maximum . map fst3 $ palindromes :: Integer
    onlyMaximalProducts = filter ((maxPalindrom ==) . fst3) palindromes :: [(Integer, Integer, Integer)]
    results = foldr addResult (maxPalindrom, []) onlyMaximalProducts :: (Integer, [(Integer, Integer)])
    in if null (snd results) then Nothing else Just results

smallestPalindrome :: Integer -> Integer -> Maybe (Integer, [(Integer, Integer)])
smallestPalindrome n m = let
    palindromes = findPalindroms n m :: [(Integer, Integer, Integer)]
    minPalindrom = minimum . map fst3 $ palindromes :: Integer
    onlyMinimalProducts = filter ((minPalindrom ==) . fst3) palindromes :: [(Integer, Integer, Integer)]
    results = foldr addResult (minPalindrom, []) onlyMinimalProducts :: (Integer, [(Integer, Integer)])
    in if null (snd results) then Nothing else Just results
