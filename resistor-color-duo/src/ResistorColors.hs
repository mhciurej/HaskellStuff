module ResistorColors (Color(..), value) where

import Test.QuickCheck 

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Show, Enum, Bounded)

value :: (Color, Color) -> Int
value (a, b) = 10 * fromEnum a + fromEnum b

--prop_idempotent xs = qsort (qsort xs) == qsort xs
prop_more_then_ten (x, y) = x /= Black ==> value (x, y) >= 10

prop_reverse (x, y) = show (value (x, y)) == reverse(show (value (y, x)))
