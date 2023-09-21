module Frequency (frequency) where

import Data.Char
import Data.Map  (Map)
import qualified Data.Map as M
import Data.Text (Text)
import qualified Data.Text as T
import Control.Parallel.Strategies
import Data.Foldable (foldl')

--to review

countLetters :: Text -> Map Char Int
countLetters = T.foldl' f M.empty
    where
        f :: Map Char Int -> Char -> Map Char Int
        f acc letter = M.insertWith (+) letter 1 acc

frequency :: Int -> [Text] -> Map Char Int
frequency nWorkers =
    foldl' (M.unionWith (+)) M.empty . runEval . parListChunk nWorkers rdeepseq . map (countLetters . T.map toLower . T.filter isLetter)

-- frequency :: Int -> [Text] -> Map Char Int
-- frequency _ = foldl' (M.unionWith (+)) M.empty . map (countLetters . T.map toLower . T.filter isLetter)