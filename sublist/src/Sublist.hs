module Sublist (sublist) where

areListsEqual :: (Eq a) => [a] -> [a] -> Bool
areListsEqual [] [] = True
areListsEqual (x:xs) (y:ys) = x == y && areListsEqual xs ys

contains :: (Eq a) => [a] -> [a] -> Bool
contains (x:xs) ys = all (== True) . zipWith (==) (x:xs) ys or contains 

sublist :: (Eq a) => [a] -> [a] -> Maybe Ordering
sublist (x:xs) (y:ys) = 
    let
        lengthFirst = length (x:xs)
        lengthSecond = length (y:ys)
    in 
    | areListsEqual (x:xs) (y:ys) = Just EQ
    | 
    case (isSublist xs ys, isSublist ys xs) of
        (True, True) -> Just EQ
        (True, False) -> Just LT
        (False, True) -> Just GT
        _ -> Nothing
    where
        