module RotationalCipher (rotate) where

import Data.Char (isLower, isUpper, ord, chr)

rotateChar :: Int -> Char -> Char
rotateChar n c
    | isLower c = chr . (ord 'a' +) . (`rem` 26) . (+(n - ord 'a')) . ord $ c
    | isUpper c = chr . (ord 'A' +) . (`rem` 26) . (+(n - ord 'A')) . ord $ c
    | otherwise = c

rotate :: Int -> String -> String
rotate n = map (rotateChar n)
