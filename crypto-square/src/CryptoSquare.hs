module CryptoSquare (encode) where

import qualified Data.Text as T
import           Data.Text (Text)
import Data.List.Split (chunksOf)

removePanctuation :: Text -> Text
removePanctuation = T.filter (`notElem` " .,-@#!?%")

findCR :: Int -> (Int, Int)
findCR n = head [(c, r) | r <- [1..n], c <- [r,r+1], c*r >= n]

encode :: String -> String
encode "" = ""
encode word = let
    cleanedWord = T.unpack .T.toLower . removePanctuation. T.pack $ word
    size = length cleanedWord
    (c, _) = findCR size
    matrix = chunksOf c cleanedWord
    spaceAdjustedMatrix = init matrix ++ [take c $ last matrix ++ replicate c ' ']
    in init . T.unpack.  T.concat . map (`T.snoc` ' ') . T.transpose . map T.pack $ spaceAdjustedMatrix

