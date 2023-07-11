module Yacht (yacht, Category(..)) where

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

countAndMultiply :: Int -> [Int] -> Int
countAndMultiply number = (*number) $ foldr (\x -> if x == number then 1 else 0) 0 

yacht :: Category -> [Int] -> Int
yacht Ones dice = countAndMultiply 1 dice
yacht FullHouse dice = 
