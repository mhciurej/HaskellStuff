module Acronym (abbreviate) where

import qualified Data.Text as T
import           Data.Text (Text)
import qualified Data.Char as C

abbreviateWord :: Text -> Text
abbreviateWord t
    | T.all C.isUpper t = T.take 1 t
    | otherwise = T.filter C.isUpper $ T.toUpper(T.take 1 t) <> T.tail t

unhyphenize :: Char -> Char
unhyphenize '-' = ' '
unhyphenize x = x

abbreviate :: Text -> Text
abbreviate = T.concat . map (abbreviateWord . T.filter C.isLetter) . T.words . T.map unhyphenize
