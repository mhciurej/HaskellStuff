module School (School, add, empty, grade, sorted) where

import Data.Map (Map, insertWith, assocs)
import qualified Data.Map as Map
import Data.List (sort)

type School = Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student = insertWith (++) gradeNum [student]

empty :: School
empty = Map.empty

grade :: Int -> School -> [String]
grade gradeNum school = maybe [] sort (Map.lookup gradeNum school)

sorted :: School -> [(Int, [String])]
sorted = map (\(i, l) -> (i, sort l)) . assocs
