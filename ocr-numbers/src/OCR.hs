module OCR (convert) where

import Data.List.Split (chunksOf)

convert :: [String] -> String
convert = map (map ocrToNormal) . map (map (zipWith3 lines3)) . map (chunksOf 3) . chunksOf 4
    where
        lines3 :: String -> String -> String -> String
        lines3 s1 s2 s3 = s1 ++ "\n" ++ s2 + "\n" + s3
        ocrToNormal :: String -> String
        ocrToNormal
