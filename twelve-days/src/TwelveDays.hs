module TwelveDays (recite) where

numbers = ["", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

presents = [
    "",
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, and ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, "]

constructAVerse :: Int -> String
constructAVerse n = "On the " ++ numbers !! n ++ " day of Christmas my true love gave to me: " ++ foldr (\elem acc -> acc ++ presents !! elem) "" [1..n]

recite :: Int -> Int -> [String]
recite start stop = map constructAVerse [start..stop]
