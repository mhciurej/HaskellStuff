module RotationalCipher (rotate) where

import qualified Data.Map as M
import           Data.Map (Map)

rotateList :: Int -> [a] -> [a]
rotateList = drop <> take

makeCypherMap :: Int -> Map Char Char
makeCypherMap n = let 
    small = M.fromList . zip ['a'..'z'] . rotateList n $ ['a'..'z']
    capital = M.fromList . zip ['A'..'Z'] . rotateList n $ ['A'..'Z']
    numbers = M.fromList $ zip ['0'..'9'] ['0'..'9']
    punction = M.fromList $ zip ",.?!' "    ",.?!' "
    in small `M.union` capital `M.union` numbers `M.union` punction

rotate :: Int -> String -> String
rotate n = map (makeCypherMap n M.!)
