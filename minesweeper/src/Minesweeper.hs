module Minesweeper (annotate) where
import Prelude hiding (Left, Right)

blankLine :: [String] -> String
blankLine board = replicate (length . head $ board) ' '

addAtTheEnd :: a -> [a] -> [a]
addAtTheEnd x = reverse . (x:) . reverse

data HorizontalDirections = Down | StayH | Up deriving Eq
data VerticalDirections = Left | StayV | Right deriving Eq

moveHorizontally :: HorizontalDirections -> [String] -> [String]
moveHorizontally Down board = tail $ addAtTheEnd (blankLine board) board
moveHorizontally StayH board = board
moveHorizontally Up board = init $ blankLine board:board

moveVertically :: VerticalDirections -> [String] -> [String]
moveVertically Left = map (init . (' ':))
moveVertically StayV = id
moveVertically Right = map (tail . addAtTheEnd ' ')

moves :: HorizontalDirections -> VerticalDirections -> [String] -> [String]
moves StayH StayV = map (map (const '0'))
moves hor ver = moveHorizontally hor . moveVertically ver

mapper :: [String] -> [[Int]]
mapper = map (map (\x -> if x == '*' then 1 else 0))

allMoves :: [String] -> [[[Int]]]
allMoves board = [mapper $ moves h v board | 
                    h <- [Down, StayH, Up], v <- [Left, StayV, Right], (h, v) /= (StayH, StayV)]

reversedMapper :: Int -> Char
reversedMapper 0 = ' '
reversedMapper n = head . show $ n

annotate :: [String] -> [String]
annotate [] = []
annotate board =
    let
        sumLists :: [Int] -> [Int] -> [Int]
        sumLists = zipWith (+)
        sumTwoBoards :: [[Int]] -> [[Int]] -> [[Int]]
        sumTwoBoards = zipWith sumLists
        sumAllBoards :: [[[Int]]] -> [[Int]]
        sumAllBoards = foldr1 sumTwoBoards
    in
        zipWith (zipWith (\x y -> if x == '*' then x else y)) board .
            map (map reversedMapper). sumAllBoards . allMoves $ board