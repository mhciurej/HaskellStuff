module Matrix (saddlePoints) where

import Data.Array (Array)
import Data.Array (bounds, (!))
import Data.Ix (inRange)

isInBounds :: Array i e -> i -> Bool
isInBounds arr = inRange (bounds arr)
    -- let
    -- ((a, b), (c, d)) = bounds arr
    -- (e, f) = ind
    -- in (a <= e && e <= c) && (b <= f && f <= d)

readValueFromArray :: Array i e -> i -> Maybe e
readValueFromArray arr ind = if isInBounds arr ind then Just (arr ! ind) else Nothing

isPeak :: Ord a => [Maybe a] -> Bool
isPeak [Nothing, _, Nothing] = True
isPeak [Nothing, Just x, Just y] = x > y
isPeak [Just y, Just x, Nothing] = y < x
isPeak [Just a, Just x, Just b] = a < x && x > b

isDeep :: Ord a => [Maybe a] -> Bool
isDeep [Nothing, _, Nothing] = True
isDeep [Nothing, Just x, Just y] = x < y
isDeep [Just y, Just x, Nothing] = y > x
isDeep [Just a, Just x, Just b] = a > x && x < b

isSadlePoint :: Array i e -> i -> Bool
isSadlePoint arr (x, y) = let
    temp = readValueFromArray arr
    row = [temp (x - 1, y), temp (x, y), temp (x + 1, y)]
    column = [temp (x, y - 1), temp (x, y), temp (x + 1, y)]
    in isDeep column && isPeak row

saddlePoints :: Array i e -> [i]
saddlePoints matrix = filter (isSadlePoint arr) $ map fst $  assocs arr
