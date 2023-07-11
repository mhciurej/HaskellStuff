{-# LANGUAGE OverloadedStrings #-}
module Raindrops (convert) where

import qualified Data.Text as T
import           Data.Text (Text, pack, empty)

convert :: Int -> Text
convert n = handleEmptyString . decide 7 "Plong" . decide 5 "Plang" $ decide 3 "Pling" empty
    where
        decide :: Int -> Text -> Text -> Text
        decide divisor toAdd
            | n `mod` divisor == 0 = (<> toAdd)
            | otherwise = id
        handleEmptyString :: Text -> Text
        handleEmptyString someWords
            | T.null someWords = pack . show $ n
            | otherwise = someWords

