module Roman (numerals) where

numerals :: Integer -> Maybe String
numerals n
    | n == 0 =   Nothing
    | n > 3000 = Nothing
    | otherwise = Just 
        ((thousands (n `div` 1000)) ++
        (hundereds(n `mod` 1000 `div` 100)) ++
        (tens(n `mod` 100 `div` 10)) ++
        (singles(n `mod` 10)))
    where
        thousands :: Integer -> String
        thousands 0 = ""
        thousands p = ['M' | _ <- [1..p]]

        hundereds :: Integer -> String
        hundereds 0 = ""
        hundereds 1 = "C"
        hundereds 2 = "CC"
        hundereds 3 = "CCC"
        hundereds 4 = "CD"
        hundereds 5 = "D"
        hundereds 6 = "DC"
        hundereds 7 = "DCC"
        hundereds 8 = "DCCC"
        hundereds 9 = "CM" 

        tens :: Integer -> String
        tens 0 = ""
        tens 1 = "X"
        tens 2 = "XX"
        tens 3 = "XXX"
        tens 4 = "XL"
        tens 5 = "L"
        tens 6 = "LX"
        tens 7 = "LXX"
        tens 8 = "LXXX"
        tens 9 = "XC"

        singles :: Integer -> String
        singles 0 = ""
        singles 1 = "I"
        singles 2 = "II"
        singles 3 = "III"
        singles 4 = "IV"
        singles 5 = "V"
        singles 6 = "VI"
        singles 7 = "VII"
        singles 8 = "VIII"
        singles 9 = "IX"
