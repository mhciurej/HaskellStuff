{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ScopedTypeVariables #-}

module ETL (transform) where

import qualified Data.Text as T
import           Data.Text (Text)
import Data.Map (Map)
import qualified Data.Map as M
import Data.Bifunctor (second)

transform :: forall a. Map a Text -> Map Char a
transform = M.fromList . concatMap ((\(a_, str) -> map (, a_) (T.unpack str)) . Data.Bifunctor.second T.toLower) . M.toList
