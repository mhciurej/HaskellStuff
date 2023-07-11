module Diamond (diamond) where

import qualified Data.Text as T
import           Data.Text (Text)
import Data.List ( delete, length)

row :: Char -> String
row letter = [letter, pred letter ..'B'] ++ ['A'] ++ ['B'..letter]

column :: Char -> String
column letter = delete letter $ ['A'..letter] ++ [letter, pred letter ..'A']

diamond :: Char -> Maybe [String]
diamond x
    | x `elem` ['A'..'Z'] = let
        array :: [String]
        array = replicate (length $ column x) $ row x
        filtered_array :: [String]
        filtered_array = zipWith (\ a b -> map (\x -> if a == x then a else ' ') b) (column x) array
        in
        Just filtered_array
    | otherwise = Nothing
