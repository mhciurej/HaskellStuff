module Base (Error(..), rebase) where

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a deriving (Show, Eq)

powers :: Integral a => a -> [a]
powers x = 1:map (x*) (powers x)

number :: Integral a => a -> [a] -> a
number inputBase inputDigits = sum $ zipWith (*) (reverse inputDigits) (powers inputBase)

toNewBase :: Integral a => a -> a -> [a]
toNewBase newBase n = map toDigit $ zipWith (-) remainings (tail remainings ++ [0])
    where
        remainings = (n:) . reverse . takeWhile (< n) $ map (n `rem`) (tail $ powers newBase)
        toDigit k
            | k >= newBase = toDigit (k `div` newBase)
            | otherwise = k

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase inputBase outputBase inputDigits
    | inputBase < 2 = Left InvalidInputBase
    | outputBase < 2 = Left InvalidOutputBase
    | not . null $  strangeDigits = let x:_ = strangeDigits in Left (InvalidDigit x)
    | otherwise = Right $ if answer == [0] then [] else answer
        where
            answer = toNewBase outputBase $ number inputBase inputDigits
            strangeDigits = filter ((||) <$> (<0) <*> (>= inputBase)) inputDigits