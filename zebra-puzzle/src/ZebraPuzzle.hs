module ZebraPuzzle (Resident(..), Solution(..), solve) where

data Resident = Englishman | Spaniard | Ukrainian | Norwegian | Japanese deriving (Eq, Show)
data House = Red | Green | Yellow | Blue | Ivory
data Beverage = Coffee | Tea | OrangeJuice | Water | Milk
data Cigaret = OldGold | Kools | Chesterfields | LuckyStrike | Parliaments
data Pet = Dog | Snail | Fox | Horse | Zebra

type UnaryPredicate = (Resident, House, Beverage, Cigaret, Pet) -> Bool

data Solution = Solution { waterDrinker :: Resident, zebraOwner :: Resident } deriving (Eq, Show)

possibilities :: [(Resident, House, Beverage, Cigaret, Pet)]
possibilities = 
    (,,,,) <$> [Englishman, Spaniard, Ukrainian, Norwegian, Japanese]
    <*> [Red, Green, Yellow, Blue, Ivory]
    <*> [Coffee, Tea, OrangeJuice, Water, Milk]
    <*> [OldGold, Kools, Chesterfields, LuckyStrike, Parliaments]
    <*> [Dog, Snail, Fox, Horse, Zebra]

p2 :: UnaryPredicate
p2 (Englishman, Red, _, _, _) = True
p2 (Englishman, _, _, _, _) = False
p2 (_, Red, _, _, _) = False
p2 _ = True

p3 


solve :: Solution
solve = error "You need to implement this function."
