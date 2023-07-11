module WordCount (wordCount) where

import Data.List ( group, sort )
import Data.Char ( toLower )
import Data.List.Split ( splitOneOf )

removeSingleQuotationsFrom :: String -> String
removeSingleQuotationsFrom str = if last str == '\'' && head str == '\'' then init . tail $ str else str

sortedWords = group . sort . map removeSingleQuotationsFrom . map (map toLower) . filter (/= "") . splitOneOf ",.\n !&@$%^&:"

wordCount :: String -> [(String, Int)]
wordCount = map (\list -> (head list, length list)) . sortedWords


