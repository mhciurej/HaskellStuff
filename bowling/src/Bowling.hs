module Bowling (score, BowlingError(..)) where

data BowlingError = IncompleteGame
                  | InvalidRoll { rollIndex :: Int, rollValue :: Int }
  deriving (Eq, Show)

roll :: Int -> Int
roll = id

score :: [Int] -> Either BowlingError Int
score = Right . sum . map roll 

