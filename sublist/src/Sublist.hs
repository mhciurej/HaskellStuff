module Sublist (sublist) where

containsFromNow :: (Eq a) => [a] -> [a] -> Bool
containsFromNow _ [] = True
containsFromNow [] _ = False
containsFromNow (x:xs) (y:ys) = x == y && containsFromNow xs ys

contains :: (Eq a) => [a] -> [a] -> Bool
contains [] [] = True
contains [] _ = False
contains (x:xs) ys = containsFromNow (x:xs) ys || contains xs ys

sublist :: (Eq a) => [a] -> [a] -> Maybe Ordering
sublist xs ys = 
    case (contains xs ys, contains ys xs) of
        (True, True) -> Just EQ
        (True, False) -> Just GT
        (False, True) -> Just LT
        _ -> Nothing
