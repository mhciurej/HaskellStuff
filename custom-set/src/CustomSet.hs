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

type CustomSet a = BinaryTree a

delete :: Ord a => a -> CustomSet a -> CustomSet a
delete = deleteFrom

difference :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
difference setA setB = foldr delete setA (toList setB)

empty :: CustomSet a
empty = Leaf

fromList :: Ord a => [a] -> CustomSet a
fromList = foldr insert empty

insert :: Ord a => a -> CustomSet a -> CustomSet a
insert = add

intersection :: CustomSet a -> CustomSet a -> CustomSet a
intersection setA setB = error "You need to implement this function."

isDisjointFrom :: CustomSet a -> CustomSet a -> Bool
isDisjointFrom setA setB = error "You need to implement this function."

isSubsetOf :: CustomSet a -> CustomSet a -> Bool
isSubsetOf setA setB = error "You need to implement this function."

member :: Ord a => a -> CustomSet a -> Bool
member = find

null :: CustomSet a -> Bool
null Leaf = True
null _ = False

size :: CustomSet a -> Int
size Leaf = 0
size (Node _ left right) = 1 + size left + size right

toList' :: CustomSet a -> [a] -> [a]
toList' Leaf acc = acc
toList' (Node root Leaf Leaf) acc = root:acc
toList' (Node root left right) acc = toList' left . (root:) . toList' right $ acc

toList :: CustomSet a -> [a]
toList set = toList' set []

union :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
union Leaf setB = setB
union (Node root left right) setB = union left . union right $ insert root setB
