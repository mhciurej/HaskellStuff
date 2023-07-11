{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}

module Bob (responseFor) where

import Data.Text (Text, strip, unsnoc)
import qualified Data.Text as Text
import Data.Char (isLetter, isLower)

responseFor :: Text -> Text
responseFor (strip -> query)
  | isSilent = "Fine. Be that way!"
  | isQuestion && isYelled = "Calm down, I know what I'm doing!"
  | isQuestion = "Sure."
  | isYelled = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    isSilent = Text.null query
    isQuestion = (snd <$> unsnoc query) == Just '?'
    isYelled = Text.any isLetter query && not (Text.any isLower query)