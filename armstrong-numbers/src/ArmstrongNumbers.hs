module ArmstrongNumbers (armstrong) where

armstrong :: Integral a => a -> Bool
armstrong n = (fromIntegral n) == sum [x ^ numberLength | x <- [read y :: Int | y <- [[z] | z <- show $ fromIntegral n]]]
    where numberLength = length [[z] | z <- show $ fromIntegral n]
