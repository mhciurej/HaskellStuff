module Scrabble (scoreLetter, scoreWord) where
import Data.Char

scoreLetter :: Char -> Integer
scoreLetter letter
    | letterWithoutCase `elem` ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] = 1
    | letterWithoutCase `elem` ['D', 'G'] = 2
    | letterWithoutCase `elem` ['B', 'C', 'M', 'P'] = 3
    | letterWithoutCase `elem` ['F', 'H', 'V', 'W', 'Y'] = 4
    | letterWithoutCase `elem` ['K'] = 5
    | letterWithoutCase `elem` ['J', 'X'] = 8
    | letterWithoutCase `elem` ['Q', 'Z'] = 10
    | otherwise = 0
    where
        letterWithoutCase = toUpper letter

scoreWord :: String -> Integer
scoreWord = foldr ((+).scoreLetter) 0
