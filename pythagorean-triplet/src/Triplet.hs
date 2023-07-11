module Triplet (tripletsWithSum) where

generateAllPairsWithSpecificSum :: Int -> [(Int, Int)]
generateAllPairsWithSpecificSum s = zip [1..(pred s `div` 2)] [s-1, s-2..(succ s `div` 2)]

generateAllTripletsWithSpecificSum :: Int -> [(Int, Int, Int)]
generateAllTripletsWithSpecificSum sum = concat $ map makeTriples [1..(pred sum `div` 3)]
    where
        makeTriples :: Int -> [(Int, Int, Int)]
        makeTriples n = map (\(x, y) -> (n, x, y)) $ generateAllPairsWithSpecificSum $ sum - n

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum sum = 
    filter isRightTriangle . filter isSumAsExpected . filter isTriangle . generateAllTripletsWithSpecificSum $ sum
    where
        isTriangle :: (Int, Int, Int) -> Bool
        isTriangle (a, b, c) = a < b && b < c && a + b > c
        isSumAsExpected :: (Int, Int, Int) -> Bool
        isSumAsExpected (a, b, c) = a + b + c == sum
        isRightTriangle :: (Int, Int, Int) -> Bool
        isRightTriangle (a, b, c) = a^2 + b^2 == c^2

test :: [Bool]
test = [
    generateAllPairsWithSpecificSum 5 == [(1, 4), (2, 3)],
    generateAllPairsWithSpecificSum 6 == [(1, 5), (2, 4)],

    generateAllTripletsWithSpecificSum 6 == [(1, 1, 4), (1, 2, 3)]
    ]