module ProteinTranslation(proteins) where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.List.Split (chunksOf)

sequenceToProtein :: Map String String
sequenceToProtein = Map.fromList [
        ("AUG", "Methionine"),
        ("UUU", "Phenylalanine"),
        ("UUC", "Phenylalanine"),
        ("UUA", "Leucine"),
        ("UUG", "Leucine"),
        ("UCU", "Serine"),
        ("UCC", "Serine"),
        ("UCA", "Serine"),
        ("UCG", "Serine"),
        ("UAU", "Tyrosine"),
        ("UAC", "Tyrosine"),
        ("UGU", "Cysteine"),
        ("UGC", "Cysteine"),
        ("UGG", "Tryptophan"),
        ("UAA", "STOP"),
        ("UAG", "STOP"),
        ("UGA", "STOP")
    ]

proteins :: String -> Maybe [String]
proteins = foldr f (Just []) . takeWhile (/= Just "STOP") . map (`Map.lookup` sequenceToProtein) . chunksOf 3
    where
        f :: Maybe String -> Maybe [String] -> Maybe [String]
        f (Just something) (Just list) = Just (something:list)
        f Nothing _ = Nothing
        f _ Nothing = Nothing