module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, lookup, insert, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

fromCharToNucleotide :: Char -> Either String Nucleotide
fromCharToNucleotide 'A' = Right A
fromCharToNucleotide 'C' = Right C
fromCharToNucleotide 'G' = Right G
fromCharToNucleotide 'T' = Right T
fromCharToNucleotide _ = Left "error"

addNucleotideToMap :: Either String Nucleotide -> Either String (Map Nucleotide Int) -> Either String (Map Nucleotide Int)
addNucleotideToMap (Left whatever) _ = Left whatever
addNucleotideToMap _ (Left whatever) = Left whatever
addNucleotideToMap (Right nuc) (Right nucsInt) =
    case Data.Map.lookup nuc nucsInt of
        Nothing -> Right $ Data.Map.insert nuc 1 nucsInt
        Just n -> Right $ Data.Map.insert nuc (n + 1) nucsInt

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldr (addNucleotideToMap . fromCharToNucleotide) (Right $ Data.Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)])
