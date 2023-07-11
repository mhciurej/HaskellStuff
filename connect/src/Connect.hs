module Connect (Mark(..), winner) where
import Data.Graph (Graph)
import Data.Map (Map)

data Mark = Cross | Nought deriving (Eq, Show)
type Position = (Int, Int)
data Colour = Blank | Red | Green deriving (Eq, Show)
data Vertex = Vertex { sign :: Char, colour :: Colour, neighbours :: [Position] } deriving (Eq, Show)
data Graph = Map Position Vertex

transformLine :: (Int, [Char]) -> [Vertex]
transformLine (x, chars) =
    foldr (\(n, char) acc -> Vertex {sign = char, colour = Blank, neighbors = []} :acc) [] (enumerate ys)

winner :: [String] -> Maybe Mark
winner board = let 
    clearInput = map (filter (/= ' ')) board :: [String]
    size = length clearInput :: Int
    graph = 
    in 
