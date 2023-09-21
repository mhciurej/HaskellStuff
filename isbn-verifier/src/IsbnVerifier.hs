module IsbnVerifier (isbn) where

-- (x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) mod 11 == 0

isbn :: String -> Bool
isbn = (0 ==) . (`rem` 11) . isbnControlSum . map (\x -> read [x] :: Integer) . filter (/= '-')


isbnControlSum :: [Integer] -> Integer
isbnControlSum [x1, x2, x3, x4, x5, x6, x7, x8, x9, x10] =
    x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10
isbnControlSum _ = 1