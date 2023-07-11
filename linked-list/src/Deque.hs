module Deque (Deque, mkDeque, pop, push, shift, unshift) where

data Deque a = Empty | Node a (Deque a) (Deque a)

mkDeque :: IO (Deque a)
mkDeque = error "You need to implement this function."

pop :: Deque a -> IO (Maybe a)
pop deque = error "You need to implement this function."

push :: Deque a -> a -> IO ()
push deque x = error "You need to implement this function."

unshift :: Deque a -> a -> IO ()
unshift Empty x = return (Node x Empty Empty)

shift :: Deque a -> IO (Maybe a)
shift deque = error "You need to implement this function."
