module Isogram (isIsogram) where

import qualified Data.Text as T
import           Data.Text (Text)
import qualified Data.Set as S
import           Data.Set (Set)
import Data.Maybe as Ma (isJust)
import Data.Char (isLetter)

insertIfNotPresent :: Char -> Set Char -> Maybe (Set Char)
insertIfNotPresent = S.alterF (\present -> if present then Nothing else Just True)

isIsogram :: Text -> Bool
isIsogram =
    Ma.isJust . T.foldr (\char mmap -> mmap >>= insertIfNotPresent char) (Just S.empty) .
        T.toLower . T.filter isLetter
