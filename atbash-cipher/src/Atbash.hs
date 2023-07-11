module Atbash (decode, encode) where

import qualified Data.Text as T
import           Data.Text (Text)
import qualified Data.Map as M
import           Data.Map (Map)
import           Data.Char (isAlphaNum)

cypherMap :: Map Char Char
cypherMap = M.fromList $ zip ['a'..'z'] ['z','y'..'a'] ++ zip " :.,\'?-" " :.,\'?-" ++ zip ['0'..'9'] ['0'..'9']

decode :: Text -> Text
decode = T.map (cypherMap M.!) . T.toLower . T.filter isAlphaNum

encode :: Text -> Text
encode = T.tail . T.concat  . map (T.cons ' ') . T.chunksOf 5 . T.map (cypherMap M.!) . T.toLower . T.filter isAlphaNum