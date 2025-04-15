{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Data.Maybe        (catMaybes, isJust)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFailFast, defaultConfig, hspecWith)
import Data.PQueue.Min   (fromList, toList)
import Lib

main :: IO ()
main = hspecWith defaultConfig {configFailFast = False} specs

specs :: Spec
specs = describe "Does new queue behave like old one" $ for_ cases test
  where
    test Case{..} = it description $ 
        (takeValues $ foldr add empty numbers) 
        `shouldBe` 
        (toList $ fromList numbers)
    takeValues :: FibonacciHeap Int -> [Int]
    takeValues h = catMaybes . takeWhile isJust $ (takeMin h) : (map Just $ takeValues (deleteMin h))
    

data Case = Case { description :: String
                 , numbers     :: [Int]
                 }

cases :: [Case]
cases = [ Case { description = "empty", numbers = [] }
        , Case { description = "one element", numbers = [1] }
        , Case { description = "two elements in order", numbers = [1, 2] }
        , Case { description = "two elements not in order", numbers = [2, 1] }
        , Case { description = "five elements", numbers = [-1, 5, -30, 20, 0] }
        ]