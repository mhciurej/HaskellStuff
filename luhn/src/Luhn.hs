module Luhn (isValid) where

import Data.Char as C

isValid :: String -> Bool
isValid number
    | (length . filter (/= ' ') $ number) < 2 = False
    | otherwise = (0 == ) . (`mod` 10) . sum . map (\x -> if x >= 10 then x - 9 else x) .
    zipWith (*) (concat . repeat $ [1, 2]) . map C.digitToInt . reverse . filter (/= ' ') $ number
