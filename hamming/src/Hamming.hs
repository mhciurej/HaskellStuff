module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance [] _ = Nothing
distance _ [] = Nothing
distance xs ys
    | length xs == length ys = Just $ sum . map (\x -> if x then 1 else 0) $ zipWith (/=) xs ys
    | otherwise = Nothing
        