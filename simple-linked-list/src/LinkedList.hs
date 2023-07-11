{-# LANGUAGE InstanceSigs #-}
module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

--TO DO to mentoring

data LinkedList a = Empty | Value a (LinkedList a) deriving(Eq, Show)

instance Foldable LinkedList where
    foldr :: (a -> b -> b) -> b -> LinkedList a -> b
    foldr _ acc Empty = acc
    foldr f acc (Value x rest) = f x (foldr f acc rest)
    foldl :: (b -> a -> b) -> b -> LinkedList a -> b
    foldl _ acc Empty = acc
    foldl f acc (Value x rest) = foldl f (f acc x) rest

datum :: LinkedList a -> a
datum Empty = error "impossible operation"
datum (Value x _) = x

fromList :: [a] -> LinkedList a
fromList = foldr Value Empty

isNil :: LinkedList a -> Bool
--isNil = (Empty ==) 
isNil Empty = True
isNil _ = False


new :: a -> LinkedList a -> LinkedList a
new = Value

next :: LinkedList a -> LinkedList a
next Empty = error "impossible operation"
next (Value _ rest) = rest

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList linkedList = helper linkedList Empty
    where
        helper :: LinkedList a -> LinkedList a -> LinkedList a
        helper Empty acc = acc
        helper (Value x rest) acc = helper rest (Value x acc)
        -- shouldn't I use strict evaluation?

toList :: LinkedList a -> [a]
toList Empty = []
toList (Value x rest) = x:toList rest
