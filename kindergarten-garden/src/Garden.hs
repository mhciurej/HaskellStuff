module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import Data.Map (Map, (!), fromList)
import Data.List.Split (chunksOf)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

type Student = String
type Plants = [Plant]

type Garden = Map Student Plants

toPlant :: Char -> Plant
toPlant 'C' = Clover
toPlant 'G' = Grass
toPlant 'R' = Radishes
toPlant 'V' = Violets
toPlant _ = error "wrong plant"

garden :: [Student] -> String -> Garden
garden students = fromList . zip students . (zipWith (++) <$> head <*> last) . map (chunksOf 2 . map toPlant) . words

lookupPlants :: Student -> Garden -> Plants
lookupPlants = flip (!)
