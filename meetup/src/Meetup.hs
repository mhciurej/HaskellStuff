module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, dayOfWeek, fromGregorian, gregorianMonthLength, DayOfMonth, toGregorian)
import Data.Time.Calendar (DayOfWeek(..))
import Data.Tuple.Extra (thd3)

-- to review

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday

(==) :: Weekday -> DayOfWeek -> Bool
(==) Meetup.Monday Data.Time.Calendar.Monday = True
(==) Meetup.Tuesday Data.Time.Calendar.Tuesday = True
(==) Meetup.Wednesday Data.Time.Calendar.Wednesday = True
(==) Meetup.Thursday Data.Time.Calendar.Thursday = True
(==) Meetup.Friday Data.Time.Calendar.Friday = True
(==) Meetup.Saturday Data.Time.Calendar.Saturday = True
(==) Meetup.Sunday Data.Time.Calendar.Sunday = True
(==) _ _ = False

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth

sheduler :: Schedule -> [Day] -> Day
sheduler First = (!! 0)
sheduler Second = (!! 1)
sheduler Third = (!! 2)
sheduler Fourth = (!! 3)
sheduler Last = last
sheduler Teenth = head . filter ((&&) <$> (>= 13) . thd3 . toGregorian <*> (<= 19) . thd3 . toGregorian)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = 
    sheduler schedule . filter ((weekday Meetup.== ) . dayOfWeek)
    $ [fromGregorian year month 1..fromGregorian year month (gregorianMonthLength year month)]
