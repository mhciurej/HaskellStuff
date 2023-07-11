{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Use camelCase" #-}
module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import Data.Vector (Vector)
import qualified Data.Vector as V

type Matrix a = Vector (Vector a) 

cols :: Matrix a -> Int
cols matrix = if null matrix then 0 else length . V.head $ matrix

column :: Int -> Matrix a -> Vector a
column x = V.map (V.! (x - 1))

flatten :: Matrix a -> Vector a
flatten = V.concat . V.toList

fromList :: [[a]] -> Matrix a
fromList = V.map V.fromList . V.fromList

fromString :: Read a => String -> Matrix a
fromString = V.fromList . listOfVectors . listOfListOfObjects . listOfStrings
    where
        listOfStrings :: String -> [[String]]
        listOfStrings = map words . lines
        listOfListOfObjects :: Read a => [[String]] -> [[a]]
        listOfListOfObjects = map (map read)
        listOfVectors :: [[a]] -> [Vector a]
        listOfVectors = map V.fromList

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (_, columnNumber) = V.fromList . toNewDimensions . flatten
    where
        toNewDimensions :: Vector a -> [Vector a]
        toNewDimensions vec
            | null vec = []
            | otherwise = V.take columnNumber vec : (toNewDimensions . V.drop columnNumber $ vec)


row :: Int -> Matrix a -> Vector a
row x matrix = matrix V.! (x - 1)

rows :: Matrix a -> Int
rows = length

shape :: Matrix a -> (Int, Int)
shape matrix = (rows matrix, cols matrix)

transpose :: Matrix a -> Matrix a
transpose matrix = V.fromList $ map (`column` matrix) [1..cols matrix]

