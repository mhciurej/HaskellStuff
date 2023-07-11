module Series (slices) where

sublists :: Int -> [a] -> [[a]]
sublists desiredLength list
    | desiredLength > length list = []
    | desiredLength == length list = [list]
    | otherwise = (take desiredLength list):(sublists desiredLength $ drop 1 list)

slices :: Int -> String -> [[Int]]
slices n xs = sublists n . map ((0+) . read) $ map (\x -> [x]) xs
