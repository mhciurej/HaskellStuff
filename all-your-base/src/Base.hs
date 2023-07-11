module Base (Error(..), rebase) where

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

powers :: Integral a => a -> [a]
powers x = 1:map (x*) (powers x)

number :: Integral a => a -> [a] -> a
number inputBase inputDigits = sum $ zipWith (*) (reverse inputDigits) (powers inputBase)

toNewBase :: Integral a => a -> a -> [a]
toNewBase newBase number = zipWith (-) remainings (0:remainings)
    where
        remainings = takeWhile (>0) $ map (number `rem`) (tail $ powers newBase)

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase 0 _ _ = Left InvalidInputBase
rebase 1 _ _ = Left InvalidInputBase
rebase _ 0 _ = Left InvalidOutputBase
rebase _ 1 _ = Left InvalidOutputBase
rebase inputBase outputBase inputDigits = Right . reverse . toNewBase outputBase $ number inputBase inputDigits