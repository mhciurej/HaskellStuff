{-# LANGUAGE LambdaCase #-}

module Yacht (yacht, Category(..)) where

import Data.List.Utils (countElem)

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
countAndMultiply number = sum . map (\x -> if x == number then number else 0)

whatIsInFourCopies :: [Int] -> Int
whatIsInFourCopies dices = fst . head . filter ((>=4).snd) . zip [0..6] $ map (`countElem` dices) [0..6]

isCorrectYacht :: [Int] -> Bool
isCorrectYacht [a, b, c, d, e] = a == b && b == c && c == d && d == e
isCorrectYacht _ = False

yacht :: Category -> [Int] -> Int
yacht Ones = countAndMultiply 1
yacht Twos = countAndMultiply 2
yacht Threes = countAndMultiply 3
yacht Fours = countAndMultiply 4
yacht Fives = countAndMultiply 5
yacht Sixes = countAndMultiply 6
yacht FullHouse = sum
yacht FourOfAKind = countAndMultiply <$> whatIsInFourCopies <*> id
yacht LittleStraight = const 30
yacht BigStraight = const 30
yacht Choice = sum
yacht Yacht = (\case {True -> 50; False -> 0}) . isCorrectYacht
