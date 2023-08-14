module RailFenceCipher (encode, decode) where

import Data.List (transpose)
import Data.Strict.Maybe (fromJust)

fence :: Int -> Int -> [[Maybe Char]]
fence levels height = map (column . letterLevel) [1..levels]
    where
        column :: Int -> [Maybe Char]
        column pos = replicate pos Nothing ++ [Just '_'] ++ replicate (height - pos - 1) Nothing
        letterLevel :: Int -> Int
        letterLevel n = let
                k = (n `rem` (2*height - 1)) :: Int
            in if k < height then k else 2*height - 1 - k

replaceXwithLetter :: String -> [[Maybe Char]] -> [[Maybe Char]]
replaceXwithLetter c = map (>> Just c)
    where
        replaceLetter :: (Maybe Char, String) -> (Maybe Char, String)
        replaceLetter (Nothing, str) = (Nothing, str)
        replaceLetter (Just _, x:xs) = (Just x, xs)

encode :: Int -> String -> String
encode n letters = 
    map fromJust . filter (/= Nothing) . concat . transpose . 
        zipWith replaceXwithLetter letters $ fence n (length letters)

decode :: Int -> String -> String
decode = error "You need to implement this function!"
