module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Leaf | BST a (BST a) (BST a) deriving (Show, Eq)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Leaf = Nothing
bstLeft (BST _ l _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Leaf = Nothing
bstRight (BST _ _ r) = Just r

bstValue :: BST a -> Maybe a
bstValue Leaf = Nothing
bstValue (BST x _ _) = Just x

empty :: BST a
empty = Leaf

fromList :: Ord a => [a] -> BST a
fromList [] = Leaf
fromList xs = helper xs Leaf
    where
        helper :: Ord a => [a] -> BST a -> BST a
        helper [] t = t 
        helper (z:zs) t = helper zs $ insert z t

insert :: Ord a => a -> BST a -> BST a
insert x Leaf = singleton x
insert x (BST n l r)
    | x <= n = BST n (insert x l) r
    | otherwise = BST n l (insert x r)

singleton :: a -> BST a
singleton x = BST x Leaf Leaf

toList :: BST a -> [a]
toList Leaf = []
toList (BST x l r) = toList l ++ (x:toList r)
