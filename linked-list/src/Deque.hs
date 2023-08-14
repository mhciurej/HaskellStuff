{-# LANGUAGE Safe #-}
module Deque (Deque, mkDeque, pop, push, shift, unshift) where

import Control.Monad.State (State, put)

data Deque a = Deque [a] [a]

headMay :: [a] -> Maybe a
headMay [] = Nothing
headMay x = Just . head $ x

mkDeque :: State (Deque a) ()
mkDeque = do
    put $ Deque [] []
    return ()

pop :: Deque a -> State (Deque a) (Maybe a)
pop (Deque front back) = do
    put $ Deque (drop 1 (front ++ reverse back)) []
    return . headMay $ front

push :: Deque a -> a -> State (Deque a) ()
push (Deque front back) x = do
    put (Deque front (x:back))
    return ()

unshift :: Deque a -> a -> IO ()
unshift deque x = error "You need to implement this function."

shift :: Deque a -> IO (Maybe a)
shift deque = error "You need to implement this function."
