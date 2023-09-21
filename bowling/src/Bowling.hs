module Bowling (score, BowlingError(..)) where

import Data.List.Utils (countElem)
import Control.Monad ( zipWithM )

data BowlingError = IncompleteGame | InvalidRoll { rollIndex :: Int, rollValue :: Int } deriving (Eq, Show)

data CountingPoints = Open | Spare | 

isGameComplete :: [Int] -> Either BowlingError [Int]
isGameComplete rolls = if countElem 10 rolls + length rolls < 20 then  Left IncompleteGame else Right rolls

areNumbersCorrect :: [Int] -> Either BowlingError [Int]
areNumbersCorrect rolls = zipWithM f rolls [0..]
  where
    f :: Int -> Int -> Either BowlingError Int
    f x pos
      | x `notElem` [0..10] = Left $ InvalidRoll pos x
      | otherwise = Right x



score :: [Int] -> Either BowlingError Int
score =  =<< areNumbersCorrect =<< isGameComplete =<< Right

