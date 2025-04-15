{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Lib
    ( FibonacciHeap
    , empty
    , add
    , takeMin
    , deleteMin
    ) where

import           Data.Array.IArray ( Array )
import qualified Data.Array.IArray as A
import           Data.Maybe (catMaybes)
import           Data.List (delete)

data Node a = Node {
    degree :: Int,
    val :: a,
    children :: [Node a]
} deriving (Show, Eq)

instance Ord a => Ord (Node a) where
    compare :: Node a -> Node a -> Ordering
    compare (Node _ x _) (Node _ y _) = compare x y

newtype FibonacciHeap a = FibonacciHeap { nodes :: [Node a] }

arrayOfMaybes :: Array Int (Maybe (Node a))
arrayOfMaybes = A.listArray (0, 50) [Nothing | _ <- [0..50] :: [Int]]

singleton :: a -> Node a
singleton x = Node 1 x []

mergeNodes :: Ord a => Node a -> Node a -> Node a
mergeNodes n1@(Node d1 x1 c1) n2@(Node d2 x2 c2)
    | x1 < x2 = Node (d1 + 1) x1 (n2:c1)
    | x1 > x2 = mergeNodes n2 n1
    | d1 <= d2 = Node (d1 + 1) x1 (n2:c1)
    | otherwise = Node (d2 + 1) x2 (n1:c2)

empty :: FibonacciHeap a
empty = FibonacciHeap []

add :: Ord a => a -> FibonacciHeap a -> FibonacciHeap a
add x (FibonacciHeap []) = FibonacciHeap [singleton x]
add x (FibonacciHeap (y:ys)) = let xx = singleton x in
    FibonacciHeap ((min xx y):(max y xx):ys)

takeMin :: FibonacciHeap a -> Maybe a
takeMin (FibonacciHeap [] ) = Nothing
takeMin (FibonacciHeap (x:_)) = Just (val x)

moveMin :: Ord a => [a] -> [a]
moveMin [] = []
moveMin zs = let minVal = minimum zs in minVal : delete minVal zs

deleteMin :: forall a . Ord a => FibonacciHeap a -> FibonacciHeap a
deleteMin (FibonacciHeap []) = FibonacciHeap []
deleteMin (FibonacciHeap ((Node _ _ ys):xs)) = 
    FibonacciHeap (moveMin . catMaybes $ A.elems updatedNodes)
    where
        updatedNodes :: Array Int (Maybe (Node a))
        updatedNodes = foldr f arrayOfMaybes (ys ++ xs)
        f :: Node a -> Array Int (Maybe (Node a)) -> Array Int (Maybe (Node a))
        f (Node d z zs) l
            | Just node <- l A.! d = let
                newNode = mergeNodes (Node d z zs) node 
                newArr = l A.// [(d, Nothing)]
                in f newNode newArr
            | otherwise = l A.// [(d, Just (Node d z zs))]