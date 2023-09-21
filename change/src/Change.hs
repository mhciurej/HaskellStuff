{-# LANGUAGE TupleSections #-}
{-# LANGUAGE Safe #-}
module Change (findFewestCoins) where

import Data.Map (Map, fromList, (!), insert)
import Data.List.NonEmpty (NonEmpty( (:|) ), toList)
import qualified Data.List.NonEmpty as NE
import Data.Maybe (mapMaybe)
import Data.List.NonEmpty.Extra (minimumOn1, nonEmpty)
import Data.Foldable (foldl')
--import Control.Monad (guard)
--import Data.Functor (($>))

type Change = [Integer]

initMap :: Integer -> Map Integer (Maybe Change)
initMap theSmallestCoin = fromList $ (0, Just []):map (, Nothing) [1..theSmallestCoin-1]

dynamicalMap :: Integer -> NonEmpty Integer -> Map Integer (Maybe Change)
dynamicalMap target coins@(c :| _) = foldl' dynamiclyCalculateChange (initMap starting) [starting..target]
    where
        starting = c :: Integer
        dynamiclyCalculateChange :: Map Integer (Maybe Change) -> Integer -> Map Integer (Maybe Change)
        dynamiclyCalculateChange currentMap change =
            insert change (minimumOn1 (length <$>) =<< (nonEmpty . mapMaybe useCoin . toList $ coins)) currentMap
            where
                useCoin :: Integer -> Maybe (Maybe Change)
                useCoin coin
                    -- = guard (coin <= change) $> ((coin:) <$> (currentMap ! (change - coin)))
                    | coin > change = Nothing
                    | otherwise = Just . (coin:) <$> (currentMap ! (change - coin))

findFewestCoins :: Integer -> [Integer] -> Maybe Change
findFewestCoins 0 _ = Just []
findFewestCoins _ [] = Nothing
findFewestCoins target (c:oins)
    | target < 0 = Nothing
    | s > target = Nothing
    | otherwise = dynamicalMap target sorted ! target
        where
            sorted@(s :| _) = NE.sort (c :| oins)
