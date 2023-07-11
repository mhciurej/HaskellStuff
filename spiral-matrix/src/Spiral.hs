module Spiral (spiral) where

data SpiralMatrix = Simple Int | SpiralMatrix 
    {
        isReflected :: Bool,
        firstRow :: [Int],
        lastColumn :: [Int], --without first element
        rest :: SpiralMatrix
    }

addColumnToTheBeginning :: String -> [String] -> [String]
addColumnToTheBeginning begColumn matrix = zipWith ((++).(:[])) begColumn matrix

addColumnToTheEnd :: [String] -> String -> [String]
addColumnToTheEnd matrix endColumn = zipWith (++) matrix (map (:[]) endColumn)

-- show :: SpiralMatrix -> String
-- show (Simple x) = Prelude.show x
-- show SpiralMatrix matrix
--     | not $ isReflected matrix = Prelude.show . firstRow $ matrix ++ "\n" ++ 

spiral :: Int -> [[Int]]
spiral size = error "You need to implement this function."
