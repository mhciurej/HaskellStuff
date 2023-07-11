module Series (Error(..), largestProduct) where

import Data.List (transpose, tails)
import Data.Char (isDigit, digitToInt)

data Error = InvalidSpan | InvalidDigit Char deriving (Show, Eq)

largestProduct :: Int -> String -> Either Error Integer
largestProduct size digits
    | size <= 0 = Left InvalidSpan
    | size > length digits = Left InvalidSpan
    | not . all isDigit $ digits = Left (InvalidDigit (head . filter (not . isDigit) $ digits))
    | otherwise = Right . toInteger . maximum . 
        map (product . map digitToInt) . filter ((size ==).length ) . 
        transpose . take size . tails $ digits