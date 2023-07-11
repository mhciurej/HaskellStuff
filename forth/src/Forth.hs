{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}


module Forth
  ( ForthError(..)
  , ForthState
  , evalText
  , toList
  , emptyState
  ) where

import Data.Text (Text)
import qualified Data.Map as M
import qualified Data.Text as T
import qualified Data.Char as C

data ForthError
     = DivisionByZero
     | StackUnderflow
     | InvalidWord
     | UnknownWord Text
     deriving (Show, Eq)

data Operation
  = Addition
  | Substraction
  | Multiplication
  | Division
  | DUP
  | DROP
  | SWAP
  | OVER
  | DEF
  deriving (Show, Eq)

data ForthObject = Number Int | Operation | Custom Text

data ForthState = State [Operation] (Map Text ForthObject)

emptyState :: ForthState
emptyState = State [] Map.empty

isNumber :: Text -> Bool
isNumber = all C.isDigit 

converter :: Text -> Operation
converter "+" = Addition
converter "-" = Substraction
converter "*" = Multiplication
converter "/" = Division
converter "DUP" = DUP
converter "DROP" = DROP
converter "SWAP" = SWAP
converter "OVER" = OVER
converter (isNumber s -> True) = Number . foldl' (\acc n -> acc*10 + n) 0 . T.map digitToInt $ s
converter ":" = Just DEF 
converter s = Custom s

eval :: Either ForthError ForthState -> Either ForthError ForthState
eval (Left err) = Left err
eval (Right )

evalText :: Text -> ForthState -> Either ForthError ForthState
evalText text stack =  . map converter . reverse $ T.words text

toList :: ForthState -> [Int]
toList stack = error "You need to implement this function."
