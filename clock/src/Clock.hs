module Clock (addDelta, fromHourMin, toString) where

data CyclicObject a = CyclicObject {value :: a, limit :: a} deriving Eq
defaultCyclic :: Integral a => a -> CyclicObject a
defaultCyclic lim = CyclicObject {value = 0, limit = lim}
increase :: Integral a => CyclicObject a -> a -> (a, CyclicObject a)
increase cyclical toAdd = let
  rawSum = value cyclical + toAdd
  ultimateValue = rawSum `mod` limit cyclical
  rest = rawSum `div` limit cyclical
  in (rest, cyclical {value = ultimateValue})
show :: Show a => CyclicObject a -> String
show cyclical = (Prelude.show . value $ cyclical)

data Clock = Clock {hours :: CyclicObject Int, minutes :: CyclicObject Int} deriving Eq
defaultClock :: Clock
defaultClock = Clock {hours = defaultCyclic 24, minutes = defaultCyclic 60}

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = addDelta hour min defaultClock

toString :: Clock -> String
toString clock = (twoDigits . Clock.show . hours $ clock) ++ ":" ++ (twoDigits . Clock.show . minutes $ clock)
  where
    twoDigits :: String -> String
    twoDigits toConvert = (if (length toConvert) == 1 then "0" else "") ++ toConvert

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = let
  (h, newMinutes) = increase (minutes clock) min
  (_, newHours) = increase (hours clock) (hour + h)
  in Clock {hours = newHours, minutes = newMinutes}
