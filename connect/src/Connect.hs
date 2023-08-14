module Connect (Mark(..), winner) where

import Data.Map (Map, insert, empty)
import Sound.Tidal.Utils (enumerate)

data Mark = Cross | Nought | Blank deriving (Eq, Show)
type Position = (Int, Int)
data Vertex =
    Vertex {
        sign :: Mark,
        visited :: Bool,
        visitedNeighbours :: [Position]
    } deriving (Eq, Show)
data Graph = Map Position Vertex

prepareGraph :: [String] -> Graph
prepareGraph = 
    foldr (\(v, p) g -> insert p v g) empty .
    concatMap (map makeVertexWithPosition) .
    map (\(y, fields) -> map (\(x, field) -> (x, y, field)) $ map enumerate fields) .
    enumerate
    where
        charToMark :: Char -> Mark
        charToMark '.' = Blank
        charToMark 'x' = Cross
        charToMark 'o' = Nought
        makeVertexWithPosition :: (Int, Int, Char) -> (Vertex, Position)
        makeVertexWithPosition (x, y, field) =
            (Vertex {sign = charToMark field, visited = false, visitedNeighbours = []}, (x, y))

determineNeighbours x y = 
    [(x + 1, y), ] 

winner :: [String] -> Maybe Mark
winner board = let 
    clearInput = map (filter (/= ' ')) board :: [String]
    size = length clearInput :: Int
    graph = 
    in 
