{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
module Sieve (primesUpTo) where

-- You should not use any of the division operations when implementing
-- the sieve of Eratosthenes.
import Prelude hiding (div, mod, divMod, rem, quotRem, quot, (/))
import Data.List.Split as S

changeEveryN_if :: Integer -> Integer -> (Integer -> Bool) -> [Integer] -> [Integer]
changeEveryN_if interval newValue pred = concatMap (\(x:xs) -> if pred x then newValue:xs else x:xs) . S.chunksOf (fromIntegral interval ::Int)

primesUpTo :: Integer -> [Integer]
primesUpTo n = map fst . filter (uncurry (==)) . zip [2..n] . drop 2 $ foldr (\el acc -> changeEveryN_if el el (>el) acc) [0..n] [n,n-1..2]
