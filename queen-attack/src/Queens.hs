module Queens (boardString, canAttack) where

import Data.List ( intersperse )

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines . map (Data.List.intersperse ' ' . row) $ [0..7]
    where
        row :: Int -> [Char]
        row n = map (square n) [0..7]

        square :: Int -> Int -> Char
        square x y
            | Just (x, y) == white = 'W'
            | Just (x, y) == black = 'B'
            | otherwise = '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1, y1) (x2, y2)
    | x1 == x2 = True
    | y1 == y2 = True
    | otherwise = abs (x1 - x2) == abs (y1 - y2)


