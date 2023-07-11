{-# LANGUAGE ViewPatterns #-}

module Anagram (anagramsFor) where

import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.Text (Text, unpack, toCaseFold)

anagramsFor :: Text -> [Text] -> [Text]
anagramsFor = filter . areAnagrams
    where
        toMultiSet :: Text -> MultiSet Char
        toMultiSet = MultiSet.fromList . unpack
        areAnagrams :: Text -> Text -> Bool
        areAnagrams (toCaseFold -> first) (toCaseFold -> second) = 
            first /= second && toMultiSet first == toMultiSet second