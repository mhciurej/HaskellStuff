module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ z [] = z
foldl' f z (x:xs) = (f z x) `seq` foldl' f (f z x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs

reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

map :: (a -> b) -> [a] -> [b]
map f xs = [f $ x | x <- xs]

filter :: (a -> Bool) -> [a] -> [a]
filter p xs = [x | x <- xs, p $ x]

(++) :: [a] -> [a] -> [a]
xs ++ [] = xs
[] ++ ys = ys
(x:xs) ++ ys = x:(xs ++ ys)

concat :: [[a]] -> [a]
concat [] = []
concat (x:xs) = x ++ (concat xs)
