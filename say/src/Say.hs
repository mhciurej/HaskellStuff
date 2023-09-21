module Say (inEnglish) where

newtype Range_0_19 = Unsafe_0_19 { value_0_19 :: Integer }
newtype Range_0_99 = Unsafe_0_99 { value_0_99 :: Integer }

makeRange_0_19 :: Integer -> Maybe Range_0_19
makeRange_0_19 n
    | n `elem` [0..19] = Just $ Unsafe_0_19 n
    | otherwise = Nothing

makeRange_0_99 :: Integer -> Maybe Range_0_99
makeRange_0_99 n
    | n `elem` [0..99] = Just $ Unsafe_0_99 n
    | otherwise = Nothing



say0_19 :: Integer -> String
say0_19 0 = ""
say0_19 1 = " one"
say0_19 2 = " two"
say0_19 3 = " three"
say0_19 4 = " four"
say0_19 5 = " five"
say0_19 6 = " six"
say0_19 7 = " seven"
say0_19 8 = " eight"
say0_19 9 = " nine"
say0_19 10 = " ten"
say0_19 11 = " eleven"
say0_19 12 = " twelve"
say0_19 13 = " thirteen"
say0_19 14 = " fourteen"
say0_19 15 = " fiveteen"
say0_19 16 = " sixteen"
say0_19 17 = " seventeen"
say0_19 18 = " eighteen"
say0_19 19 = " nineteen"

say0_99 :: Integer -> String
say0_99 n
    | n < 20 = say0_19 n
    | otherwise = let
        tens = case n `div` 10 of
            2 -> " twenty"
            3 -> " thirty"
            4 -> " fourty"
            5 -> " fivety"
            6 -> " sixty"
            7 -> " seventy"
            8 -> " eighty"
            9 -> " ninety"
        in tens <> say0_19 (n `mod` 10)



inEnglish :: Integer -> Maybe String
inEnglish n
    | n < 0 = Nothing
    | n > 999999999999 = Nothing
    | n == 0 = Just "zero"
    | otherwise = Just $ say0_19 n