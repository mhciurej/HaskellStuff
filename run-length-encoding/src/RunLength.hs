module RunLength (decode, encode) where

import Data.List (group)
import Data.List.Split (splitOn)
import Data.Char (isDigit)

decodeHelper :: String -> String
decodeHelper [] = []
decodeHelper [x] = [x]
decodeHelper xs = replicate (read . init $ xs :: Int) $ last xs

divideIntoChunks :: String -> [String]
divideIntoChunks [] = []
divideIntoChunks input = splitOn ";" . foldr (\x acc -> if isDigit x then x:acc else x:';':acc) "" $ input

decode :: String -> String
decode = concatMap decodeHelper . divideIntoChunks

encodeGroup :: String -> String
encodeGroup [] = []
encodeGroup [x] = [x]
encodeGroup xs = (show . length $ xs) ++ [head xs]

encode :: String -> String
encode = concatMap encodeGroup . group
