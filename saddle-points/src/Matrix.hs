module Matrix (saddlePoints) where

import Data.Array ( Array, bounds, (!), indices, Ix (range) )
import Data.Ix (inRange)
import Data.List (transpose)
import Data.List.Split (chunksOf)


isInBounds :: Ix i => Array i e -> i -> Bool
isInBounds arr = inRange (bounds arr)

readValueFromArray :: Ix i => Array i e -> i -> Maybe e
readValueFromArray arr ind = if isInBounds arr ind then Just (arr ! ind) else Nothing

isPeak :: (Ord a, Show a) => [Maybe a] -> Bool
isPeak [Nothing, _, Nothing] = True
isPeak [Nothing, Just x, Just y] = x > y
isPeak [Just y, Just x, Nothing] = y < x
isPeak [Just a, Just x, Just b] = a < x && x > b
isPeak whatever = error ("Is Peak cannot handle " ++ show whatever)

isDeep :: (Ord a, Show a) => [Maybe a] -> Bool
isDeep [Nothing, _, Nothing] = True
isDeep [Nothing, Just x, Just y] = x < y
isDeep [Just y, Just x, Nothing] = y > x
isDeep [Just a, Just x, Just b] = a > x && x < b
isDeep whatever = error ("Is Peak cannot handle " ++ show whatever)

isSadlePoint :: (Ord e, Show e) => Array (Int, Int) e -> (Int, Int) -> Bool
isSadlePoint arr (x, y) = let
    ((x0, y0), (x1, y1)) = bounds arr
    row = map (arr !) $ range ((x, y0), (x, y1))
    column = map (arr !) $ range ((x0, y), (x1, y))
    in isDeep column && isPeak row

saddlePoints :: (Ord e, Show e) => Array (Int, Int) e -> [(Int, Int)]
saddlePoints matrix =  . chunksOf rows . indices $ matrix
    where
        ((x0, y0), (x1, y1)) = bounds matrix
        rows = y1 - y0
        columns = x1 - x0