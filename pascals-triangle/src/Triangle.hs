module Triangle (rows) where

rows :: Int -> [[Integer]]
rows 0 = []
rows 1 = [[1]]
rows 2 = [[1], [1, 1]]
rows n = rows (n - 1) ++ [zipWith (+) (0:lastRow) (lastRow ++ [0])]
    where
        lastRow = last . rows $ n - 1
