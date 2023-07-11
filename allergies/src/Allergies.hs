module Allergies (Allergen(..), allergies, isAllergicTo) where

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Enum, Show)

allergenToInt :: Allergen -> Int
allergenToInt Eggs = 1
allergenToInt someAllergen = (*2) . allergenToInt . pred $ someAllergen

allergies :: Int -> [Allergen]
allergies score
    | score > 256 = allergies $ score `mod` 256
    | otherwise = filter (`isAllergicTo` score) [Eggs .. Cats]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = score `mod` (2 * allergenToInt allergen) >= allergenToInt allergen
