module CustomSet
  ( delete
  , difference
  , empty
  , fromList
  , insert
  , intersection
  , isDisjointFrom
  , isSubsetOf
  , member
  , null
  , size
  , toList
  , union
  ) where

import Prelude hiding (null)

data BinaryTree a = Leaf | Node a (BinaryTree a) (BinaryTree a) deriving (Eq, Show)
add :: Ord a => a -> BinaryTree a -> BinaryTree a
add toAdd Leaf = Node toAdd Leaf Leaf
add toAdd tree@(Node root left right)
  | root == toAdd = tree
  | toAdd < root = Node root (add toAdd left) right
  | toAdd > root = Node root left $ add toAdd right
deleteFrom :: Ord a => a -> BinaryTree a -> BinaryTree a
deleteFrom _ Leaf = Leaf
deleteFrom toDelete (Node root left right)
  | toDelete < root = Node root (deleteFrom toDelete left) right
  | toDelete > root = Node root left $ deleteFrom toDelete right
  --now, toDelete == root
  | left == Leaf && right == Leaf = Leaf --useless but improves readibility
  | left == Leaf = right
  | right == Leaf = left
find :: Ord a => a -> BinaryTree a -> Bool
find toFind Leaf = False
find toFind (Node root left right)
  | toFind == root = True
  | toFind < root = find toFind left
  | toFind > root = find toFind right

newtype CustomSet a = CustomSet (BinaryTree a) deriving (Eq, Show)

delete :: a -> CustomSet a -> CustomSet a
delete x (CustomSet set) = CustomSet $ deleteFrom x set

difference :: CustomSet a -> CustomSet a -> CustomSet a
difference setA setB = error "You need to implement this function."

empty :: CustomSet a
empty = CustomSet Leaf

fromList :: [a] -> CustomSet a
fromList xs = error "You need to implement this function."

insert :: a -> CustomSet a -> CustomSet a
insert x set = error "You need to implement this function."

intersection :: CustomSet a -> CustomSet a -> CustomSet a
intersection setA setB = error "You need to implement this function."

isDisjointFrom :: CustomSet a -> CustomSet a -> Bool
isDisjointFrom setA setB = error "You need to implement this function."

isSubsetOf :: CustomSet a -> CustomSet a -> Bool
isSubsetOf setA setB = error "You need to implement this function."

member :: a -> CustomSet a -> Bool
member x set = error "You need to implement this function."

null :: CustomSet a -> Bool
null set = error "You need to implement this function."

size :: CustomSet a -> Int
size set = error "You need to implement this function."

toList :: CustomSet a -> [a]
toList set = error "You need to implement this function."

union :: CustomSet a -> CustomSet a -> CustomSet a
union setA setB = error "You need to implement this function."
