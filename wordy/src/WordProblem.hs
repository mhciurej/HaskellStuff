{-# LANGUAGE Safe #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE InstanceSigs #-}

module WordProblem (answer) where

import Data.Char (isDigit)

--to review

data Part =
    Operation (Integer -> Integer -> Integer) |
    Value Integer |
    Useless |
    Partial (Integer -> Integer) |
    Blank

instance Eq Part where
    (==) :: Part -> Part -> Bool
    (==) Useless Useless = True
    (==) (Value n1) (Value n2) = n1 == n2
    (==) _ _ = False 

toNumber :: String -> Maybe Integer
toNumber s
    | all ((||) <$> (=='-') <*> isDigit) s = Just . read $ s
    | otherwise = Nothing

wordToPart :: String -> Part
wordToPart "plus" = Operation (+)
wordToPart "minus" = Operation (-)
wordToPart "multiplied" = Operation (*)
wordToPart "divided" = Operation div
wordToPart "by" = Useless
wordToPart s =
    case toNumber s of
        Just n -> Value n
        _ -> Blank

computeParts :: Part -> Part -> Part
computeParts x Blank = x
computeParts (Operation o) (Value v) = Partial . o $ v
computeParts (Value v) (Partial p) = Value . p $ v
computeParts _ _ = Useless

answer :: String -> Maybe Integer
answer = 
    \case {Value n -> Just n; _ -> Nothing} .
    foldr computeParts Blank . reverse . filter (/= Useless) . map wordToPart . words . init
