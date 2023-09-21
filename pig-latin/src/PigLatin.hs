module PigLatin (translate) where

vowel :: Char -> Bool
vowel = (`elem` "aefilmnorsuxz")

translate :: String -> String
translate x:xs
    | vowel x = (x:xs) ++ 
