module POV (fromPOV, tracePathBetween) where

import Data.Tree (Tree (Node))

fromPOV :: Eq a => a -> Tree a -> Maybe (Tree a)
fromPOV x tree = error "You need to implement this function."

leaveAtADumbster :: Eq a => a -> Tree a -> Tree a
leaveAtADumbster choosenOne (Node rootLabel subForest) = Node rootLabel $ filter (checkIfNodesAreTheSame choosenOne) subForest
    where
        checkIfNodesAreTheSame :: Eq a => a -> Tree a -> Bool
        checkIfNodesAreTheSame toCompare (Node rootLabel _) = toCompare == rootLabel


tracePathBetween :: Eq a => a -> a -> Tree a -> Maybe [a]
tracePathBetween from to tree = error "You need to implement this function."




myTest :: [Bool]
myTest = [
        leaveAtADumbster 5 (Node 4 [Node 5 [Node 1 []], Node 6 [], Node 7 [Node 8 [], Node 9 []]]) == Node 4 [Node 6 [], Node 7 [Node 8 [], Node 9 []]]
        
    ]