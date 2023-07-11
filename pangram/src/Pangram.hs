module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram = and.(flip map ['a'..'z']).inString.(map toLower)

inString :: String -> Char -> Bool
inString [] = const False 
inString (x:xs) = or.(flip map [(x == ), (inString xs)]).(flip ($))

