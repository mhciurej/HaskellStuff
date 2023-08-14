{-# LANGUAGE Safe #-}
module Spiral (spiral) where

-- to review

data SpiralMatrix = Empty | Simple Int | SpiralMatrix {
        dimension :: Int,
        firstRow :: [Int],
        lastColumn :: [Int],
        lastRow :: [Int],
        firstColumn :: [Int],
        rest :: SpiralMatrix
    } deriving(Show)

makeMatrix :: Int -> Int -> SpiralMatrix
makeMatrix start end
    | start == end = Simple start
    | otherwise = let
        dim = round . sqrt . fromIntegral $ end - start + 1
        in
        case dim of
            2 ->
                SpiralMatrix {
                    dimension = 2,
                    firstRow = [start, start + 1],
                    lastColumn = [],
                    lastRow = [start + 3, start + 2],
                    firstColumn = [],
                    rest = Empty
                }
            _ ->
                SpiralMatrix {
                    dimension = dim,
                    firstRow = [start..start + dim - 1],
                    lastColumn = [start+dim..start + dim*2 - 3],
                    lastRow = [start + dim*3 - 3,start + dim*3 - 4..start + 2*dim - 2],
                    firstColumn = [start + dim*4 - 5,start + dim*4 - 6..start + dim * 3 - 2],
                    rest = makeMatrix (start + dim*4 - 4) end
                }

nthRow :: SpiralMatrix -> Int -> [Int]
nthRow Empty _ = []
nthRow (Simple v) _ = [v]
nthRow (SpiralMatrix { firstRow = first }) 1 = first
nthRow (SpiralMatrix { dimension = n1, lastRow = lt }) n2 | n1 == n2 = lt
nthRow (SpiralMatrix { firstColumn = first, lastColumn = lt, rest = rt}) n =
    [first !! (n - 2)] ++ nthRow rt (n - 1) ++ [ lt !! (n - 2)]

spiral :: Int -> [[Int]]
spiral 0 = []
spiral n = map (nthRow (makeMatrix 1 (n*n))) [1..n]
